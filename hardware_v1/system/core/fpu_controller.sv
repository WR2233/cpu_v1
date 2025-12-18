`default_nettype wire

// FPU

module fpu # (
    parameter REG_NUM = 32
)(
    input logic clk,
    input logic rstn,
    input logic fpu_start,
    input logic [3:0] fpu_control,
    input logic [31:0] operand_a,
    input logic [31:0] operand_b,
    input logic [$clog2(REG_NUM)-1:0] register_destination,
    input logic [31:0] fpu_inst_number_input,

    output logic int_scoreboard_write_enable,
    output logic [$clog2(REG_NUM)-1:0] int_scoreboard_write_addr,
    output logic int_scoreboard_write_data,
    output logic fpu_write_enable_int,
    output logic [$clog2(REG_NUM)-1:0] fpu_write_addr_int,
    output logic [31:0] fpu_write_data_int,

    output logic fp_scoreboard_write_enable,
    output logic [$clog2(REG_NUM)-1:0] fp_scoreboard_write_addr,
    output logic fp_scoreboard_write_data,
    output logic fpu_write_enable_fp,
    output logic [$clog2(REG_NUM)-1:0] fpu_write_addr_fp,
    output logic [31:0] fpu_write_data_fp,
    output logic [31:0] fpu_inst_number_output
);

// fpu_control = 0:fadd 1:fsub 2:fmul 3:fsqrt 4:fisqrt 5:finv 6:floor 7:ftoi 8:itof 9:fdiv

// ----- parameters -----
// Note: We assume CYCLES >= 1 (otherwise go to ALU)
    parameter NUM_FPU_CONTROL = 10;
    parameter MAX_CYCLES = 7;
    parameter FADD_CYCLES = 4;
    parameter FSUB_CYCLES = 4;
    parameter FMUL_CYCLES = 4;
    parameter FSQRT_CYCLES = 4;
    parameter FISQRT_CYCLES = 4;
    parameter FINV_CYCLES = 4;
    parameter FLOOR_CYCLES = 2;
    parameter FTOI_CYCLES = 2;
    parameter ITOF_CYCLES = 3;
    parameter FDIV_CYCLES = 7;

    parameter int CYCLES_LUT[NUM_FPU_CONTROL] = '{FADD_CYCLES, FSUB_CYCLES, FMUL_CYCLES, FSQRT_CYCLES, FISQRT_CYCLES, FINV_CYCLES, FLOOR_CYCLES, FTOI_CYCLES, ITOF_CYCLES, FDIV_CYCLES};
    parameter STAGES = MAX_CYCLES + 2; // longest cycle, must be larger than 2
    parameter REG_SD_BIT_WIDTH = $clog2(REG_NUM);



// ----- declarations -----

    logic [31:0] operand_a_latched;
    logic [31:0] operand_b_latched;

    always_ff @(posedge clk) begin
        if (~rstn) begin
            operand_a_latched <= 0;
            operand_b_latched <= 0;
        end else begin
            operand_a_latched <= operand_a;
            operand_b_latched <= operand_b;
        end
    end

    // -- result logics --
    logic [31:0] fadd_result;
    logic [31:0] fsub_result;
    logic [31:0] fmul_result;
    logic [31:0] fsqrt_result;
    logic [31:0] fisqrt_result;
    logic [31:0] finv_result;
    logic [31:0] floor_result;
    logic [31:0] ftoi_result;
    logic [31:0] itof_result;
    logic [31:0] fdiv_result;

    // -- pipeline registers --
    logic [$clog2(NUM_FPU_CONTROL)-1:0] fpu_control_pipe [STAGES];
    logic fpu_start_pipe [STAGES];
    logic [REG_SD_BIT_WIDTH-1:0] register_destination_pipe [STAGES];
    logic [31:0] fpu_inst_number_pipe [STAGES];
    logic [31:0] result_pipe [STAGES];



// ----- update of pipeline registers for all the stages -----

    always_ff @(posedge clk) begin
        if (~rstn) begin
            for (int i = 0; i < STAGES; i++) begin
                fpu_control_pipe[i] <= 0;
                fpu_start_pipe[i] <= 0;
                register_destination_pipe[i] <= 0;
                fpu_inst_number_pipe[i] <= 0;
                result_pipe[i] <= 0;
            end
        end else begin

            // control, start, rd pipe
            fpu_control_pipe[0] <= fpu_control;
            fpu_start_pipe[0] <= fpu_start;
            register_destination_pipe[0] <= register_destination;
            fpu_inst_number_pipe[0] <= fpu_inst_number_input; 
            for (int i = 1; i < STAGES; i++) begin
                fpu_control_pipe[i] <= fpu_control_pipe[i - 1];
                fpu_start_pipe[i] <= fpu_start_pipe[i - 1];
                register_destination_pipe[i] <= register_destination_pipe[i - 1];
                fpu_inst_number_pipe[i] <= fpu_inst_number_pipe[i - 1];
            end

            // result pipe
            for (int i = 1; i < STAGES; i++) begin
                if (i == (CYCLES_LUT[fpu_control_pipe[i-1]] + 1)) begin
                    case (fpu_control_pipe[i - 1])
                        0:  result_pipe[i] <= fadd_result;
                        1:  result_pipe[i] <= fsub_result;
                        2:  result_pipe[i] <= fmul_result;
                        3:  result_pipe[i] <= fsqrt_result;
                        4:  result_pipe[i] <= fisqrt_result;
                        5:  result_pipe[i] <= finv_result;
                        6:  result_pipe[i] <= floor_result;
                        7:  result_pipe[i] <= ftoi_result;
                        8:  result_pipe[i] <= itof_result;
                        9:  result_pipe[i] <= fdiv_result;
                    endcase
                end else begin
                    result_pipe[i] <= result_pipe[i - 1];
                end
            end
        end
    end



// ----- signals -----

    // to float reg
    // wait for the max stages
    assign fp_scoreboard_write_enable = fpu_start_pipe[STAGES-1] & (fpu_control_pipe[STAGES-1] != 7);
    assign fp_scoreboard_write_addr = register_destination_pipe[STAGES-1];
    assign fp_scoreboard_write_data = 0;

    assign fpu_write_enable_fp = fpu_start_pipe[STAGES-1]  & (fpu_control_pipe[STAGES-1] != 7);
    assign fpu_write_addr_fp = register_destination_pipe[STAGES-1];
    assign fpu_write_data_fp = result_pipe[STAGES-1];

    // to integer reg
    // wait for the max stages
    assign int_scoreboard_write_enable = fpu_start_pipe[STAGES-1] & (fpu_control_pipe[STAGES-1] == 7); // ftoi
    assign int_scoreboard_write_addr = register_destination_pipe[STAGES-1];
    assign int_scoreboard_write_data = 0;

    assign fpu_write_enable_int = fpu_start_pipe[STAGES-1] & (fpu_control_pipe[STAGES-1] == 7);
    assign fpu_write_addr_int = register_destination_pipe[STAGES-1];
    assign fpu_write_data_int = result_pipe[STAGES-1];

    assign fpu_inst_number_output = fpu_inst_number_pipe[STAGES-1];



// ----- CALCULATION (pipeline calculation) -----

    // fadd
    fadd_pipeline u_fadd (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .input_b (operand_b_latched),
        .result  (fadd_result)
    );

    // fsub
    fsub_pipeline u_fsub (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .input_b (operand_b_latched),
        .result  (fsub_result)
    );

    // fmul
    fmul_pipeline u_fmul (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .input_b (operand_b_latched),
        .result  (fmul_result)
    );

    // fsqrt
    fsqrt_pipeline u_fsqrt (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .result  (fsqrt_result)
    );

    // fisqrt
    fisqrt_pipeline u_fisqrt (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .result  (fisqrt_result)
    );

    // finv
    finv_pipeline u_finv (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .result  (finv_result)
    );

    // floor
    floor_pipeline u_floor (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .result  (floor_result)
    );

    // ftoi
    ftoi_pipeline u_ftoi (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .result  (ftoi_result)
    );

    // itof
    itof_pipeline u_itof (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .result  (itof_result)
    );

    // fdiv
    fdiv_pipeline u_fdiv (
        .clk     (clk),
        .rst_n   (rstn),
        .input_a (operand_a_latched),
        .input_b (operand_b_latched),
        .result  (fdiv_result)
    );



endmodule

`default_nettype wire
