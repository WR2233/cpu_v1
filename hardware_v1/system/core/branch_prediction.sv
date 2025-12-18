`default_nettype wire

// Branch Precdictor

module branch_predictor #(
    parameter INVALID_PC =32'hfafafafa,
    parameter KEEP_EXPCETCING_PC_NEXT = 32'hbfbfbfbf
)(
   input logic clk,
   input logic rstn,

   input logic [31:0] PC,
   output logic [31:0] Next_PC,

   input logic update, // asserted when branch predictor's prediction tuned out to be wrong
   input logic [31:0] wrong_PC, // the wrong answer
   input logic update_taken, // correct answer of taken or untaken
   input logic [31:0] update_PC // correct answer
);

    always_comb begin
        if (PC == INVALID_PC) begin
            Next_PC = KEEP_EXPCETCING_PC_NEXT;
        end else begin
            Next_PC = PC + 4;
        end
    end

endmodule

`default_nettype wire
