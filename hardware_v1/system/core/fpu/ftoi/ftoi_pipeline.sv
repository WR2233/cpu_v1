 `timescale 1ns/1ps

module ftoi_pipeline (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [31:0] input_a, // (S0) 入力
    output logic [31:0] result
);

    // ----- STAGE 1 (Input Latch) -----
    // 入力値をFF（レジスタ）に格納する
    reg [31:0] input_a_s1;
    always_ff @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        input_a_s1 <= 32'b0;
      end else begin
        input_a_s1 <= input_a;
    end
    end

    logic [32:0] mantissa_s1_comb;
    logic [7:0]  exponent_s1_comb;
    logic        sign_s1_comb;
    assign sign_s1_comb     = input_a_s1[31];
    assign exponent_s1_comb = input_a_s1[30:23];
    assign mantissa_s1_comb = {8'b0,1'b1, input_a_s1[22:0], 1'b0}; // 暗黙の1を追加
    logic [7:0] shift_amount_s1_comb;
    assign shift_amount_s1_comb = 8'd150 - exponent_s1_comb; // 127 + 23
    logic [7:0] shift_amount_s1_comb2;
    assign shift_amount_s1_comb2 = exponent_s1_comb - 8'd150; // 127 + 23
    logic [32:0] shifted_mantissa_s1_comb;
    assign shifted_mantissa_s1_comb = (exponent_s1_comb < 8'd150) ? 
                                      (mantissa_s1_comb >> shift_amount_s1_comb) : 
                                      (mantissa_s1_comb << shift_amount_s1_comb2);
    logic [31:0] result_s1_comb;
    assign result_s1_comb = shifted_mantissa_s1_comb[0] ? 
                            shifted_mantissa_s1_comb[32:1] + 1 : 
                            shifted_mantissa_s1_comb[32:1];
    // assign result_s1_comb = shifted_mantissa_s1_comb[32:1];
    logic [31:0] final_result;
    assign final_result = sign_s1_comb ? -result_s1_comb : result_s1_comb;
    always_ff @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        result <= 32'b0;
      end else begin
        result <= final_result;
      end
    end


endmodule
