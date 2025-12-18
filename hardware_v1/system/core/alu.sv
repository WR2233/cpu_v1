`default_nettype wire

// ALU

module alu (
   input logic [3:0] alu_control,
   input logic [31:0] operand_a,
   input logic [31:0] operand_b,

   output logic [31:0] result,
   output logic zero_flag
);

// ----- helper signal -----
    logic sign_a;
    assign sign_a = operand_a[31];
    logic [7:0]  exp_a;
    assign exp_a = operand_a[30:23];
    logic [22:0] mant_a;
    assign mant_a = operand_a[22:0];
    logic is_nan_a;
    assign is_nan_a = (exp_a == 8'hFF) && (mant_a != 0);
    logic is_zero_a;
    assign is_zero_a = (exp_a == 8'h00) && (mant_a == 0);

    logic sign_b;
    assign sign_b = operand_b[31];
    logic [7:0]  exp_b;
    assign exp_b = operand_b[30:23];
    logic [22:0] mant_b;
    assign mant_b = operand_b[22:0];
    logic is_nan_b;
    assign is_nan_b = (exp_b == 8'hFF) && (mant_b != 0);
    logic is_zero_b;
    assign is_zero_b = (exp_b == 8'h00) && (mant_b == 0);

    logic [31:0] result_flt;
    assign result_flt = (!is_nan_a && !is_nan_b) &&
                            !(is_zero_a && is_zero_b) &&
                            ( (sign_a != sign_b) ?
                                sign_a :
                                ( (sign_a == 0) ? ($unsigned(operand_a) < $unsigned(operand_b)) : ($unsigned(operand_a) > $unsigned(operand_b)) )
                            );

    logic [31:0] result_feq;
    assign result_feq = (!is_nan_a && !is_nan_b) &&
                            ( (operand_a == operand_b) || (is_zero_a && is_zero_b) );



// ----- calculation -----
    always_comb begin
        result = 0;
        case(alu_control)

// ----- integer -----
            0: begin // add signed
                result = $signed(operand_a) + $signed(operand_b);
            end
            1: begin // sub signed
                result = $signed(operand_a) - $signed(operand_b);
            end
            2: begin // and 
                result = operand_a & operand_b;
            end
            3: begin // or
                result = operand_a | operand_b;
            end
            4: begin // set less than signed
                result = ($signed(operand_a) < $signed(operand_b)) ? 1 : 0;
            end
            5: begin // shift left logical
                result =  operand_a << operand_b[4:0];
            end
            6: begin // shift right logical
                result = operand_a >> operand_b[4:0];
            end
            7: begin // shift right arithmetic
                result = $signed(operand_a) >>> operand_b[4:0];
            end
            8: begin // xor
                result = operand_a ^ operand_b;
            end
            9: begin // set less than unsigned
                result = (operand_a < operand_b) ? 1 : 0;
            end  

// ----- floating point -----
            10: begin // fle
                result = result_flt || result_feq;
            end
            11: begin // flt
                result = result_flt;
            end
            12: begin // feq
                result = result_feq;
            end
            13: begin // fsgnj
                result = {operand_b[31], operand_a[30:0]};
            end
            14: begin // fsgnjn
                result = {~operand_b[31], operand_a[30:0]};
            end
            15: begin // fsgnjx
                result = {operand_a[31] ^ operand_b[31], operand_a[30:0]};
            end        
        endcase
    end

// ----- zero flag -----
    always_comb begin
        if (result == 0) begin
            zero_flag = 1;
        end else begin
            zero_flag = 0;
        end
    end

endmodule

`default_nettype wire
