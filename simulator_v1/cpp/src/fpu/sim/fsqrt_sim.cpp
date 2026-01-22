#include <iostream>
#include <vector>
#include <cstdint> // For uint32_t, uint64_t
// ... (既存の #include は省略) ...
#include <fstream> // For std::ifstream (COE読み込み)
#include <map>     // For std::map (ULP集計)
#include <limits>  // For std::numeric_limits
#include <iomanip> // For std::setw, std::setfill
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
 * @brief Pythonの generate_fsqrt_coe() をC++で再現し、BRAMデータを生成する
 * @param bram BRAMデータを格納するベクタ (2048エントリ)
 */
void generate_bram_data_fsqrt(std::vector<uint64_t> &bram)
{
    bram.resize(NUM_ENTRIES);

    for (int addr = 0; addr < NUM_ENTRIES; ++addr)
    {
        // 1. A0 (12bitキー) の計算
        uint64_t A0_tmp = addr & 0x3FF;
        uint64_t A0_norm = (1ULL << 10) | A0_tmp; // [1024, 2047]
        uint64_t A0 = (addr & 0x400) ? (A0_norm << 1) : A0_norm;

        // 2. X0 (初期値) の計算
        double A0_d = static_cast<double>(A0);
        double scale36 = static_cast<double>(1ULL << 36);
        double x_start = std::sqrt(A0_d * scale36);
        double x_end = std::sqrt((A0_d + 1.0) * scale36);
        double x0_float = (x_start + x_end) / 2.0;
        int64_t x0 = static_cast<int64_t>(std::round(x0_float));

        // 3. C (定数項、23bit) の計算 (2^23 スケール)
        double x0_d = static_cast<double>(x0);
        double term1_c = x0_d / 2.0;
        double term2_c = (A0_d * scale36) / (2.0 * x0_d);
        double term_c_float = term1_c + term2_c;
        int64_t term_c = static_cast<int64_t>(std::round(term_c_float));
        uint64_t c_bram = term_c & 0x7FFFFF;

        // 4. G (勾配項、13bit) の計算
        uint64_t term_g_num = 1ULL << 46;
        uint64_t term_g_den = 2 * static_cast<uint64_t>(x0);
        uint64_t g_full = (term_g_num + (term_g_den / 2)) / term_g_den; // 丸め
        uint64_t g_full_adjust = g_full / (1ULL << 9);                  // Python: // (1 << 9)
        uint64_t g_bram = g_full_adjust & 0x1FFF;

        // 5. 36bitデータを結合 [35:23] = G, [22:0] = C
        bram[addr] = (g_bram << 23) | c_bram;
    }
}

//================================================================
// STAGE 2 & 3: Verilogロジックシミュレーション
//================================================================
/**
 * @brief Verilogの fsqrt_pipeline の組合せロジックをシミュレートする
 * @param a 入力 (32bit float)
 * @param bram 初期化済みのBRAMデータ
 * @return result (32bit float)
 */
uint32_t simulate_fsqrt(uint32_t a, const std::vector<uint64_t> &bram)
{

    // --- STAGE 1: デコード と BRAM読み出し ---
    uint32_t a_sign = (a >> 31) & 0x1;
    uint32_t a_exp = (a >> 23) & 0xFF;
    uint32_t a_mant = a & 0x7FFFFF;

    // 特殊な入力値の処理 (標準IEEE 754ルール)
    if (a_exp == 0xFF)
    { // Inf または NaN
        if (a_mant != 0)
            return 0xFFC00000; // 入力がNaN (qNaNを返す)
        if (a_sign == 1)
            return 0xFFC00000; // sqrt(-Inf) = NaN
        return 0x7F800000;     // sqrt(+Inf) = +Inf
    }
    if (a_exp == 0 && a_mant == 0)
    {                                                   // Zero
        return (a_sign == 1) ? 0x80000000 : 0x00000000; // sqrt(±0) = ±0
    }
    if (a_sign == 1)
    {                      // 負の数
        return 0xFFC00000; // sqrt(-x) = NaN
    }

    // BRAM アドレス計算 (Verilog: assign addra = {~a_exp[0], a_mant[22:13]};)
    uint32_t addra_msb = (~(a_exp & 0x1)) & 0x1;
    uint32_t addra_lsb = (a_mant >> (23 - ADDR_MANT_WIDTH)) & ((1 << ADDR_MANT_WIDTH) - 1);
    uint32_t addra = (addra_msb << ADDR_MANT_WIDTH) | addra_lsb;

    // mant_frac_s2 = a_mant[12:0] (Verilog: a_mant[FRAC_MANT_WIDTH-1:0])
    uint32_t mant_frac_s2 = a_mant & ((1 << FRAC_MANT_WIDTH) - 1);

    // BRAM Read
    uint64_t initial_sqrt = bram[addra];

    // --- STAGE 2: 近似 (乗算) ---
    // gradient_s2 = initial_sqrt[35:23] (13 bit)
    uint64_t gradient_s2 = (initial_sqrt >> 23) & 0x1FFF;
    // constant_s2 = initial_sqrt[22:0] (23 bit)
    uint64_t constant_s2 = initial_sqrt & 0x7FFFFF;

    // mult_result_s2 = gradient_s2 * mant_frac_s2 (13b * 13b = 26 bit)
    uint64_t mult_result_s2 = gradient_s2 * mant_frac_s2;

    // --- STAGE 3: 加算と指数計算 ---

    // 1. mant_result_shifted の計算 (Verilog ロジック)
    // assign mant_result_shifted = (~exp_s3[0]) ? {mant_result_s3, 1'b0} : {1'b0, mant_result_s3};
    uint64_t mant_result_shifted; // 27 bit
    if ((a_exp & 0x1) == 0)
    { // 偶数指数
        mant_result_shifted = mult_result_s2 << 1;
    }
    else
    { // 奇数指数
        mant_result_shifted = mult_result_s2;
    }

    // 2. final_mant の計算 (Verilog ロジック)
    // assign final_mant = {constant_s3, 3'b0} + {10'b0, mant_result_shifted[...:11]};
    uint64_t term_c = constant_s2 << 3; // {C, 3'b0}
    // Verilog: {10'b0, mant_result_shifted[16:0]} (16 = 27-11)
    // (mant_result_shifted >> 11) の下位16ビットを取得
    uint64_t term_g = (mant_result_shifted >> 11) & 0xFFFF;

    uint64_t final_mant_26b = term_c + term_g;

    // 3. shifted_mant_result (最終仮数部)
    // assign shifted_mant_result = final_mant[25:3];
    uint32_t final_mant = (final_mant_26b >> 3) & 0x7FFFFF; // 上位23bit

    // 4. 指数部の計算 (final_exp)
    // assign final_exp = ({1'b0, exp_s3} + 127) >> 1;
    uint32_t final_exp = ((a_exp + 127) >> 1) & 0xFF;

    // 5. 結果の組み立て
    uint32_t result_s3 = (a_sign << 31) | (final_exp << 23) | final_mant;

    return result_s3;
}
