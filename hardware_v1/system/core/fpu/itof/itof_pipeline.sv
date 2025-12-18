 `timescale 1ns/1ps
module lzc_count(
    input logic [31:0] in,
    output logic [5:0] count
);
    logic [5:0] count_30_31;
    assign count_30_31 = (in[31:30] == 2'b00) ? 6'd2 :
                         (in[31:30] == 2'b01) ? 6'd1 :
                         (in[31:30] == 2'b10) ? 6'd0 : 6'd0;
    logic [5:0] count_28_29;
    assign count_28_29 = (in[29:28] == 2'b00) ? 6'd4:
                            (in[29:28] == 2'b01) ? 6'd3 :
                            (in[29:28] == 2'b10) ? 6'd2 : 6'd2;
    logic [5:0] count_26_27;
    assign count_26_27 = (in[27:26] == 2'b00) ? 6'd6:
                            (in[27:26] == 2'b01) ? 6'd5 :
                            (in[27:26] == 2'b10) ? 6'd4 : 6'd4;
    logic [5:0] count_24_25;
    assign count_24_25 = (in[25:24] == 2'b00) ? 6'd8:
                            (in[25:24] == 2'b01) ? 6'd7 :
                            (in[25:24] == 2'b10) ? 6'd6 : 6'd6;
    logic [5:0] count_22_23;
    assign count_22_23 = (in[23:22] == 2'b00) ? 6'd10:
                            (in[23:22] == 2'b01) ? 6'd9 :
                            (in[23:22] == 2'b10) ? 6'd8 : 6'd8;
    logic [5:0] count_20_21;
    assign count_20_21 = (in[21:20] == 2'b00) ? 6'd12:
                            (in[21:20] == 2'b01) ? 6'd11 :
                            (in[21:20] == 2'b10) ? 6'd10 : 6'd10;
    logic [5:0] count_18_19;
    assign count_18_19 = (in[19:18] == 2'b00) ? 6'd14:
                            (in[19:18] == 2'b01) ? 6'd13 :
                            (in[19:18] == 2'b10) ? 6'd12 : 6'd12;
    logic [5:0] count_16_17;
    assign count_16_17 = (in[17:16] == 2'b00) ? 6'd16:
                            (in[17:16] == 2'b01) ? 6'd15 :
                            (in[17:16] == 2'b10) ? 6'd14 : 6'd14;
    logic [5:0] count_14_15;
    assign count_14_15 = (in[15:14] == 2'b00) ? 6'd18:
                            (in[15:14] == 2'b01) ? 6'd17 :
                            (in[15:14] == 2'b10) ? 6'd16 : 6'd16;
    logic [5:0] count_12_13;
    assign count_12_13 = (in[13:12] == 2'b00) ? 6'd20:
                            (in[13:12] == 2'b01) ? 6'd19 :
                            (in[13:12] == 2'b10) ? 6'd18 : 6'd18;
    logic [5:0] count_10_11;
    assign count_10_11 = (in[11:10] == 2'b00) ? 6'd22:
                            (in[11:10] == 2'b01) ? 6'd21 :
                            (in[11:10] == 2'b10) ? 6'd20 : 6'd20;
    logic [5:0] count_8_9;
    assign count_8_9 = (in[9:8] == 2'b00) ? 6'd24:
                            (in[9:8] == 2'b01) ? 6'd23 :
                            (in[9:8] == 2'b10) ? 6'd22 : 6'd22;
    logic [5:0] count_6_7;
    assign count_6_7 = (in[7:6] == 2'b00) ? 6'd26:
                            (in[7:6] == 2'b01) ? 6'd25 :
                            (in[7:6] == 2'b10) ? 6'd24 : 6'd24;
    logic [5:0] count_4_5;
    assign count_4_5 = (in[5:4] == 2'b00) ? 6'd28:
                            (in[5:4] == 2'b01) ? 6'd27 :
                            (in[5:4] == 2'b10) ? 6'd26 : 6'd26;
    logic [5:0] count_2_3;
    assign count_2_3 = (in[3:2] == 2'b00) ? 6'd30:
                            (in[3:2] == 2'b01) ? 6'd29 :
                            (in[3:2] == 2'b10) ? 6'd28 : 6'd28;
    logic [5:0] count_0_1;
    assign count_0_1 = (in[1:0] == 2'b00) ? 6'd32:
                            (in[1:0] == 2'b01) ? 6'd31 :
                            (in[1:0] == 2'b10) ? 6'd30 : 6'd30;
    logic [5:0] count_28_31;
    assign count_28_31 = (count_30_31 == 6'd2) ? count_28_29 : count_30_31;
    logic [5:0] count_24_27;
    assign count_24_27 = (count_26_27 == 6'd6) ? count_24_25 : count_26_27;
    logic [5:0] count_20_23;
    assign count_20_23 = (count_22_23 == 6'd10) ? count_20_21 : count_22_23;    
    logic [5:0] count_16_19;
    assign count_16_19 = (count_18_19 == 6'd14) ? count_16_17 : count_18_19;    
    logic [5:0] count_12_15;
    assign count_12_15 = (count_14_15 == 6'd18) ? count_12_13 : count_14_15;    
    logic [5:0] count_8_11;
    assign count_8_11 = (count_10_11 == 6'd22) ? count_8_9 : count_10_11;    
    logic [5:0] count_4_7;
    assign count_4_7 = (count_6_7 == 6'd26) ? count_4_5 : count_6_7;    
    logic [5:0] count_0_3;
    assign count_0_3 = (count_2_3 == 6'd30) ? count_0_1 : count_2_3;
    logic [5:0] count_24_31;
    assign count_24_31 = (count_28_31 == 6'd4) ? count_24_27 : count_28_31;
    logic [5:0] count_16_23;
    assign count_16_23 = (count_20_23 == 6'd12) ? count_16_19 : count_20_23;
    logic [5:0] count_8_15;
    assign count_8_15 = (count_12_15 == 6'd20) ? count_8_11 : count_12_15;  
    logic [5:0] count_0_7;
    assign count_0_7 = (count_4_7 == 6'd28) ? count_0_3 : count_4_7;
    logic [5:0] count_16_31;
    assign count_16_31 = (count_24_31 == 6'd8) ? count_16_23 : count_24_31;
    logic [5:0] count_0_15;
    assign count_0_15 = (count_8_15 == 6'd24) ? count_0_7 : count_8_15;
    assign count = (count_16_31 == 6'd16) ? count_0_15 : count_16_31;

endmodule

`timescale 1ns/1ps
module itof_pipeline (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [31:0] input_a, // (S0) 入力
    output logic [31:0] result
);

    // ----- STAGE 1 (Input Latch) -----
    // 入力値をFF（レジスタ）に格納する
    reg [31:0] int_a_s1;
    always_ff @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        int_a_s1 <= 32'b0;
      end else begin
          int_a_s1 <= input_a;
    end
    end

    // --- S1 の組み合わせロジック (絶対値計算) ---
    logic       sign_s1_comb;
    logic [31:0] modulus_s1_comb;
    logic       is_zero_s1_comb;
    logic [5:0] lzc_cnt_s1_comb;

    assign sign_s1_comb  = int_a_s1[31];
    assign is_zero_s1_comb = (int_a_s1 == 32'b0);
    // ★ここがクリティカルパスだった
    assign modulus_s1_comb = (int_a_s1[31]) ? (~int_a_s1 + 1) : int_a_s1;
    lzc_count lzc_inst (
        .in(modulus_s1_comb), // S2 FF の出力を使う
        .count(lzc_cnt_s1_comb)
    );


    // ----- STAGE 2 (Adder Latch & LZC/Shift) -----
    // ★S1とS2の間にFFを挿入 (Adderの結果をラッチ)
    reg [31:0] modulus_s2;
    reg        sign_s2;
    reg        is_zero_s2;
    logic [5:0] lzc_cnt_s2_comb;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            modulus_s2 <= 32'b0;
            sign_s2    <= 1'b0;
            is_zero_s2 <= 1'b1;
            lzc_cnt_s2_comb <= 6'b0;
        end else begin
            // S1の計算結果 (Adderの結果) をラッチ
            modulus_s2 <= modulus_s1_comb;
            sign_s2    <= sign_s1_comb;
            is_zero_s2 <= is_zero_s1_comb;
            lzc_cnt_s2_comb <= lzc_cnt_s1_comb;
       end
    end

    // --- S2 の組み合わせロジック (LZC, Shift, Round) ---

    logic [7:0] exponent_s2_comb;
    logic [31:0] shifted_modulus_s2_comb;
    logic [22:0] mantissa_s2_comb;
    logic       carry_s2_comb;
    logic       all_ones_s2_comb;


    
    // (元のコードで is_zero 分岐が消えていたため復活)
    assign exponent_s2_comb = is_zero_s2 ? 8'b0 : (127 + (31 - lzc_cnt_s2_comb));
    assign shifted_modulus_s2_comb = modulus_s2 << lzc_cnt_s2_comb;
    assign mantissa_s2_comb = is_zero_s2 ? 23'b0 : shifted_modulus_s2_comb[30:8];
    assign carry_s2_comb    = shifted_modulus_s2_comb[7];
    assign all_ones_s2_comb = &mantissa_s2_comb;

    logic [22:0] final_mantissa;
    assign final_mantissa = carry_s2_comb ? (mantissa_s2_comb + 1) : mantissa_s2_comb;


    // ----- STAGE 3 (Output Latch) -----
    // 最後の計算結果をFF（レジスタ）に格納する
    reg [31:0] result_reg; // 最終段FF (S3)
    assign result = result_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result_reg <= 32'b0;
        end else begin
           // S2の組み合わせロジックの結果をラッチ
            if (is_zero_s2) begin
                result_reg <= 32'b0;
        end else if (carry_s2_comb && all_ones_s2_comb) begin
                result_reg <= {sign_s2, exponent_s2_comb + 1, 23'b0};
        end else begin
            result_reg <= {sign_s2, exponent_s2_comb, final_mantissa};
        end
        end
   end

endmodule
// module itof (
//     input  logic        clk,
//     input  logic        rst_n,

//     input  logic [31:0] int_aa,

//     output logic [31:0] result
// );
//     reg [31:0] int_a;
//     // 入力値をFF（レジスタ）に格納する
//     always_ff @(posedge clk or negedge rst_n) begin
//         if (!rst_n) begin
//             int_a <= 32'b0;
//         end else begin
//             // 入力値をラッチする
//             int_a <= int_aa;
//         end
//     end
//     logic       sign;
//     assign sign = int_a[31];
//     logic [31:0] modulus;
//     assign modulus = (int_a[31]) ? (~int_a + 1) : int_a; // 絶対値(負の数は+1せんとあかん)
//     logic [5:0] lzc_cnt;
//     lzc_count lzc_inst (
//         .in(modulus),
//         .count(lzc_cnt)
//     );
//     logic [7:0] exponent;
//     logic is_zero;
//     assign is_zero = (int_a == 32'b0);
//     assign exponent = (127 + (31 - lzc_cnt));
//     logic [31:0] shifted_modulus;
//     assign shifted_modulus = modulus << lzc_cnt;
//     logic [22:0] mantissa;
//     assign mantissa = shifted_modulus[30:8]; // 先頭の1を省く
//     logic carry;
//     assign carry = shifted_modulus[7]; // 24ビット目の確認
//     logic all_ones;
//     assign all_ones = &mantissa;
//     logic [31:0] result_reg;


//     // 最後の計算結果をFF（レジスタ）に格納する
//     always_ff @(posedge clk or negedge rst_n) begin
//         if (!rst_n) begin
//             result_reg <= 32'b0;
//         end else begin
//             // 組み合わせロジックの最終結果をラッチする
//             if (is_zero) begin
//                 result_reg <= 32'b0;
//             end else if (carry && all_ones) begin
//                 result_reg <= {sign, exponent + 1, 23'b0};
//             end else begin
//                 result_reg <= {sign, exponent, carry ? mantissa + 1 : mantissa};
//             end
//         end
//     end
//     assign result = result_reg;

// endmodule