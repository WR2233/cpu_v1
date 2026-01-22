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

// パラメータ (finvと一致させる)
const int ADDR_WIDTH = 10;

// ================================================================
// Module: finv_pipeline (既存ロジック)
// ================================================================
static uint32_t simulate_finv(uint32_t a, const std::vector<uint64_t> &bram)
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
    // uint32_t final_exp = (253 - a_exp) & 0xFF;
    uint32_t final_exp = (254 - a_exp) & 0xFF;

    // 4. 結果の組み立て
    uint32_t result_s3 = (a_sign << 31) | (final_exp << 23) | final_mant;

    return result_s3;
}

// ================================================================
// Module: fmul_pipeline (既存ロジック)
// ================================================================
static uint32_t simulate_fmul(uint32_t a, uint32_t b)
{

    //================================================================
    // STAGE 1: デコード、部分積、指数計算
    //================================================================

    // デコード
    uint32_t a_sign = (a >> 31) & 0x1;
    uint32_t a_exp = (a >> 23) & 0xFF;
    uint32_t a_mant = a & 0x7FFFFF;

    uint32_t b_sign = (b >> 31) & 0x1;
    uint32_t b_exp = (b >> 23) & 0xFF;
    uint32_t b_mant = b & 0x7FFFFF;

    // 正規化数の暗黙の '1' (ケチビット) を追加 -> 24bit
    uint32_t m1 = (1 << 23) | a_mant;
    uint32_t m2 = (1 << 23) | b_mant;

    // S1 ロジック
    // m1[23:0] -> H=[23:11] (13bit), L=[10:0] (11bit)
    uint32_t m1_H = (m1 >> 11) & 0x1FFF; // 13 bit
    uint32_t m1_L = m1 & 0x7FF;          // 11 bit
    uint32_t m2_H = (m2 >> 11) & 0x1FFF; // 13 bit
    uint32_t m2_L = m2 & 0x7FF;          // 11 bit

    // 1. 部分積の計算 (uint64_t で計算してビット幅を意識する)
    // HH (13bit * 13bit -> 26bit)
    uint64_t HH = (uint64_t)m1_H * m2_H;
    // HL (13bit * 11bit -> 24bit)
    uint64_t HL = (uint64_t)m1_H * m2_L;
    // LH (11bit * 13bit -> 24bit)
    uint64_t LH = (uint64_t)m1_L * m2_H;

    // 2. 指数部の計算 (Verilog: assign exp_sum_s1 = ... + 9'd129)
    // 9ビット幅での加算を模倣するため、計算後に 0x1FF でマスクする
    uint32_t raw_exp_sum = a_exp + b_exp + 129;
    uint32_t exp_sum_s1 = raw_exp_sum & 0x1FF; // logic [8:0]

    // 3. 符号部 XOR
    uint32_t sign_s1 = a_sign ^ b_sign;

    // S1 アンダーフロー/オーバーフロー/ゼロ検出
    // assign underflow_overflow_s1 = ~exp_sum_s1[8];
    uint32_t underflow_overflow_s1 = (~(exp_sum_s1 >> 8)) & 0x1;

    // assign zero_input_s1 = (a_exp == 8'd0) | (b_exp == 8'd0);
    uint32_t zero_input_s1 = (a_exp == 0) || (b_exp == 0);

    // assign force_zero_s1 = underflow_overflow_s1 | zero_input_s1;
    uint32_t force_zero_s1 = underflow_overflow_s1 | zero_input_s1;

    // (パイプラインレジスタ S1->S2 は変数渡しで代用)

    //================================================================
    // STAGE 2: 仮数部加算
    //================================================================

    // 1. mant_sum_s2 = HH + (HL>>11) + (LH>>11) + 2
    // Verilogではすべて加算してから 26bit (logic [25:0]) に収めている
    uint64_t mant_sum_calc = HH + (HL >> 11) + (LH >> 11) + 2;
    uint32_t mant_sum_s2 = mant_sum_calc & 0x3FFFFFF; // 26 bits

    // 2. 指数部に1足したもの
    uint32_t exp_s2_plus1 = (exp_sum_s1 + 1) & 0x1FF; // 9 bits

    // (パイプラインレジスタ S2->S3)
    uint32_t mant_sum_s3 = mant_sum_s2;
    uint32_t exp_s3 = exp_sum_s1;
    uint32_t exp_s3_plus1 = exp_s2_plus1;
    uint32_t sign_s3 = sign_s1;
    uint32_t force_zero_s3 = force_zero_s1;

    //================================================================
    // STAGE 3: 正規化、アセンブル
    //================================================================

    // 1. 正規化ビット判定 (mant_sum_s3[25])
    uint32_t norm_bit_s3 = (mant_sum_s3 >> 25) & 0x1;

    // 指数部の選択 (下位8ビット)
    uint32_t final_exp_s3;
    if (norm_bit_s3)
    {
        final_exp_s3 = exp_s3_plus1 & 0xFF;
    }
    else
    {
        final_exp_s3 = exp_s3 & 0xFF;
    }

    // 2. 仮数部を正規化 (23bit)
    uint32_t final_mant_s3;
    if (norm_bit_s3)
    {
        // [24:2]
        final_mant_s3 = (mant_sum_s3 >> 2) & 0x7FFFFF;
    }
    else
    {
        // [23:1]
        final_mant_s3 = (mant_sum_s3 >> 1) & 0x7FFFFF;
    }

    // 3. 結果の組み立て
    uint32_t result_s3;
    if (force_zero_s3)
    {
        result_s3 = 0;
    }
    else
    {
        result_s3 = (sign_s3 << 31) | (final_exp_s3 << 23) | final_mant_s3;
    }

    return result_s3;
}

// ================================================================
// Module: fdiv_sim (Combined)
// ================================================================
uint32_t simulate_fdiv(uint32_t a, uint32_t b, const std::vector<uint64_t> &bram)
{
    // ステップ 1: 1/b を計算
    uint32_t inv_b = simulate_finv(b, bram);

    // ステップ 2: a * (1/b) を計算
    uint32_t result = simulate_fmul(a, inv_b);

    return result;
}
