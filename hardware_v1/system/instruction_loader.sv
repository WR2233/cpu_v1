`default_nettype wire

// Instruction loader

module instruction_loader # (
    parameter INSTR_BRAM_SIZE_WORDS = 250,
    parameter OPCODE_BIT_WIDTH = 7,
    parameter CACHE_LINE_SIZE_BIT = 128, // must be 2^n
    parameter INST_LOADER_FIFO_DEPTH = 64
) (
    input logic clk,
    input logic rstn,

    input logic [7:0] uart_rx_data,
    input logic uart_rx_valid,
    output logic uart_rx_ready,

    // into DDR
    input logic instr_mem_req_ready_DDR,
    output logic instr_write_enable_DDR, // req valid
    output logic [31:0] instr_write_addr_DDR,
    output logic [CACHE_LINE_SIZE_BIT-1:0] instr_write_data_DDR,

    // into BRAM/ROM
    output logic instr_write_enable_BRAM_ROM,
    output logic [31:0] instr_write_addr_BRAM_ROM,
    output logic [31:0] instr_write_data_BRAM_ROM,
    output logic data_table_or_instr_bram,  // into instr bram or into data table

    output logic instr_load_done
);

// ---- declarations -----
    logic [31:0] PC_counter; // Address to write next
    logic [31:0] instr; // received word
    logic [31:0] PROGRAM_SIZE_BYTES; // size in bytes including outer_array/fp immediates
    logic [31:0] PC_END; // final instruction's program counter
    logic program_size_loaded;
    logic [OPCODE_BIT_WIDTH-1:0] opcode;
    localparam CACHE_LINE_SIZE_WORDS = CACHE_LINE_SIZE_BIT / 32; 

    typedef enum logic [3:0] {
        S_RECEIVING_INSTR_1st_BYTE                 = 1,
        S_RECEIVING_INSTR_2nd_BYTE                 = 2,
        S_RECEIVING_INSTR_3rd_BYTE                 = 3,
        S_RECEIVING_INSTR_4th_BYTE_INTO_BRAM       = 4,
        S_RECEIVING_INSTR_4th_BYTE_INTO_FIFO       = 5, // data → FIFO → cache/DDR
        S_WAITING_FOR_FIFO_SPACE                   = 6,
        S_RECEIVING_DATA_IN_PROGRAM_1st_BYTE       = 7,
        S_RECEIVING_DATA_IN_PROGRAM_2nd_BYTE       = 8,
        S_RECEIVING_DATA_IN_PROGRAM_3rd_BYTE       = 9,
        S_RECEIVING_DATA_IN_PROGRAM_4th_BYTE       = 10,
        S_LOAD_DONE                                = 11
    } instr_loader_state_t;

    instr_loader_state_t state_instr_loader;


    typedef enum logic [1:0] {
        S_IDLE          = 0,
        S_WRITE_WAITING = 1,
        S_DDR_DONE      = 2
    } ddr_instr_loader_state_t;

    ddr_instr_loader_state_t state_DDR_instr_loader;


    // send FIFO
    logic [31:0] PC_FIFO [INST_LOADER_FIFO_DEPTH];
    logic [31:0] INST_LOADER_FIFO [INST_LOADER_FIFO_DEPTH]; // for data
    localparam INST_LOADER_FIFO_COUNTER_BIT_WIDTH = $clog2(INST_LOADER_FIFO_DEPTH) + 1; // widend counter
    logic [INST_LOADER_FIFO_COUNTER_BIT_WIDTH-1:0] INST_LOADER_FIFO_counter;
    logic [INST_LOADER_FIFO_COUNTER_BIT_WIDTH-1:0] INST_LOADER_FIFO_ring_index_head;
    logic [INST_LOADER_FIFO_COUNTER_BIT_WIDTH-1:0] INST_LOADER_FIFO_ring_index_tail;
    logic INST_LOADER_FIFO_full;
    logic store_into_inst_loader_fifo;
    logic [$clog2(CACHE_LINE_SIZE_WORDS):0] consume_from_inst_loader_fifo;

// ---- combinational -----
    assign instr_load_done = (state_instr_loader == S_LOAD_DONE) & (state_DDR_instr_loader == S_DDR_DONE); // not any more data and FIFO empty
    assign INST_LOADER_FIFO_full = (INST_LOADER_FIFO_counter == INST_LOADER_FIFO_DEPTH);

    always_comb begin
        uart_rx_ready = 0;
        instr_write_data_DDR = 0;
        instr_write_addr_DDR = 0;
        instr_write_enable_DDR = 0;
        instr_write_data_BRAM_ROM = 0;
        instr_write_addr_BRAM_ROM = 0;
        instr_write_enable_BRAM_ROM = 0;
        data_table_or_instr_bram = 0;
        store_into_inst_loader_fifo = 0;
        consume_from_inst_loader_fifo = 0;

        // load & BRAM
        case (state_instr_loader)
            S_RECEIVING_INSTR_1st_BYTE: begin
                uart_rx_ready = 1;
            end
            S_RECEIVING_INSTR_2nd_BYTE: begin
                uart_rx_ready = 1;
            end
            S_RECEIVING_INSTR_3rd_BYTE: begin
                uart_rx_ready = 1;
            end
            S_RECEIVING_INSTR_4th_BYTE_INTO_BRAM: begin // don't store into FIFO
                uart_rx_ready = 1;
                if (uart_rx_valid) begin
                    instr_write_data_BRAM_ROM = {uart_rx_data, instr[23:0]};
                    instr_write_addr_BRAM_ROM = PC_counter;
                    instr_write_enable_BRAM_ROM = ((opcode != 0) & program_size_loaded);
                    data_table_or_instr_bram = 1;
                end
            end
            S_RECEIVING_INSTR_4th_BYTE_INTO_FIFO: begin // store into FIFO
                uart_rx_ready = 1;
                if ((opcode != 0) & (~INST_LOADER_FIFO_full) & (uart_rx_valid)) begin
                    store_into_inst_loader_fifo = 1;
                end
            end
            S_WAITING_FOR_FIFO_SPACE: begin
                uart_rx_ready = 0;   
                if (~INST_LOADER_FIFO_full) begin
                    store_into_inst_loader_fifo = 1;
                end                
            end
            S_RECEIVING_DATA_IN_PROGRAM_1st_BYTE: begin
                uart_rx_ready = 1;
            end
            S_RECEIVING_DATA_IN_PROGRAM_2nd_BYTE: begin
                uart_rx_ready = 1;
            end
            S_RECEIVING_DATA_IN_PROGRAM_3rd_BYTE: begin
                uart_rx_ready = 1;
            end
            S_RECEIVING_DATA_IN_PROGRAM_4th_BYTE: begin
                uart_rx_ready = 1;
                if (uart_rx_valid) begin
                    instr_write_data_BRAM_ROM = {uart_rx_data, instr[23:0]};
                    instr_write_addr_BRAM_ROM = PC_counter - PC_END; // data table address also starts from 0
                    instr_write_enable_BRAM_ROM = 1;
                    data_table_or_instr_bram = 0;
                end
            end
            S_LOAD_DONE: begin
                uart_rx_ready = 0;
            end
        endcase

        // into DDR + cache
        case (state_DDR_instr_loader)
            S_IDLE: begin
                instr_write_enable_DDR = ((INST_LOADER_FIFO_counter != 0) & (INST_LOADER_FIFO_counter % CACHE_LINE_SIZE_WORDS == 0)) | (opcode == 0 & (INST_LOADER_FIFO_counter != 0));
                // LSB first
                instr_write_data_DDR = {INST_LOADER_FIFO[(INST_LOADER_FIFO_ring_index_head+3) % INST_LOADER_FIFO_DEPTH], INST_LOADER_FIFO[(INST_LOADER_FIFO_ring_index_head+2) % INST_LOADER_FIFO_DEPTH], INST_LOADER_FIFO[(INST_LOADER_FIFO_ring_index_head+1) % INST_LOADER_FIFO_DEPTH], INST_LOADER_FIFO[INST_LOADER_FIFO_ring_index_head % INST_LOADER_FIFO_DEPTH]};
                instr_write_addr_DDR = PC_FIFO[INST_LOADER_FIFO_ring_index_head % INST_LOADER_FIFO_DEPTH] - INSTR_BRAM_SIZE_WORDS * 4;
                if (instr_write_enable_DDR & instr_mem_req_ready_DDR) begin
                    consume_from_inst_loader_fifo = CACHE_LINE_SIZE_WORDS;
                end
            end
            S_WRITE_WAITING: begin
                instr_write_enable_DDR = 1;
                // LSB first
                instr_write_data_DDR = {INST_LOADER_FIFO[(INST_LOADER_FIFO_ring_index_head+3) % INST_LOADER_FIFO_DEPTH], INST_LOADER_FIFO[(INST_LOADER_FIFO_ring_index_head+2) % INST_LOADER_FIFO_DEPTH], INST_LOADER_FIFO[(INST_LOADER_FIFO_ring_index_head+1) % INST_LOADER_FIFO_DEPTH], INST_LOADER_FIFO[INST_LOADER_FIFO_ring_index_head % INST_LOADER_FIFO_DEPTH]};
                instr_write_addr_DDR = PC_FIFO[INST_LOADER_FIFO_ring_index_head % INST_LOADER_FIFO_DEPTH] - INSTR_BRAM_SIZE_WORDS * 4;
                if (instr_mem_req_ready_DDR) begin
                    consume_from_inst_loader_fifo = CACHE_LINE_SIZE_WORDS;
                end
            end
            S_DDR_DONE: begin
                instr_write_enable_DDR = 0;
            end
        endcase
    end
    
// ---- double FSM -----
    
    // load & BRAM
    always_ff @(posedge clk) begin
        if (~rstn) begin
            state_instr_loader <= S_RECEIVING_INSTR_1st_BYTE;
            PC_counter <= 0;
            PC_END <= 0;
            program_size_loaded <= 0;
            INST_LOADER_FIFO_ring_index_tail <= 0; // FIFO starts from LSB side
            opcode <= 1; // initialize non-zero
            INST_LOADER_FIFO_counter <= 0;
            for (int i = 0; i < INST_LOADER_FIFO_DEPTH; i = i + 1) begin
                INST_LOADER_FIFO[i] <= 0;
            end
        end else begin
            INST_LOADER_FIFO_counter <= (INST_LOADER_FIFO_counter + store_into_inst_loader_fifo >= consume_from_inst_loader_fifo) ? (INST_LOADER_FIFO_counter + store_into_inst_loader_fifo - consume_from_inst_loader_fifo) : 0;
            case (state_instr_loader)
                S_RECEIVING_INSTR_1st_BYTE: begin
                    if (uart_rx_valid) begin
                        instr[7:0] <= uart_rx_data;
                        state_instr_loader <= S_RECEIVING_INSTR_2nd_BYTE;
                        if (program_size_loaded) begin
                            opcode <= uart_rx_data[OPCODE_BIT_WIDTH-1:0];
                        end
                    end
                end
                S_RECEIVING_INSTR_2nd_BYTE: begin
                    if (uart_rx_valid) begin
                        instr[15:8] <= uart_rx_data;
                        state_instr_loader <= S_RECEIVING_INSTR_3rd_BYTE;
                    end
                end
                S_RECEIVING_INSTR_3rd_BYTE: begin
                    if (uart_rx_valid) begin
                        instr[23:16] <= uart_rx_data;
                        if (PC_counter >= INSTR_BRAM_SIZE_WORDS * 4) begin
                            state_instr_loader <= S_RECEIVING_INSTR_4th_BYTE_INTO_FIFO;
                        end else begin
                            state_instr_loader <= S_RECEIVING_INSTR_4th_BYTE_INTO_BRAM;
                        end
                    end
                end
                S_RECEIVING_INSTR_4th_BYTE_INTO_BRAM: begin
                    if (uart_rx_valid) begin
                        instr[31:24] <= uart_rx_data;
                        if (~program_size_loaded) begin
                            PROGRAM_SIZE_BYTES <= {uart_rx_data, instr[23:0]};
                            state_instr_loader <= S_RECEIVING_INSTR_1st_BYTE;
                            program_size_loaded <= 1;
                        end else begin
                            if (opcode == 0) begin // final instruction already loaded
                                state_instr_loader <= S_RECEIVING_DATA_IN_PROGRAM_1st_BYTE;
                                PC_END <= PC_counter;
                            end else begin
                                PC_counter <= PC_counter + 4;
                                state_instr_loader <= S_RECEIVING_INSTR_1st_BYTE; // instr bram allows successive access
                            end
                        end
                    end
                end
                S_RECEIVING_INSTR_4th_BYTE_INTO_FIFO: begin
                    if (uart_rx_valid) begin // instr_write_enable_DDR asserted
                        instr[31:24] <= uart_rx_data;
                        if (opcode == 0) begin // no need to store into FIFO
                            state_instr_loader <= S_RECEIVING_DATA_IN_PROGRAM_1st_BYTE;
                            PC_END <= PC_counter;
                        end else if (~INST_LOADER_FIFO_full) begin // not full yet -> store into FIFO
                            INST_LOADER_FIFO[INST_LOADER_FIFO_ring_index_tail] <= {uart_rx_data, instr[23:0]}; // store 1 word into FIFO
                            PC_FIFO[INST_LOADER_FIFO_ring_index_tail] <= PC_counter;
                            INST_LOADER_FIFO_ring_index_tail <= (INST_LOADER_FIFO_ring_index_tail + 1) % INST_LOADER_FIFO_DEPTH;
                            state_instr_loader <= S_RECEIVING_INSTR_1st_BYTE;
                            PC_counter <= PC_counter + 4;
                        end else begin
                            state_instr_loader <= S_WAITING_FOR_FIFO_SPACE;
                        end
                    end
                end
                S_WAITING_FOR_FIFO_SPACE: begin
                    if (~INST_LOADER_FIFO_full) begin
                        INST_LOADER_FIFO[INST_LOADER_FIFO_ring_index_tail] <= instr; // store 1 word into FIFO
                        PC_FIFO[INST_LOADER_FIFO_ring_index_tail] <= PC_counter;
                        INST_LOADER_FIFO_ring_index_tail <= (INST_LOADER_FIFO_ring_index_tail + 1) % INST_LOADER_FIFO_DEPTH;
                        PC_counter <= PC_counter + 4;
                    end
                end
                S_RECEIVING_DATA_IN_PROGRAM_1st_BYTE: begin
                    if (uart_rx_valid) begin
                        instr[7:0] <= uart_rx_data;
                        state_instr_loader <= S_RECEIVING_DATA_IN_PROGRAM_2nd_BYTE;
                    end
                end
                S_RECEIVING_DATA_IN_PROGRAM_2nd_BYTE: begin
                    if (uart_rx_valid) begin
                        instr[15:8] <= uart_rx_data;
                        state_instr_loader <= S_RECEIVING_DATA_IN_PROGRAM_3rd_BYTE;
                    end
                end
                S_RECEIVING_DATA_IN_PROGRAM_3rd_BYTE: begin
                    if (uart_rx_valid) begin
                        instr[23:16] <= uart_rx_data;
                        state_instr_loader <= S_RECEIVING_DATA_IN_PROGRAM_4th_BYTE;
                    end
                end
                S_RECEIVING_DATA_IN_PROGRAM_4th_BYTE: begin
                    if (uart_rx_valid) begin
                        instr[31:24] <= uart_rx_data;
                        if (PC_counter + 4 == PROGRAM_SIZE_BYTES - 4) begin // instr + 0x00000000 + data
                            state_instr_loader <= S_LOAD_DONE;
                        end else begin
                            PC_counter <= PC_counter + 4;
                            state_instr_loader <= S_RECEIVING_DATA_IN_PROGRAM_1st_BYTE; // data_table is BRAM
                        end
                    end
                end
            endcase
        end
    end
    
    // write
    always_ff @(posedge clk) begin
        if (~rstn) begin
            state_DDR_instr_loader <= S_IDLE;
            // FIFO's head is LSB side
            INST_LOADER_FIFO_ring_index_head <= 0; // head tail initialization -> empty FIFO
        end else begin
            case (state_DDR_instr_loader)
                S_IDLE: begin
                    if (instr_write_enable_DDR) begin
                        if (instr_mem_req_ready_DDR) begin // memory is receiving data @ this cycle
                            INST_LOADER_FIFO_ring_index_head <= (INST_LOADER_FIFO_ring_index_head + CACHE_LINE_SIZE_WORDS) % INST_LOADER_FIFO_DEPTH;
                            // INST_LOADER_FIFO_ring_index_tail is unchanged 
                        end
                    end
                    
                    // state transition
                    if ((INST_LOADER_FIFO_counter == 0) & (opcode == 0) & program_size_loaded) begin
                        state_DDR_instr_loader <= S_DDR_DONE; // no more instructions
                    end else if (instr_write_enable_DDR & ~instr_mem_req_ready_DDR) begin
                        state_DDR_instr_loader <= S_WRITE_WAITING;
                    end
                end
                S_WRITE_WAITING: begin // enable ON
                    if (instr_mem_req_ready_DDR) begin // memory is receiving data @ this cycle
                        INST_LOADER_FIFO_ring_index_head <= (INST_LOADER_FIFO_ring_index_head + CACHE_LINE_SIZE_WORDS) % INST_LOADER_FIFO_DEPTH;
                        // INST_LOADER_FIFO_ring_index_tail is unchanged 
                    end

                    // state transition
                    if ((INST_LOADER_FIFO_counter == 0) & (opcode == 0) & program_size_loaded) begin
                        state_DDR_instr_loader <= S_DDR_DONE;
                    end else begin
                        state_DDR_instr_loader <= S_IDLE;
                    end
                end
                S_DDR_DONE: begin
                end
            endcase
        end
    end

endmodule

`default_nettype wire