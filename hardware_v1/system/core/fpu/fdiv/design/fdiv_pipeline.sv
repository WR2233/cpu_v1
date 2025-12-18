 `timescale 1ns/1ps
module fdiv_pipeline (
    input  logic        clk,
    input  logic        rst_n,

    input  logic [31:0] input_a,
    input  logic [31:0] input_b,

    output logic [31:0] result
);  
    localparam INITIAL_ADDR_WIDTH = 10;
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

    logic        finv_b_sign;
    logic [7:0]  finv_b_exp;
    logic [22:0] finv_b_mant;
    // logic [23:0] m1;
    
    logic [35:0] initial_inv;
    logic [31:0] a_s1;

    assign a_s1 = a;

    assign finv_b_sign = b[31];
    assign finv_b_exp  = b[30:23];
    assign finv_b_mant = b[22:0];

    // 正規化数の暗黙の '1' (ケチビット) を追加
    // assign m1 = {1'b1, a_mant};
    blk_mem_gen_0_fdiv inv_initial (
    .clka(clk),    // input wire clka
    .ena(1'b1),      // input wire ena
    .addra(finv_b_mant[22:23-INITIAL_ADDR_WIDTH]),  // input wire [9 : 0] addra
    .douta(initial_inv)  // output wire [35 : 0] douta
    );

    // --- S1 -> S2 レジスタ ---
    logic [7:0]  exp_s2;
    logic        sign_s2;
    // logic [INITIAL_ADDR_WIDTH-1:0] mant_index_s2;
    logic [23-INITIAL_ADDR_WIDTH-1:0] mant_frac_s2;
    logic [31:0] a_s2;


    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            exp_s2         <= 8'd0;
            sign_s2        <= 1'b0;
            // mant_index_s2  <= {INITIAL_ADDR_WIDTH{1'b0}};
            mant_frac_s2   <= {(23-INITIAL_ADDR_WIDTH){1'b0}};
            a_s2            <= 32'd0;
        end else begin
            exp_s2         <= finv_b_exp;
            sign_s2        <= finv_b_sign;
            // mant_index_s2  <= m1[23:24-INITIAL_ADDR_WIDTH];
            mant_frac_s2   <= finv_b_mant[23-INITIAL_ADDR_WIDTH-1:0];
            a_s2            <= a_s1;
        end
    end

    //================================================================
    // STAGE 2: 近似
    //================================================================

 
    // S2 ロジック (組合せ)
    logic [12:0] gradient_s2;
    logic [22:0] constant_s2;   

    assign gradient_s2 = initial_inv[35:23];
    assign constant_s2 = initial_inv[22:0];

    logic [13+23-INITIAL_ADDR_WIDTH-1:0] mult_result_s2;
    assign mult_result_s2 = gradient_s2 * mant_frac_s2;

    // --- S2 -> S3 レジスタ ---
    logic [13+23-INITIAL_ADDR_WIDTH-1:0] mant_result_s3;
    logic [22:0] constant_s3;
    logic [7:0]  exp_s3;
    logic        sign_s3;
    logic [31:0] a_s3;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mant_result_s3 <= {(13+23-INITIAL_ADDR_WIDTH){1'b0}};
            constant_s3    <= 24'd0;
            exp_s3         <= 8'd0;
            sign_s3        <= 1'b0;
            a_s3           <= 32'd0;
        end else begin
            mant_result_s3 <= mult_result_s2;
            constant_s3    <= constant_s2;
            exp_s3         <= exp_s2;
            sign_s3        <= sign_s2;
            a_s3           <= a_s2;
        end 
    end

    //================================================================
    // STAGE 3: 減算と指数計算
    //================================================================

    // S3 ロジック (組合せ)
    logic [7:0]  final_exp;
    logic [22:0] final_mant;
    logic [31:0] result_s3;

    // 1. 近似値の計算 (Step 3.)
    assign final_mant = constant_s3 - {7'b0, mant_result_s3[13+23-INITIAL_ADDR_WIDTH-1:13+23-INITIAL_ADDR_WIDTH-23+7]};
    // 2. 指数部の計算 (Step 4.)
    assign final_exp = 8'd253 - exp_s3; // 254 -
    // 3. 結果の組み立て (Step 5.)
    assign result_s3 = {sign_s3, final_exp, final_mant};
    logic [31:0] a_s4;
    logic [31:0] b_s4;
    //================================================================
    // STAGE 4: デコード、部分積、指数計算
    //================================================================
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_s4 <= 32'd0;
            b_s4 <= 32'd0;
        end else begin
            a_s4 <= a_s3;
            b_s4 <= result_s3;
        end
    end


    logic        a_sign, b_sign;
    logic [7:0]  a_exp, b_exp;
    logic [22:0] a_mant, b_mant;
    logic [23:0] m1, m2;

    assign a_sign = a_s4[31];
    assign a_exp  = a_s4[30:23];
    assign a_mant = a_s4[22:0];
    assign b_sign = b_s4[31];
    assign b_exp  = b_s4[30:23];
    assign b_mant = b_s4[22:0];

    // 正規化数の暗黙の '1' (ケチビット) を追加
    assign m1 = {1'b1, a_mant};
    assign m2 = {1'b1, b_mant};

    // S1 ロジック (組合せ)
    logic [12:0] m1_H, m2_H;
    logic [10:0] m1_L, m2_L;
    logic [25:0] HH;
    logic [23:0] HL;
    logic [23:0] LH;
    logic [8:0]  exp_sum_s4;
    logic        sign_s4;
    logic        force_zero_s4;
    logic        underflow_overflow_s4;
    logic        zero_input_s4;

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
    assign exp_sum_s4 = {1'b0, a_exp} + {1'b0, b_exp} + 9'd129;

    // 3. 符号部をXOR (Step 5.)
    assign sign_s4 = a_sign ^ b_sign;

    // S4 アンダーフロー/オーバーフロー/ゼロ検出
    // 9bit加算のMSB(8bit目)が0の場合、U/Oと判定
    assign underflow_overflow_s4 = ~exp_sum_s4[8];
    // 指数部が0 (ゼロまたは非正規化数) の場合
    assign zero_input_s4 = (a_exp == 8'd0) | (b_exp == 8'd0);
    // どちらか一方でも発生したら結果を0にする
    assign force_zero_s4 = underflow_overflow_s4 | zero_input_s4;

    // --- S1 -> S2 レジスタ ---
    logic [25:0] HH_s5;
    logic [23:0] HL_s5;
    logic [23:0] LH_s5;
    logic [8:0]  exp_sum_s5;
    logic        sign_s5;
    logic        force_zero_s5;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            HH_s5         <= 26'd0;
            HL_s5         <= 24'd0;
            LH_s5         <= 24'd0;
            exp_sum_s5    <= 9'd0;
            sign_s5       <= 1'b0;
            force_zero_s5 <= 1'b1; // リセット時は0を出力
        end else begin
            HH_s5         <= HH;
            HL_s5         <= HL;
            LH_s5         <= LH;
            exp_sum_s5    <= exp_sum_s4;
            sign_s5       <= sign_s4;
            force_zero_s5 <= force_zero_s4;
        end
    end

    //================================================================
    // STAGE 5: 仮数部加算
    //================================================================

    // S2 ロジック (組合せ)
    logic [25:0] mant_sum_s5; // HH(24b) + 13b + 13b + 2 => 26bit幅でキャリーを保持
    logic [8:0]  exp_s5_plus1;

    // 1. HH +(HL>>11)+(LH >>11)+2を計算 (Step 3.)
    assign mant_sum_s5 = HH_s5 + (HL_s5 >> 11) + (LH_s5 >> 11) +
                         26'd2;

    // 2. 指数部に1足したものを計算しておく
    assign exp_s5_plus1 = exp_sum_s5 + 9'd1;

    // --- S2 -> S3 レジスタ ---
    logic [25:0] mant_sum_s6;
    logic [8:0]  exp_s6;
    logic [8:0]  exp_s6_plus1;
    logic        sign_s6;
    logic        force_zero_s6;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mant_sum_s6  <= 26'd0;
            exp_s6       <= 9'd0;
            exp_s6_plus1 <= 9'd0;
            sign_s6      <= 1'b0;
            force_zero_s6 <= 1'b1;
        end else begin
            mant_sum_s6  <= mant_sum_s5;
            exp_s6       <= exp_sum_s5;     // S1からS2を経由してS3へ
            exp_s6_plus1 <= exp_s5_plus1; // S2で計算した
            sign_s6      <= sign_s5;      // S1からS2を経由してS3へ
            force_zero_s6 <= force_zero_s5; // S1からS2を経由してS3へ
        end
    end

    //================================================================
    // STAGE 6: 正規化、アセンブル
    //================================================================

    // S3 ロジック (組合せ)
    logic        norm_bit_s6;   // 仮数部の最上位bit (正規化が必要か)
    logic [7:0]  final_exp_s6;
    logic [22:0] final_mant_s6;
    logic [31:0] result_s6;     // 最終結果 (レジスタ前)

    // 1. underflow bitと仮数部の最上位bitを見て、指数部を選ぶ
    // mant_sum_s3[24] が正規化のための MSB と仮定
    // (HH[23:0] が 1.m * 1.m の整数部 01.xx または 1x.xx を保持すると仮定)
    // norm_bit_s6 = 1 (1x.xx の場合) -> 右シフト正規化と指数+1 が必要
    assign norm_bit_s6 = mant_sum_s6[25];

    // 指数部の選択 (Mux)
    assign final_exp_s6 = (norm_bit_s6) ? exp_s6_plus1[7:0] // +1 した指数
                                        : exp_s6[7:0];      // 元の指数

    // 2. 仮数部を正規化 (Step 4.)
    assign final_mant_s6 = (norm_bit_s6) ? mant_sum_s6[24:2]  // 1bit右シフト
                                         : mant_sum_s6[23:1]; // そのまま

    // 3. 符号部と指数部と仮数部をくっつけて返す
    // force_zero (U/O または ゼロ入力) が立っている場合は、全て0にする
    assign result_s6 = (force_zero_s6) ? 32'd0 
                                       : {sign_s6, final_exp_s6, final_mant_s6};

    // --- S3 -> Output レジスタ ---
    // (result がモジュールの output logic [31:0] result のため、
    //  S3ロジックの出力を受ける最終段レジスタが必要)
    logic [31:0] result_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result_reg <= 32'd0;
        end else begin
            result_reg <= result_s6;
        end
    end

    assign result = result_reg;

endmodule