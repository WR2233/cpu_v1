 `timescale 1ns/1ps
module fisqrt_pipeline (
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


    logic        a_sign;
    logic [7:0]  a_exp;
    logic [22:0] a_mant;
    logic [23:0] m1;
    
    logic [35:0] initial_isqrt;

    assign a_sign = a[31];
    assign a_exp  = a[30:23];
    assign a_mant = a[22:0];

    // 正規化数の暗黙の '1' (ケチビット) を追加
    // assign m1 = {1'b1, a_mant};
    localparam INITIAL_ADDR_WIDTH = 11;
    localparam ADDR_MANT_WIDTH = INITIAL_ADDR_WIDTH - 1; // 10
    localparam FRAC_MANT_WIDTH = 23 - ADDR_MANT_WIDTH;   // 13

    logic [INITIAL_ADDR_WIDTH-1:0] addra;
    
    // ~a_exp[0] (1bit) と a_mantの上位10bit (a_mant[22:13]) を結合
    assign addra = {~a_exp[0], a_mant[22 : 23-ADDR_MANT_WIDTH]}; 

    blk_mem_gen_0_fisqrt isqrt_initial (
        .clka(clk),
        .ena(1'b1),
        .addra(addra),  // 修正後 (11ビット)
        .douta(initial_isqrt)
    );

    // --- S1 -> S2 レジスタ ---
    logic [7:0]  exp_s2;
    logic        sign_s2;
    // logic [INITIAL_ADDR_WIDTH-1:0] mant_index_s2;
    logic [FRAC_MANT_WIDTH-1:0] mant_frac_s2;


    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            exp_s2         <= 8'd0;
            sign_s2        <= 1'b0;
            // mant_index_s2  <= {INITIAL_ADDR_WIDTH{1'b0}};
            mant_frac_s2   <= '0;
        end else begin
            exp_s2         <= a_exp;
            sign_s2        <= a_sign;
            // mant_index_s2  <= m1[23:24-INITIAL_ADDR_WIDTH];
            mant_frac_s2   <= a_mant[FRAC_MANT_WIDTH-1:0];
        end
    end

    //================================================================
    // STAGE 2: 近似
    //================================================================

 
    // S2 ロジック (組合せ)
    logic [12:0] gradient_s2;
    logic [22:0] constant_s2;   

    assign gradient_s2 = initial_isqrt[35:23];
    assign constant_s2 = initial_isqrt[22:0];

    logic [13+FRAC_MANT_WIDTH-1:0] mult_result_s2;
    assign mult_result_s2 = gradient_s2 * mant_frac_s2;

    // --- S2 -> S3 レジスタ ---
    logic [13+FRAC_MANT_WIDTH-1:0] mant_result_s3;
    logic [22:0] constant_s3;
    logic [7:0]  exp_s3;
    logic        sign_s3;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mant_result_s3 <= '0;
            constant_s3    <= 23'd0;
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
    // STAGE 3: 加算と指数計算
    //================================================================

    // S3 ロジック (組合せ)
    logic [7:0]  final_exp_bef;
    logic [7:0]  final_exp;
    logic [13+FRAC_MANT_WIDTH-1:0] final_mant;
    logic [31:0] result_s3;
    logic        is_minus;
    logic [31:0] final_result;
    logic [22:0] shifted_mant_result;
    logic [13+1+FRAC_MANT_WIDTH-1:0] mant_result_shifted;
    assign mant_result_shifted = (~exp_s3[0]) ? {mant_result_s3, 1'b0} // 偶数指数
                                               : {1'b0, mant_result_s3}; // 奇数指数

    // 1. 近似値の計算 (Step 3.)
    // assign final_mant = {constant_s3, 3'b0} + {9'b0, mant_result_shifted[13+1+FRAC_MANT_WIDTH-1:10]}; // 13+FRAC_MANT_WIDTH+3 = 26bit
    assign final_mant = {constant_s3, 3'b0} - {9'b0, mant_result_shifted[13+1+FRAC_MANT_WIDTH-1:10]}; // 13+FRAC_MANT_WIDTH+3 = 26bit
    // assign final_mant = {7'b0, mant_result_shifted[13+1+FRAC_MANT_WIDTH-1:8]}; // 13+FRAC_MANT_WIDTH+3 = 26bit
    assign shifted_mant_result = final_mant[25:3]; // 上位23bitを取得
    // 2. 指数部の計算 (Step 4.)
    // assign final_exp = 8'd253 - exp_s3; // 254 -
    assign final_exp_bef = ({1'b0, exp_s3} + 127) >> 1; 
    assign final_exp = 8'd253 - final_exp_bef;
    // 3. 結果の組み立て (Step 5.)

    assign is_minus = sign_s3;
    
    assign result_s3 = {sign_s3, final_exp, shifted_mant_result};

    assign final_result = (is_minus) ? 32'h0000_0000 // NaN
                                     : result_s3;

    // --- S3 -> Output レジスタ ---
    logic [31:0] result_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result_reg <= 32'd0;
        end else begin
            result_reg <= final_result;
        end
    end

    assign result = result_reg; // 3サイクル後の結果を出力

endmodule