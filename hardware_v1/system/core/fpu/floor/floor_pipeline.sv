 `timescale 1ns/1ps

module floor_pipeline (
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

    logic [23:0] mantissa_s1_comb;
    logic [7:0]  exponent_s1_comb;
    logic        sign_s1_comb;
    assign sign_s1_comb     = input_a_s1[31];
    assign exponent_s1_comb = input_a_s1[30:23];
    assign mantissa_s1_comb = {1'b1, input_a_s1[22:0]};
    logic [7:0]  exponent_s1_comb_plus1;
    assign exponent_s1_comb_plus1 = exponent_s1_comb + 1;
    logic big_enough;
    assign big_enough = (exponent_s1_comb >= 8'd127 + 23); // E >= 150
    logic [7:0] shift_amount_s1_comb;
    assign shift_amount_s1_comb = 8'd150 - exponent_s1_comb; // 127 - E
    logic [23:0] shifted_mantissa_s1_comb;
    assign shifted_mantissa_s1_comb = mantissa_s1_comb >> shift_amount_s1_comb;
    logic [23:0] shifted_mantissa_s1_comb_plus1;
    assign shifted_mantissa_s1_comb_plus1 = shifted_mantissa_s1_comb + 1'b1;
    logic [23:0] shifted_shifted_mantissa;
    assign shifted_shifted_mantissa = shifted_mantissa_s1_comb << shift_amount_s1_comb;
    logic [23:0] shifted_shifted_mantissa_plus1;
    assign shifted_shifted_mantissa_plus1 = shifted_mantissa_s1_comb_plus1 << shift_amount_s1_comb;
    logic [31:0] result_s1_comb;
    logic fractional_part_exists;
    assign fractional_part_exists = (mantissa_s1_comb != shifted_shifted_mantissa);
    logic exp_changed;
    // assign exp_changed = (shifted_shifted_mantissa[23] != shifted_shifted_mantissa_plus1[23]);
    assign result_s1_comb = big_enough ? input_a_s1 :
                                (sign_s1_comb ? 
                                (shifted_shifted_mantissa[23] ?  
                                (fractional_part_exists ? 
                                    (shifted_shifted_mantissa_plus1[23] ? 
                                        {sign_s1_comb, exponent_s1_comb, shifted_shifted_mantissa_plus1[22:0]} : 
                                        {sign_s1_comb, exponent_s1_comb_plus1, shifted_shifted_mantissa_plus1[22:0]}) 
                                    : input_a_s1) :{32'hBF800000}// -1
                                )

                                :(shifted_shifted_mantissa[23] ? {sign_s1_comb, exponent_s1_comb, shifted_shifted_mantissa[22:0]} : 32'b0));
    always_ff @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        result <= 32'b0;
      end else begin
        result <= result_s1_comb;
      end
    end



endmodule
