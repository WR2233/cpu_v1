#include <iostream>
#include <vector>
#include <cstdint>
#include <algorithm>

// Verilogの挙動を忠実に再現する名前空間
namespace verilog_sim
{

    // Helper: 2bitスライスの取得
    inline uint32_t get_slice(uint32_t val, int msb, int lsb)
    {
        return (val >> lsb) & ((1 << (msb - lsb + 1)) - 1);
    }

    // Verilogの lzc_count モジュールを「そのまま」再現
    // (論理圧縮せず、記述された通りの定数を返す実装)
    uint32_t lzc_count_sim(uint32_t in)
    {
        // --- Leaf Nodes (下位モジュール) ---
        // Verilog記述: (in[31:30] == 2'b00) ? 6'd2 : ...
        uint32_t count_30_31 = (get_slice(in, 31, 30) == 0) ? 2 : (get_slice(in, 31, 30) == 1) ? 1
                                                                                               : 0;

        uint32_t count_28_29 = (get_slice(in, 29, 28) == 0) ? 4 : (get_slice(in, 29, 28) == 1) ? 3
                                                                                               : 2;
        uint32_t count_26_27 = (get_slice(in, 27, 26) == 0) ? 6 : (get_slice(in, 27, 26) == 1) ? 5
                                                                                               : 4;
        uint32_t count_24_25 = (get_slice(in, 25, 24) == 0) ? 8 : (get_slice(in, 25, 24) == 1) ? 7
                                                                                               : 6;

        uint32_t count_22_23 = (get_slice(in, 23, 22) == 0) ? 10 : (get_slice(in, 23, 22) == 1) ? 9
                                                                                                : 8;
        uint32_t count_20_21 = (get_slice(in, 21, 20) == 0) ? 12 : (get_slice(in, 21, 20) == 1) ? 11
                                                                                                : 10;
        uint32_t count_18_19 = (get_slice(in, 19, 18) == 0) ? 14 : (get_slice(in, 19, 18) == 1) ? 13
                                                                                                : 12;
        uint32_t count_16_17 = (get_slice(in, 17, 16) == 0) ? 16 : (get_slice(in, 17, 16) == 1) ? 15
                                                                                                : 14;

        uint32_t count_14_15 = (get_slice(in, 15, 14) == 0) ? 18 : (get_slice(in, 15, 14) == 1) ? 17
                                                                                                : 16;
        uint32_t count_12_13 = (get_slice(in, 13, 12) == 0) ? 20 : (get_slice(in, 13, 12) == 1) ? 19
                                                                                                : 18;
        uint32_t count_10_11 = (get_slice(in, 11, 10) == 0) ? 22 : (get_slice(in, 11, 10) == 1) ? 21
                                                                                                : 20;
        uint32_t count_8_9 = (get_slice(in, 9, 8) == 0) ? 24 : (get_slice(in, 9, 8) == 1) ? 23
                                                                                          : 22;

        uint32_t count_6_7 = (get_slice(in, 7, 6) == 0) ? 26 : (get_slice(in, 7, 6) == 1) ? 25
                                                                                          : 24;
        uint32_t count_4_5 = (get_slice(in, 5, 4) == 0) ? 28 : (get_slice(in, 5, 4) == 1) ? 27
                                                                                          : 26;
        uint32_t count_2_3 = (get_slice(in, 3, 2) == 0) ? 30 : (get_slice(in, 3, 2) == 1) ? 29
                                                                                          : 28;
        uint32_t count_0_1 = (get_slice(in, 1, 0) == 0) ? 32 : (get_slice(in, 1, 0) == 1) ? 31
                                                                                          : 30;

        // --- Tree Logic (選択ロジック) ---
        uint32_t count_28_31 = (count_30_31 == 2) ? count_28_29 : count_30_31;
        uint32_t count_24_27 = (count_26_27 == 6) ? count_24_25 : count_26_27;
        uint32_t count_20_23 = (count_22_23 == 10) ? count_20_21 : count_22_23;
        uint32_t count_16_19 = (count_18_19 == 14) ? count_16_17 : count_18_19;
        uint32_t count_12_15 = (count_14_15 == 18) ? count_12_13 : count_14_15;
        uint32_t count_8_11 = (count_10_11 == 22) ? count_8_9 : count_10_11;
        uint32_t count_4_7 = (count_6_7 == 26) ? count_4_5 : count_6_7;
        uint32_t count_0_3 = (count_2_3 == 30) ? count_0_1 : count_2_3;

        uint32_t count_24_31 = (count_28_31 == 4) ? count_24_27 : count_28_31;
        uint32_t count_16_23 = (count_20_23 == 12) ? count_16_19 : count_20_23;
        uint32_t count_8_15 = (count_12_15 == 20) ? count_8_11 : count_12_15;
        uint32_t count_0_7 = (count_4_7 == 28) ? count_0_3 : count_4_7;

        uint32_t count_16_31 = (count_24_31 == 8) ? count_16_23 : count_24_31;
        uint32_t count_0_15 = (count_8_15 == 24) ? count_0_7 : count_8_15;

        uint32_t count = (count_16_31 == 16) ? count_0_15 : count_16_31;

        return count;
    }
}

// itof_pipeline.sv のビットレベルシミュレータ
uint32_t simulate_itof(uint32_t input)
{
    // ----- STAGE 1 -----
    uint32_t int_a_s1 = input;

    // S1 Combinational
    uint32_t sign_s1_comb = (int_a_s1 >> 31) & 1;
    bool is_zero_s1_comb = (int_a_s1 == 0); // Verilog: (int_a_s1 == 32'b0)

    // 絶対値計算
    // Verilog: (int_a_s1[31]) ? (~int_a_s1 + 1) : int_a_s1;
    // 補足: 0x80000000 (-2147483648) の場合、(~x + 1) は 0x80000000 に戻ります。
    // VerilogもC++も同じ挙動になるのでそのまま記述します。
    uint32_t modulus_s1_comb;
    if (sign_s1_comb)
    {
        modulus_s1_comb = (~int_a_s1) + 1;
    }
    else
    {
        modulus_s1_comb = int_a_s1;
    }

    // LZC Instance
    uint32_t lzc_cnt_s1_comb = verilog_sim::lzc_count_sim(modulus_s1_comb);

    // ----- STAGE 2 (Register Latch) -----
    // Verilog: always_ff @(posedge clk) ...
    uint32_t modulus_s2 = modulus_s1_comb;
    uint32_t sign_s2 = sign_s1_comb;
    bool is_zero_s2 = is_zero_s1_comb;
    uint32_t lzc_cnt_s2_comb = lzc_cnt_s1_comb;

    // S2 Combinational Logic
    uint32_t exponent_s2_comb;
    if (is_zero_s2)
    {
        exponent_s2_comb = 0;
    }
    else
    {
        // Verilog: 127 + (31 - lzc_cnt_s2_comb)
        exponent_s2_comb = 127 + (31 - lzc_cnt_s2_comb);
    }

    // シフト計算: modulus_s2 << lzc_cnt_s2_comb
    // 【重要】C++で32bit以上のシフトはUndefined Behaviorですが、
    // Verilogでは0になるため、その挙動を明示的に実装してクラッシュを防ぎます。
    uint32_t shifted_modulus_s2_comb;
    if (lzc_cnt_s2_comb >= 32)
    {
        shifted_modulus_s2_comb = 0;
    }
    else
    {
        shifted_modulus_s2_comb = modulus_s2 << lzc_cnt_s2_comb;
    }

    // 仮数部抽出 [30:8]
    // Verilog: is_zero_s2 ? 23'b0 : shifted_modulus_s2_comb[30:8];
    uint32_t mantissa_s2_comb;
    if (is_zero_s2)
    {
        mantissa_s2_comb = 0;
    }
    else
    {
        mantissa_s2_comb = (shifted_modulus_s2_comb >> 8) & 0x7FFFFF;
    }

    // Rounding bits
    uint32_t carry_s2_comb = (shifted_modulus_s2_comb >> 7) & 1; // bit 7
    bool all_ones_s2_comb = (mantissa_s2_comb == 0x7FFFFF);

    // Final Mantissa Calculation
    uint32_t final_mantissa;
    if (carry_s2_comb)
    {
        final_mantissa = mantissa_s2_comb + 1;
        // 注意: ここでオーバーフローしても24bit目には行きません（C++変数は32bitあるため）。
        // しかしVerilogでは `result_reg` への代入時にロジック分岐しているため、
        // ここでのオーバーフロー値自体は `else` ブロック内でのみ使われます。
        // 一応 23bit マスクをかけておきます。
        final_mantissa &= 0x7FFFFF;
    }
    else
    {
        final_mantissa = mantissa_s2_comb;
    }

    // ----- STAGE 3 (Output Latch) -----
    // Verilog: always_ff ...
    uint32_t result_reg;

    if (is_zero_s2)
    {
        result_reg = 0;
    }
    else if (carry_s2_comb && all_ones_s2_comb)
    {
        // 丸めによる桁上がり (1.11...1 -> 10.00...0)
        // 指数をインクリメント、仮数は0
        result_reg = (sign_s2 << 31) | ((exponent_s2_comb + 1) << 23) | 0;
    }
    else
    {
        // 通常
        result_reg = (sign_s2 << 31) | (exponent_s2_comb << 23) | final_mantissa;
    }

    return result_reg;
}