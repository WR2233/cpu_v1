 `timescale 1ns/1ps
module finv_pipeline (
    input  logic        clk,
    input  logic        rst_n,

    input  logic [31:0] input_a,

    output logic [31:0] result
);

    logic [31:0] a;
    // 入力レジスタ
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a <= 32'd0;
        end else begin
            a <= input_a;
        end
    end
    //================================================================
    // STAGE 1: デコード と初期近似値取得
    //================================================================

    localparam INITIAL_ADDR_WIDTH = 10;

    logic        a_sign;
    logic [7:0]  a_exp;
    logic [22:0] a_mant;
    logic [23:0] m1;
    
    logic [35:0] initial_inv;

    assign a_sign = a[31];
    assign a_exp  = a[30:23];
    assign a_mant = a[22:0];

    // 正規化数の暗黙の '1' (ケチビット) を追加
    // assign m1 = {1'b1, a_mant};
    blk_mem_gen_0_finv inv_initial (
    .clka(clk),    // input wire clka
    .ena(1'b1),      // input wire ena
    .addra(a_mant[22:23-INITIAL_ADDR_WIDTH]),  // input wire [9 : 0] addra
    .douta(initial_inv)  // output wire [35 : 0] douta
    );

    // --- S1 -> S2 レジスタ ---
    logic [7:0]  exp_s2;
    logic        sign_s2;
    // logic [INITIAL_ADDR_WIDTH-1:0] mant_index_s2;
    logic [23-INITIAL_ADDR_WIDTH-1:0] mant_frac_s2;


    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            exp_s2         <= 8'd0;
            sign_s2        <= 1'b0;
            // mant_index_s2  <= {INITIAL_ADDR_WIDTH{1'b0}};
            mant_frac_s2   <= {(23-INITIAL_ADDR_WIDTH){1'b0}};
        end else begin
            exp_s2         <= a_exp;
            sign_s2        <= a_sign;
            // mant_index_s2  <= m1[23:24-INITIAL_ADDR_WIDTH];
            mant_frac_s2   <= a_mant[23-INITIAL_ADDR_WIDTH-1:0];
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

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mant_result_s3 <= {(13+23-INITIAL_ADDR_WIDTH){1'b0}};
            constant_s3    <= 24'd0;
            exp_s3         <= 8'd0;
            sign_s3        <= 1'b0;
        end else begin
            mant_result_s3 <= mult_result_s2;
            constant_s3    <= constant_s2;
            exp_s3         <= exp_s2;
            sign_s3        <= sign_s2;
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

    // --- S3 -> Output レジスタ ---
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