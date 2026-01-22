#include <iostream>
#include <vector>
#include <cstdint>
#include <string>
#include <cmath>
#include <iomanip>
#include <sstream>
#include <cstring>
#include <bitset>
#include <algorithm>

// 名前空間の衝突（std::roundなど）を防ぐため、using namespace std; は避けます
using std::cerr;
using std::cout;
using std::endl;
using std::string;
using std::vector;

// ================================================================
// Module: sticky_right_shifter
// ================================================================
static uint32_t simulate_sticky_right_shifter(uint32_t data_in, uint32_t shift_amount)
{
    // Parameter
    const int IN_WIDTH = 27;
    // const int SHIFT_WIDTH = 8;

    // Internal signals
    uint32_t shifted_data;
    uint32_t sticky_bit;
    uint32_t data_out;

    // assign shifted_data = data_in >> shift_amount;
    // (C++のシフト演算子の仕様上、32bit以上シフトしないようガード)
    if (shift_amount >= 32)
    {
        shifted_data = 0;
    }
    else
    {
        shifted_data = data_in >> shift_amount;
    }

    // always_comb begin
    uint32_t mask;
    sticky_bit = 0;

    if (shift_amount > 0)
    {
        if (shift_amount >= IN_WIDTH)
        {
            sticky_bit = (data_in != 0) ? 1 : 0;
        }
        else
        {
            // mask = (IN_WIDTH'(1) << (shift_amount - 1));
            // mask = mask - 1;
            // sticky_bit = |(data_in & mask);

            // C++での再現
            mask = (1 << (shift_amount - 1));
            mask = mask - 1;
            sticky_bit = ((data_in & mask) != 0) ? 1 : 0;
        }
    }
    // end

    // assign data_out = {shifted_data[IN_WIDTH-1:1], sticky_bit};
    // ビット結合の再現
    uint32_t top_part = (shifted_data >> 1) & 0x3FFFFFF; // [26:1] (26bit)
    data_out = (top_part << 1) | sticky_bit;

    return data_out;
}

// ================================================================
// Module: leading_zero_counter
// ================================================================
static uint32_t simulate_leading_zero_counter(uint32_t data_in)
{
    // input logic [25:0] data_in
    uint32_t count = 26;

    // always_comb (Priority Encoder)
    if ((data_in >> 25) & 1)
        count = 0;
    else if ((data_in >> 24) & 1)
        count = 1;
    else if ((data_in >> 23) & 1)
        count = 2;
    else if ((data_in >> 22) & 1)
        count = 3;
    else if ((data_in >> 21) & 1)
        count = 4;
    else if ((data_in >> 20) & 1)
        count = 5;
    else if ((data_in >> 19) & 1)
        count = 6;
    else if ((data_in >> 18) & 1)
        count = 7;
    else if ((data_in >> 17) & 1)
        count = 8;
    else if ((data_in >> 16) & 1)
        count = 9;
    else if ((data_in >> 15) & 1)
        count = 10;
    else if ((data_in >> 14) & 1)
        count = 11;
    else if ((data_in >> 13) & 1)
        count = 12;
    else if ((data_in >> 12) & 1)
        count = 13;
    else if ((data_in >> 11) & 1)
        count = 14;
    else if ((data_in >> 10) & 1)
        count = 15;
    else if ((data_in >> 9) & 1)
        count = 16;
    else if ((data_in >> 8) & 1)
        count = 17;
    else if ((data_in >> 7) & 1)
        count = 18;
    else if ((data_in >> 6) & 1)
        count = 19;
    else if ((data_in >> 5) & 1)
        count = 20;
    else if ((data_in >> 4) & 1)
        count = 21;
    else if ((data_in >> 3) & 1)
        count = 22;
    else if ((data_in >> 2) & 1)
        count = 23;
    else if ((data_in >> 1) & 1)
        count = 24;
    else if ((data_in >> 0) & 1)
        count = 25;
    else
        count = 26;

    return count;
}

// ================================================================
// Module: fsub_pipeline
// ================================================================
uint32_t simulate_fsub(uint32_t input_a, uint32_t input_b)
{

    // 入力レジスタ (Verilog: always_ff @... a <= input_a ...)
    uint32_t a = input_a;
    uint32_t b = input_b;

    // ================================================================
    // STAGE 1: 比較、アライメント（右シフト）
    // ================================================================

    // --- S1 入力デコード ---
    uint32_t a_sign = (a >> 31) & 0x1;
    uint32_t a_exp = (a >> 23) & 0xFF;
    uint32_t a_mant = a & 0x7FFFFF;
    uint32_t a_is_zero = (a_exp == 0) && (a_mant == 0);

    uint32_t b_sign = (b >> 31) & 0x1;
    b_sign = b_sign ^ 0x1; // fsubなのでbの符号を反転
    uint32_t b_exp = (b >> 23) & 0xFF;
    uint32_t b_mant = b & 0x7FFFFF;
    uint32_t b_is_zero = (b_exp == 0) && (b_mant == 0);

    // ケチビットとGRSビット(000)を追加
    uint32_t a_mant_ext = (a_is_zero) ? 0 : ((1 << 23) | a_mant) << 3; // 27 bits
    uint32_t b_mant_ext = (b_is_zero) ? 0 : ((1 << 23) | b_mant) << 3; // 27 bits

    // --- S1 ロジック ---
    uint32_t a_is_bigger;
    // assign a_is_bigger = (a_exp > b_exp) || ((a_exp == b_exp) && (a_mant >= b_mant));
    if (a_exp > b_exp)
        a_is_bigger = 1;
    else if ((a_exp == b_exp) && (a_mant >= b_mant))
        a_is_bigger = 1;
    else
        a_is_bigger = 0;

    // assign exp_diff = ...
    uint32_t exp_diff = (a_is_bigger) ? (a_exp - b_exp) : (b_exp - a_exp);

    // assign big_mant, small_mant, big_exp, big_sign ...
    uint32_t big_mant = (a_is_bigger) ? a_mant_ext : b_mant_ext;
    uint32_t small_mant = (a_is_bigger) ? b_mant_ext : a_mant_ext;
    uint32_t big_exp = (a_is_bigger) ? a_exp : b_exp;
    uint32_t big_sign = (a_is_bigger) ? a_sign : b_sign;

    uint32_t is_subtraction = a_sign ^ b_sign;

    // u_shifter (sticky_right_shifter)
    uint32_t shifted_small_mant = simulate_sticky_right_shifter(small_mant, exp_diff);

    // --- S1 -> S2 レジスタ (変数名を完全一致) ---
    uint32_t big_mant_s2 = big_mant;
    uint32_t shifted_small_mant_s2 = shifted_small_mant;
    uint32_t big_exp_s2 = big_exp;
    uint32_t big_sign_s2 = big_sign;
    uint32_t is_subtraction_s2 = is_subtraction;

    // ================================================================
    // STAGE 2: 演算 (28bit)、ZLC、丸め準備
    // ================================================================

    // --- S2 ロジック ---
    uint32_t adder_a;     // logic [27:0]
    uint32_t adder_b;     // logic [27:0]
    uint32_t mant_result; // logic [27:0]

    // assign adder_a = {1'b0, big_mant_s2};
    adder_a = big_mant_s2; // C++では変数は32bitあるのでそのまま代入(上位0)

    // assign adder_b = (is_subtraction_s2) ? ~{1'b0, shifted_small_mant_s2} + 1'b1 : ...
    if (is_subtraction_s2)
    {
        // 28bit幅でのNOTと+1
        adder_b = (~shifted_small_mant_s2) & 0x0FFFFFFF;
        adder_b = (adder_b + 1) & 0x0FFFFFFF;
    }
    else
    {
        adder_b = shifted_small_mant_s2;
    }

    // assign mant_result = adder_a + adder_b;
    mant_result = (adder_a + adder_b) & 0x0FFFFFFF; // 28bitマスク

    // u_zlc (leading_zero_counter)
    // .data_in(mant_result[27:2])
    uint32_t zlc_input = (mant_result >> 2) & 0x03FFFFFF; // [27:2] -> 26bits
    uint32_t zlc_count = simulate_leading_zero_counter(zlc_input);

    // 丸め判定ロジック
    uint32_t grs_bits = mant_result & 0x7; // [2:0]
    uint32_t lsb = (mant_result >> 3) & 1; // [3]
    uint32_t guard = (grs_bits >> 2) & 1;
    uint32_t round = (grs_bits >> 1) & 1; // 変数名 round (std::roundと衝突回避済み)
    uint32_t sticky = (grs_bits >> 0) & 1;

    // assign round_up = guard & (round | sticky | lsb);
    uint32_t round_up = guard & (round | sticky | lsb);

    // assign all_ones = &mant_result[26:3];
    // [26:3] (24bit) がすべて1かどうか
    uint32_t check_bits = (mant_result >> 3) & 0xFFFFFF;
    uint32_t all_ones = (check_bits == 0xFFFFFF) ? 1 : 0;

    // assign exp_carry_for_round = ...
    uint32_t exp_carry_for_round = (zlc_count <= 2) && (all_ones) && (round_up);

    // assign mant_shifted1 = mant_result << zlc_count[1:0];
    uint32_t shift1_amt = zlc_count & 0x3; // [1:0]
    uint32_t mant_shifted1 = (mant_result << shift1_amt) & 0x0FFFFFFF;

    // assign round_term = ...
    uint32_t round_term = (zlc_count <= 2) ? round_up : 0;

    // --- S2 -> S3 レジスタ (変数名を完全一致) ---
    // S2ロジック内で計算される big_exp_s3 への前処理 (S2ロジック内の代入: big_exp_s2 + exp_carry)
    // Verilogのalways_ff内: big_exp_s3 <= big_exp_s2 + exp_carry_for_round;
    uint32_t big_exp_s3 = big_exp_s2 + exp_carry_for_round;
    uint32_t big_sign_s3 = big_sign_s2;
    uint32_t zlc_count_s3 = zlc_count;
    // uint32_t exp_carry_for_round_s3 = exp_carry_for_round; // 未使用だがレジスタにはある
    uint32_t mant_shifted1_s3 = mant_shifted1;
    uint32_t round_term_s3 = round_term;
    // uint32_t is_subtraction_s3      = is_subtraction_s2;

    // ================================================================
    // STAGE 3: 正規化 (シフト)、丸め実行、結合
    // ================================================================

    // --- S3 ロジック ---
    // assign zlc_high_bits = zlc_count_s3[4:2];
    uint32_t zlc_high_bits = (zlc_count_s3 >> 2) & 0x7;

    // assign mant_shifted2 = (mant_shifted1_s3 << {zlc_high_bits, 2'b0});
    uint32_t shift2_amt = (zlc_high_bits << 2);
    uint32_t mant_shifted2 = (mant_shifted1_s3 << shift2_amt) & 0x0FFFFFFF;

    // assign mant_rounded = mant_shifted2 + (round_term_s3 << 2);
    uint32_t mant_rounded = (mant_shifted2 + (round_term_s3 << 2)) & 0x0FFFFFFF;

    // assign exp_sub_zlc = big_exp_s3 - (zlc_count_s3 - 1);
    // 符号付き計算として扱う
    int32_t exp_sub_zlc_val = (int32_t)big_exp_s3 - ((int32_t)zlc_count_s3 - 1);

    // assign is_zero_result = (zlc_count_s3 >= 26) | (exp_sub_zlc[8] == 1'b1);
    // exp_sub_zlc[8] == 1'b1 は 9bit目、つまり負の数かどうかと同義
    uint32_t is_zero_result = (zlc_count_s3 >= 26) || (exp_sub_zlc_val < 0) || ((exp_sub_zlc_val >> 8) & 1);

    // assign final_exp = (is_zero_result) ? 8'd0 : exp_sub_zlc;
    uint32_t final_exp = (is_zero_result) ? 0 : (exp_sub_zlc_val & 0xFF);

    // assign final_mant = (is_zero_result) ? 23'd0 : mant_rounded[26:4];
    uint32_t final_mant = (is_zero_result) ? 0 : (mant_rounded >> 4) & 0x7FFFFF;

    // assign final_sign = ...
    uint32_t final_sign = (is_zero_result) ? 0 : big_sign_s3;

    // assign result_s3 = {final_sign, final_exp, final_mant};
    uint32_t result_s3 = (final_sign << 31) | (final_exp << 23) | final_mant;

    // --- Output Register ---
    return result_s3;
}
