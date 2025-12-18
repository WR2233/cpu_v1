 `timescale 1ns/1ps
module fmul_pipeline (
    input  logic        clk,
    input  logic        rst_n,

    input  logic [31:0] input_a,
    input  logic [31:0] input_b,

    output logic [31:0] result
);

    logic [31:0] a;
    logic [31:0] b;
    // 入力レジスタ
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a <= 32'd0;
            b <= 32'd0;
        end else begin
            a <= input_a;
            b <= input_b;
        end
    end
    //================================================================
    // STAGE 1: デコード、部分積、指数計算
    //================================================================

    logic        a_sign, b_sign;
    logic [7:0]  a_exp, b_exp;
    logic [22:0] a_mant, b_mant;
    logic [23:0] m1, m2;

    assign a_sign = a[31];
    assign a_exp  = a[30:23];
    assign a_mant = a[22:0];
    assign b_sign = b[31];
    assign b_exp  = b[30:23];
    assign b_mant = b[22:0];

    // 正規化数の暗黙の '1' (ケチビット) を追加
    assign m1 = {1'b1, a_mant};
    assign m2 = {1'b1, b_mant};

    // S1 ロジック (組合せ)
    logic [12:0] m1_H, m2_H;
    logic [10:0] m1_L, m2_L;
    logic [25:0] HH;
    logic [23:0] HL;
    logic [23:0] LH;
    logic [8:0]  exp_sum_s1;
    logic        sign_s1;
    logic        force_zero_s1;
    logic        underflow_overflow_s1;
    logic        zero_input_s1;

    // 1. HH、HL、LHを計算 (Step 2.)
    assign m1_H = m1[23:11];
    assign m1_L = m1[10:0];
    assign m2_H = m2[23:11];
    assign m2_L = m2[10:0];

    assign HH = m1_H * m2_H; 
    assign HL = m1_H * m2_L; 
    assign LH = m1_L * m2_H; 

    // 2. exp1 +exp2 +129で指数部を計算 (Step 5.)
    // 9bit加算として実行
    assign exp_sum_s1 = {1'b0, a_exp} + {1'b0, b_exp} + 9'd129;

    // 3. 符号部をXOR (Step 5.)
    assign sign_s1 = a_sign ^ b_sign;

    // S1 アンダーフロー/オーバーフロー/ゼロ検出
    // 9bit加算のMSB(8bit目)が0の場合、U/Oと判定
    assign underflow_overflow_s1 = ~exp_sum_s1[8];
    // 指数部が0 (ゼロまたは非正規化数) の場合
    assign zero_input_s1 = (a_exp == 8'd0) | (b_exp == 8'd0);
    // どちらか一方でも発生したら結果を0にする
    assign force_zero_s1 = underflow_overflow_s1 | zero_input_s1;

    // --- S1 -> S2 レジスタ ---
    logic [25:0] HH_s2;
    logic [23:0] HL_s2;
    logic [23:0] LH_s2;
    logic [8:0]  exp_sum_s2;
    logic        sign_s2;
    logic        force_zero_s2;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            HH_s2         <= 26'd0;
            HL_s2         <= 24'd0;
            LH_s2         <= 24'd0;
            exp_sum_s2    <= 9'd0;
            sign_s2       <= 1'b0;
            force_zero_s2 <= 1'b1; // リセット時は0を出力
        end else begin
            HH_s2         <= HH;
            HL_s2         <= HL;
            LH_s2         <= LH;
            exp_sum_s2    <= exp_sum_s1;
            sign_s2       <= sign_s1;
            force_zero_s2 <= force_zero_s1;
        end
    end

    //================================================================
    // STAGE 2: 仮数部加算
    //================================================================

    // S2 ロジック (組合せ)
    logic [25:0] mant_sum_s2; // HH(24b) + 13b + 13b + 2 => 26bit幅でキャリーを保持
    logic [8:0]  exp_s2_plus1;

    // 1. HH +(HL>>11)+(LH >>11)+2を計算 (Step 3.)
    assign mant_sum_s2 = HH_s2 + (HL_s2 >> 11) + (LH_s2 >> 11) +
                         26'd2;

    // 2. 指数部に1足したものを計算しておく
    assign exp_s2_plus1 = exp_sum_s2 + 9'd1;

    // --- S2 -> S3 レジスタ ---
    logic [25:0] mant_sum_s3;
    logic [8:0]  exp_s3;
    logic [8:0]  exp_s3_plus1;
    logic        sign_s3;
    logic        force_zero_s3;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mant_sum_s3  <= 26'd0;
            exp_s3       <= 9'd0;
            exp_s3_plus1 <= 9'd0;
            sign_s3      <= 1'b0;
            force_zero_s3 <= 1'b1;
        end else begin
            mant_sum_s3  <= mant_sum_s2;
            exp_s3       <= exp_sum_s2;     // S1からS2を経由してS3へ
            exp_s3_plus1 <= exp_s2_plus1; // S2で計算した
            sign_s3      <= sign_s2;      // S1からS2を経由してS3へ
            force_zero_s3 <= force_zero_s2; // S1からS2を経由してS3へ
        end
    end

    //================================================================
    // STAGE 3: 正規化、アセンブル
    //================================================================

    // S3 ロジック (組合せ)
    logic        norm_bit_s3;   // 仮数部の最上位bit (正規化が必要か)
    logic [7:0]  final_exp_s3;
    logic [22:0] final_mant_s3;
    logic [31:0] result_s3;     // 最終結果 (レジスタ前)

    // 1. underflow bitと仮数部の最上位bitを見て、指数部を選ぶ
    // mant_sum_s3[24] が正規化のための MSB と仮定
    // (HH[23:0] が 1.m * 1.m の整数部 01.xx または 1x.xx を保持すると仮定)
    // norm_bit_s3 = 1 (1x.xx の場合) -> 右シフト正規化と指数+1 が必要
    assign norm_bit_s3 = mant_sum_s3[25];

    // 指数部の選択 (Mux)
    assign final_exp_s3 = (norm_bit_s3) ? exp_s3_plus1[7:0] // +1 した指数
                                        : exp_s3[7:0];      // 元の指数

    // 2. 仮数部を正規化 (Step 4.)
    assign final_mant_s3 = (norm_bit_s3) ? mant_sum_s3[24:2]  // 1bit右シフト
                                         : mant_sum_s3[23:1]; // そのまま

    // 3. 符号部と指数部と仮数部をくっつけて返す
    // force_zero (U/O または ゼロ入力) が立っている場合は、全て0にする
    assign result_s3 = (force_zero_s3) ? 32'd0 
                                       : {sign_s3, final_exp_s3, final_mant_s3};

    // --- S3 -> Output レジスタ ---
    // (result がモジュールの output logic [31:0] result のため、
    //  S3ロジックの出力を受ける最終段レジスタが必要)
    logic [31:0] result_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result_reg <= 32'd0;
        end else begin
            result_reg <= result_s3;
        end
    end

    assign result = result_reg; // 3サイクル後の結果を出力

endmodule