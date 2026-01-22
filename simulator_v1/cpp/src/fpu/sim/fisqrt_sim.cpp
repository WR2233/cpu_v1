#include <iostream>
#include <vector>
#include <cstdint> // For uint32_t, uint64_t
#include <string>
#include <cmath>     // For std::round, std::sqrt, std::isnan, std::isinf, std::signbit, INFINITY, NAN
#include <iomanip>   // For std::hex, std::setw, std::setfill
#include <sstream>   // For std::stringstream
#include <cstring>   // For memcpy
#include <bitset>    // For std::bitset
#include <stdexcept> // For std::runtime_error

#include <iostream>
#include <vector>
#include <cstdint> // For uint32_t, uint64_t
#include <string>
#include <cmath>     // For std::round, std::sqrt, std::isnan, std::isinf, std::signbit, INFINITY, NAN
#include <iomanip>   // For std::hex, std::setw, std::setfill
#include <sstream>   // For std::stringstream
#include <cstring>   // For memcpy
#include <bitset>    // For std::bitset
#include <stdexcept> // For std::runtime_error
#include <iostream>
#include <vector>
#include <cstdint> // For uint32_t, uint64_t
#include <string>
#include <cmath>     // For std::round, std::sqrt, std::isnan
#include <iomanip>   // For std::hex, std::setw, std::setfill
#include <sstream>   // For std::stringstream
#include <cstring>   // For memcpy
#include <bitset>    // For std::bitset
#include <stdexcept> // For std::runtime_error
#include <fstream>   // For std::ifstream (COE読み込み)
#include <map>       // For std::map (ULP集計)

//================================================================
// BRAMのパラメータ (Python/Verilogと一致)
//================================================================
const int ADDR_WIDTH_SQRT = 11;
const int NUM_ENTRIES = 1 << ADDR_WIDTH_SQRT; // 2048
const int ADDR_MANT_WIDTH = 10;
const int FRAC_MANT_WIDTH = 13;

//================================================================
// STAGE 1: BRAMデータ生成 (PythonロジックのC++版)
//================================================================
/**
 * @brief Pythonの generate_fisqrt_coe() をC++で再現し、FISQRT用BRAMデータを生成する
 * @param bram BRAMデータを格納するベクタ (2048エントリ)
 */
void generate_bram_data_fisqrt(std::vector<uint64_t> &bram)
{
    bram.resize(NUM_ENTRIES);

    for (int addr = 0; addr < NUM_ENTRIES; ++addr)
    {
        // 1. A0 (12bitキー) の計算 (Verilog/Python と一致)
        // Verilog: addra[10] = ~a_exp[0]
        // Python: addr[10] = (addr & 0x400)
        // Verilogの ~a_exp[0] が 1 (偶数) の場合、addr[10] (0x400) は 1
        // Verilogの ~a_exp[0] が 0 (奇数) の場合、addr[10] (0x400) は 0
        // Pythonコードの (addr & 0x400) は「奇数指数」ではなく「Verilogのaddra[10]が1」を意味すると解釈

        uint64_t A0_tmp = addr & 0x3FF;           // M[22:13] (10bit)
        uint64_t A0_norm = (1ULL << 10) | A0_tmp; // [1024, 2047] (1.M)

        uint64_t A0;

        // Verilogの addra[10] (~a_exp[0]) が 1 (偶数指数)
        // Pythonの (addr & 0x400) != 0
        if (addr & 0x400)
        {
            // 奇数指数 (Verilog: ~a_exp[0] = 0)
            // Python: A0 = A0_norm << 1 [2048, 4094] (範囲 [2.0, 4.0))
            A0 = A0_norm << 1;
        }
        else
        {
            // 偶数指数 (Verilog: ~a_exp[0] = 1)
            // Python: A0 = A0_norm [1024, 2047] (範囲 [1.0, 2.0))
            A0 = A0_norm;
        }

        // 2. X0 (初期値) の計算 (Python ロジック: 1/sqrt(A0) の近似)
        double A0_d = static_cast<double>(A0);
        double scale36 = static_cast<double>(1ULL << 36);
        double x_start = std::sqrt(A0_d * scale36);
        double x_end = std::sqrt((A0_d + 1.0) * scale36);

        double scale46 = static_cast<double>(1ULL << 46);
        double x_start_i = scale46 / x_start;
        double x_end_i = scale46 / x_end;
        double x0_float = (x_start_i + x_end_i) / 2.0;

        // 3. C (定数項、23bit) の計算 (Python ロジック)
        double scale13 = static_cast<double>(1ULL << 13);
        double scale23 = static_cast<double>(1ULL << 23);
        double x0_pow3 = x0_float * x0_float * x0_float;

        // Y(A) = 3/2 X - (A/2) X^3
        double term_c_float = (x0_float * 3.0 / 2.0) - (A0_d * scale13 * x0_pow3) / (2.0 * scale23) / (scale46);

        // Python: term_c = int(round(term_c_float*2.0))
        int64_t c_full = static_cast<int64_t>(std::round(term_c_float * 2.0));
        uint64_t c_bram = c_full & 0x7FFFFF;

        // 4. G (勾配項、13bit) の計算 (Python ロジック)
        // G = (3/2) * X^3
        double term_g_den_d = static_cast<double>(1ULL << (70 - 14));
        double term_g_num_d = x0_pow3;

        // Python: g_full = (term_g_num + (term_g_den // 2)) // term_g_den
        int64_t g_full = (term_g_num_d + (term_g_den_d / 2)) / term_g_den_d;

        uint64_t g_bram = static_cast<int64_t>(g_full) & 0x1FFF;

        // 5. 36bitデータを結合 [35:23] = G, [22:0] = C
        bram[addr] = (g_bram << 23) | c_bram;
    }
}

//================================================================
// STAGE 2 & 3: Verilogロジックシミュレーション
//================================================================
/**
 * @brief Verilogの fisqrt_pipeline の組合せロジックをシミュレートする
 * @param a 入力 (32bit float)
 * @param bram 初期化済みのBRAMデータ
 * @return result (32bit float)
 */
uint32_t simulate_fisqrt(uint32_t a, const std::vector<uint64_t> &bram)
{

    // --- STAGE 1: デコード (Verilog S1) ---
    uint32_t a_sign = (a >> 31) & 0x1;
    uint32_t a_exp = (a >> 23) & 0xFF;
    uint32_t a_mant = a & 0x7FFFFF;

    // VerilogのS3にある 'is_minus' (sign_s3) のチェック
    // assign final_result = (is_minus) ? 32'h0000_0000 : result_s3;
    // Verilogは負の入力(sign=1)に対して 0x00000000 を返す
    if (a_sign == 1)
    {
        return 0x00000000;
    }

    // Verilogにはその他のInf/NaN/Zeroの明示的な処理はないため、
    // a_sign=1 以外の特殊処理はシミュレータから除外し、Verilogの動作を模倣する

    // BRAM アドレス計算 (Verilog: assign addra = {~a_exp[0], a_mant[22:13]};)
    // a_exp[0] が 0 (偶数) -> ~a_exp[0] = 1 -> addra[10] = 1
    // a_exp[0] が 1 (奇数) -> ~a_exp[0] = 0 -> addra[10] = 0
    uint32_t addra_msb = (~(a_exp & 0x1)) & 0x1; // Verilogの ~a_exp[0]
    uint32_t addra_lsb = (a_mant >> (23 - ADDR_MANT_WIDTH)) & ((1 << ADDR_MANT_WIDTH) - 1);
    uint32_t addra = (addra_msb << ADDR_MANT_WIDTH) | addra_lsb;

    // mant_frac_s2 = a_mant[12:0] (Verilog: a_mant[FRAC_MANT_WIDTH-1:0])
    uint32_t mant_frac_s2 = a_mant & ((1 << FRAC_MANT_WIDTH) - 1);

    // BRAM Read
    if (addra >= bram.size())
    {
        throw std::runtime_error("BRAM address out of bounds");
    }
    uint64_t initial_isqrt = bram[addra];

    // --- STAGE 2: 近似 (乗算) (Verilog S2) ---
    // gradient_s2 = initial_isqrt[35:23] (13 bit)
    uint64_t gradient_s2 = (initial_isqrt >> 23) & 0x1FFF;
    // constant_s2 = initial_isqrt[22:0] (23 bit)
    uint64_t constant_s2 = initial_isqrt & 0x7FFFFF;

    // mult_result_s2 = gradient_s2 * mant_frac_s2 (13b * 13b = 26 bit)
    uint64_t mult_result_s2 = gradient_s2 * static_cast<uint64_t>(mant_frac_s2);

    // --- STAGE 3: 加算と指数計算 (Verilog S3) ---

    // S2 -> S3 (パイプラインレジスタの模倣)
    uint64_t mant_result_s3 = mult_result_s2;
    uint64_t constant_s3 = constant_s2;
    uint32_t exp_s3 = a_exp;
    uint32_t sign_s3 = a_sign;

    // 1. mant_result_shifted の計算 (Verilog S3 ロジック)
    // assign mant_result_shifted = (~exp_s3[0]) ? {mant_result_s3, 1'b0} // 偶数
    //                                          : {1'b0, mant_result_s3}; // 奇数

    uint64_t mant_result_shifted; // 27 bit
    if ((exp_s3 & 0x1) == 0)
    { // 偶数指数 (~exp_s3[0] = 1)
        mant_result_shifted = mant_result_s3 << 1;
    }
    else
    { // 奇数指数 (~exp_s3[0] = 0)
        mant_result_shifted = mant_result_s3;
    }

    // 2. final_mant の計算 (Verilog S3 ロジック)
    // assign final_mant = {constant_s3, 3'b0} - {9'b0, mant_result_shifted[26:10]}; // 26bit

    uint64_t term_c = constant_s3 << 3; // {C, 3'b0} (23+3 = 26 bit)

    // mant_result_shifted[26:10] (17 bit)
    uint64_t g_shifted_val = (mant_result_shifted >> 10) & 0x1FFFF; // 17 bit
    // {9'b0, g_shifted_val} (Verilogでは 9'b0 で 26bit に拡張)
    uint64_t term_g = g_shifted_val;

    // Verilogは 26bit 幅で計算 (減算)
    uint64_t final_mant_26b = (term_c - term_g) & 0x3FFFFFF; // 26 bit

    // 3. shifted_mant_result (最終仮数部) (Verilog S3 ロジック)
    // assign shifted_mant_result = final_mant[25:3];
    uint32_t final_mant = (final_mant_26b >> 3) & 0x7FFFFF; // 上位23bit

    // 4. 指数部の計算 (final_exp) (Verilog S3 ロジック)
    // assign final_exp_bef = ({1'b0, exp_s3} + 127) >> 1;
    uint32_t final_exp_bef = ((exp_s3 + 127) >> 1);
    // assign final_exp = 8'd253 - final_exp_bef;
    uint32_t final_exp = (253 - final_exp_bef) & 0xFF;

    // 5. 結果の組み立て (Verilog S3 ロジック)
    // (sign_s3 は 0 のはず)
    uint32_t result_s3 = (sign_s3 << 31) | (final_exp << 23) | final_mant;

    // assign final_result = (is_minus) ? 32'h0000_0000 : result_s3;
    // (is_minus の処理は S3 の入力 (a_sign) で実施済み)

    return result_s3;
}