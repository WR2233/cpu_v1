#include <iostream>
#include <vector>
#include <cstdint> // For uint32_t, uint64_t
#include <string>
#include <cmath>   // For std::round
#include <iomanip> // For std::hex, std::setw, std::setfill
#include <sstream> // For std::stringstream
#include <cstring> // For memcpy
#include <bitset>
#include <map>     // For std::map (ULPエラー集計用)
#include <cstdlib> // For std::abs
#include <fstream>

// BRAMのパラメータ (Verilog/Pythonと一致)
const int ADDR_WIDTH = 10;

/**
 * @brief Verilogの finv_pipeline の組合せロジックをシミュレートする
 * @param a 入力 (32bit float)
 * @param bram 初期化済みのBRAMデータ
 * @return result (32bit float)
 */
uint32_t simulate_finv(uint32_t a, const std::vector<uint64_t> &bram)
{

    // --- STAGE 1: デコード と BRAM読み出し ---
    uint32_t a_sign = (a >> 31) & 0x1;
    uint32_t a_exp = (a >> 23) & 0xFF;
    uint32_t a_mant = a & 0x7FFFFF;

    // addra = a_mant[22:13]
    uint32_t addra = (a_mant >> (23 - ADDR_WIDTH)) & ((1 << ADDR_WIDTH) - 1);

    // mant_frac_s2 = a_mant[12:0]
    uint32_t mant_frac_s2 = a_mant & ((1 << (23 - ADDR_WIDTH)) - 1);

    // BRAM Read
    uint64_t initial_inv = bram[addra];

    // --- STAGE 2: 近似 (乗算) ---
    // gradient_s2 = initial_inv[35:23] (13 bit)
    uint64_t gradient_s2 = (initial_inv >> 23) & 0x1FFF;
    // constant_s2 = initial_inv[22:0] (23 bit)
    uint64_t constant_s2 = initial_inv & 0x7FFFFF;

    // mult_result_s2 = gradient_s2 * mant_frac_s2 (26 bit)
    uint64_t mult_result_s2 = gradient_s2 * mant_frac_s2;

    // --- STAGE 3: 減算と指数計算 ---

    // 1. G_term の計算 (Verilogの [25:10] スライス + ゼロ拡張)
    // G_term = {7'b0, mant_result_s3[25:10]}
    // スライス [25:10] は 16 ビット
    // これは (mult_result_s2 >> 10) の下位16ビット
    uint64_t g_term_slice = (mult_result_s2 >> 10) & 0xFFFF; // [25:10]
    // 23ビットにゼロ拡張
    uint64_t g_term = g_term_slice;

    // 2. 近似値の計算 (final_mant)
    // Verilogの減算は2の補数で行われる
    int64_t final_mant_calc = static_cast<int64_t>(constant_s2) - static_cast<int64_t>(g_term);
    uint32_t final_mant = final_mant_calc & 0x7FFFFF; // 23 bit

    // 3. 指数部の計算 (final_exp)
    // assign final_exp = 8'd253 - exp_s3;
    uint32_t final_exp = (253 - a_exp) & 0xFF;

    // 4. 結果の組み立て
    uint32_t result_s3 = (a_sign << 31) | (final_exp << 23) | final_mant;

    return result_s3;
}
