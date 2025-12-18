`default_nettype wire

module pc_instr_fifo # (
    parameter fifo_depth = 4, // 2^n
    parameter INVALID_PC = 32'hfafafafa,
    parameter NOPE_INSTR = 0
) (
    input clk,
    input rstn,
    input logic [31:0] store_pc_data_bram,
    input logic [31:0] store_pc_data_ddr,
    input logic [31:0] store_pcnext_data_bram,
    input logic [31:0] store_pcnext_data_ddr,
    input logic [31:0] store_pcplus4_data_bram,
    input logic [31:0] store_pcplus4_data_ddr,
    input logic [31:0] store_instr_data_bram,
    input logic [31:0] store_instr_data_ddr,
    input logic store_pc_bram,
    input logic store_pc_ddr,
    input logic store_instr_bram,
    input logic store_instr_ddr,
    input logic proceed,
    input logic flush_and_store_pcanswer_into_head_bram, // always store PCAnswer into head when flushing fifo
    input logic flush_and_store_pcanswer_into_head_ddr, // always store PCAnswer into head when flushing fifo
    input logic flush_only_ddr,
    output logic [31:0] head_pc,
    output logic [31:0] head_pcnext,
    output logic [31:0] head_pcplus4,
    output logic [31:0] head_instr,
    output logic pc_fifo_full_bram,
    output logic pc_fifo_full_ddr,
    output logic can_proceed_pc_instr_fifo
);

// --- declarations ---
    logic [$clog2(fifo_depth)+1:0] fifo_counter_pc_bram;
    logic [$clog2(fifo_depth)+1:0] fifo_counter_pc_ddr;
    logic [$clog2(fifo_depth)+1:0] fifo_counter_instr_bram;
    logic [$clog2(fifo_depth)+1:0] fifo_counter_instr_ddr;
    logic [31:0] pc_fifo_bram [fifo_depth]; // LUT RAM
    logic [31:0] pc_fifo_ddr [fifo_depth];
    logic [31:0] pcplus4_fifo_bram [fifo_depth];
    logic [31:0] pcplus4_fifo_ddr [fifo_depth];
    logic [31:0] pcnext_fifo_bram [fifo_depth];
    logic [31:0] pcnext_fifo_ddr [fifo_depth];
    logic [31:0] instr_fifo_bram [fifo_depth];
    logic [31:0] instr_fifo_ddr [fifo_depth];
    logic [$clog2(2*fifo_depth)-1:0] head_index; // overall head index
    logic [$clog2(2*fifo_depth)-1:0] tail_index; // overall tail index
    logic [$clog2(fifo_depth)-1:0] head_index_bram; // pc & instr
    logic [$clog2(fifo_depth)-1:0] head_index_ddr;
    logic [$clog2(fifo_depth)-1:0] tail_index_pc_bram;
    logic [$clog2(fifo_depth)-1:0] tail_index_pc_ddr;
    logic [$clog2(fifo_depth)-1:0] tail_index_instr_bram;
    logic [$clog2(fifo_depth)-1:0] tail_index_instr_ddr;
    logic [2*fifo_depth-1:0] bram_or_ddr;

    // for debug
    logic [31:0] pc_queue_in_order_bram [fifo_depth];
    logic [31:0] pc_queue_in_order_ddr [fifo_depth];
    logic [31:0] inst_queue_in_order_bram [fifo_depth];
    logic [31:0] inst_queue_in_order_ddr [fifo_depth];
    logic [2*fifo_depth-1:0] bram_or_ddr_in_order;
    logic error_pc_instr_fifo;

// --- wires ---
    assign head_pc = ~bram_or_ddr[head_index] ? pc_fifo_bram[head_index_bram] : pc_fifo_ddr[head_index_ddr];
    assign head_pcnext = ~bram_or_ddr[head_index] ? pcnext_fifo_bram[head_index_bram] : pcnext_fifo_ddr[head_index_ddr];
    assign head_pcplus4 = ~bram_or_ddr[head_index] ? pcplus4_fifo_bram[head_index_bram] : pcplus4_fifo_ddr[head_index_ddr];
    assign head_instr = ~bram_or_ddr[head_index] ? instr_fifo_bram[head_index_bram] : instr_fifo_ddr[head_index_ddr];
    assign pc_fifo_full_bram = (fifo_counter_pc_bram == fifo_depth);
    assign pc_fifo_full_ddr = (fifo_counter_pc_ddr == fifo_depth);
    assign can_proceed_pc_instr_fifo = ~bram_or_ddr[head_index] ? (fifo_counter_instr_bram != 0) : (fifo_counter_instr_ddr != 0);

    // for debug
    always_comb begin
        for (int i = 0; i < fifo_depth; i++) begin
            pc_queue_in_order_bram[i] = pc_fifo_bram[(head_index_bram+i)%fifo_depth];
            pc_queue_in_order_ddr[i] = pc_fifo_ddr[(head_index_ddr+i)%fifo_depth];
            inst_queue_in_order_bram[i] = instr_fifo_bram[(head_index_bram+i)%fifo_depth];
            inst_queue_in_order_ddr[i] = instr_fifo_ddr[(head_index_ddr+i)%fifo_depth];
        end
    end
    always_comb begin
        for (int i = 0; i < 2 * fifo_depth; i++) begin
            bram_or_ddr_in_order[i] = bram_or_ddr[(head_index_bram+i)%(2*fifo_depth)];
        end
    end

// --- FF ---
    // fifo (can store and proceed at the same time)
    always_ff @(posedge clk) begin
        if (~rstn) begin
            head_index <= 0;
            tail_index <= 0;
            head_index_bram <= 0;
            head_index_ddr <= 0;
            tail_index_pc_bram <= 0;
            tail_index_pc_ddr <= 0;
            tail_index_instr_bram <= 0;
            tail_index_instr_ddr <= 0;
            bram_or_ddr <= 0;
            error_pc_instr_fifo <= 0;
            for (int i = 0; i < fifo_depth; i++) begin
                pc_fifo_bram[i] <= INVALID_PC;
                pcnext_fifo_bram[i] <= INVALID_PC;
                pcplus4_fifo_bram[i] <= INVALID_PC;
                instr_fifo_bram[i] <= NOPE_INSTR;                
                pc_fifo_ddr[i] <= INVALID_PC;
                pcnext_fifo_ddr[i] <= INVALID_PC;
                pcplus4_fifo_ddr[i] <= INVALID_PC;
                instr_fifo_ddr[i] <= NOPE_INSTR;
            end
        end else begin            
            if (flush_and_store_pcanswer_into_head_bram) begin
                head_index <= 0;
                tail_index <= 1;
                head_index_bram <= 0;
                head_index_ddr <= 0;
                tail_index_pc_bram <= 1;
                tail_index_pc_ddr <= 0;
                tail_index_instr_bram <= 0;
                tail_index_instr_ddr <= 0;
                bram_or_ddr <= {{(2*fifo_depth-1){1'b0}}, 1'b0};
                for (int i = 0; i < fifo_depth; i++) begin
                    if (i == 0) begin
                        pc_fifo_bram[i] <= store_pc_data_bram;
                        pcnext_fifo_bram[i] <= store_pcnext_data_bram;
                        pcplus4_fifo_bram[i] <= store_pcplus4_data_bram;
                        instr_fifo_bram[i] <= NOPE_INSTR;
                        pc_fifo_ddr[i] <= INVALID_PC;
                        pcnext_fifo_ddr[i] <= INVALID_PC;
                        pcplus4_fifo_ddr[i] <= INVALID_PC;
                        instr_fifo_ddr[i] <= NOPE_INSTR;
                    end else begin
                        pc_fifo_bram[i] <= INVALID_PC;
                        pcnext_fifo_bram[i] <= INVALID_PC;
                        pcplus4_fifo_bram[i] <= INVALID_PC;
                        instr_fifo_bram[i] <= NOPE_INSTR;
                        pc_fifo_ddr[i] <= INVALID_PC;
                        pcnext_fifo_ddr[i] <= INVALID_PC;
                        pcplus4_fifo_ddr[i] <= INVALID_PC;
                        instr_fifo_ddr[i] <= NOPE_INSTR;
                    end
                end
            end else if (flush_and_store_pcanswer_into_head_ddr) begin
                head_index <= 0;
                tail_index <= 1;
                head_index_bram <= 0;
                head_index_ddr <= 0;
                tail_index_pc_bram <= 0;
                tail_index_pc_ddr <= 1;
                tail_index_instr_bram <= 0;
                tail_index_instr_ddr <= 0;
                bram_or_ddr <= {{(2*fifo_depth-1){1'b0}}, 1'b1};
                for (int i = 0; i < fifo_depth; i++) begin
                    if (i == 0) begin
                        pc_fifo_bram[i] <= INVALID_PC;
                        pcnext_fifo_bram[i] <= INVALID_PC;
                        pcplus4_fifo_bram[i] <= INVALID_PC;
                        instr_fifo_bram[i] <= NOPE_INSTR;
                        pc_fifo_ddr[i] <= store_pc_data_ddr;
                        pcnext_fifo_ddr[i] <= store_pcnext_data_ddr;
                        pcplus4_fifo_ddr[i] <= store_pcplus4_data_ddr;
                        instr_fifo_ddr[i] <= NOPE_INSTR;
                    end else begin
                        pc_fifo_bram[i] <= INVALID_PC;
                        pcnext_fifo_bram[i] <= INVALID_PC;
                        pcplus4_fifo_bram[i] <= INVALID_PC;
                        instr_fifo_bram[i] <= NOPE_INSTR;
                        pc_fifo_ddr[i] <= INVALID_PC;
                        pcnext_fifo_ddr[i] <= INVALID_PC;
                        pcplus4_fifo_ddr[i] <= INVALID_PC;
                        instr_fifo_ddr[i] <= NOPE_INSTR;
                    end
                end
            end else if (flush_only_ddr) begin
                head_index <= 0;
                tail_index <= 0;
                head_index_bram <= 0;
                head_index_ddr <= 0;
                tail_index_pc_bram <= 0;
                tail_index_pc_ddr <= 0;
                tail_index_instr_bram <= 0;
                tail_index_instr_ddr <= 0;
                bram_or_ddr <= 0;
                for (int i = 0; i < fifo_depth; i++) begin
                    pc_fifo_bram[i] <= INVALID_PC;
                    pcnext_fifo_bram[i] <= INVALID_PC;
                    pcplus4_fifo_bram[i] <= INVALID_PC;
                    instr_fifo_bram[i] <= NOPE_INSTR;
                    pc_fifo_ddr[i] <= INVALID_PC;
                    pcnext_fifo_ddr[i] <= INVALID_PC;
                    pcplus4_fifo_ddr[i] <= INVALID_PC;
                    instr_fifo_ddr[i] <= NOPE_INSTR;
                end
            end
            
            else begin
                if (proceed) begin // just proceed index
                    head_index <= (head_index + 1) % (2*fifo_depth);
                    if (~bram_or_ddr[head_index]) begin
                        head_index_bram <= (head_index_bram + 1) % (fifo_depth);

                        //clear
                        pc_fifo_bram[head_index_bram] <= INVALID_PC;
                        pcnext_fifo_bram[head_index_bram] <= INVALID_PC;
                        pcplus4_fifo_bram[head_index_bram] <= INVALID_PC;
                        instr_fifo_bram[head_index_bram] <= NOPE_INSTR;
                        bram_or_ddr[head_index] <= 0;
                    end else begin
                        head_index_ddr <= (head_index_ddr + 1) % (fifo_depth);

                        // clear
                        pc_fifo_ddr[head_index_ddr] <= INVALID_PC;
                        pcnext_fifo_ddr[head_index_ddr] <= INVALID_PC;
                        pcplus4_fifo_ddr[head_index_ddr] <= INVALID_PC;
                        instr_fifo_ddr[head_index_ddr] <= NOPE_INSTR;
                        bram_or_ddr[head_index] <= 0;
                    end
                end
                if (store_pc_bram & store_pc_ddr) begin
                    error_pc_instr_fifo <= 1; // 同時に成立はしないことを仮定
                end
                if (store_pc_bram) begin
                    pc_fifo_bram[tail_index_pc_bram] <= store_pc_data_bram;
                    pcnext_fifo_bram[tail_index_pc_bram] <= store_pcnext_data_bram;
                    pcplus4_fifo_bram[tail_index_pc_bram] <= store_pcplus4_data_bram;
                    tail_index_pc_bram <= (tail_index_pc_bram + 1) % fifo_depth;
                    bram_or_ddr[tail_index] <= 0;
                    tail_index <= (tail_index + 1) % (2*fifo_depth);
                end 
                if (store_pc_ddr) begin
                    pc_fifo_ddr[tail_index_pc_ddr] <= store_pc_data_ddr;
                    pcnext_fifo_ddr[tail_index_pc_ddr] <= store_pcnext_data_ddr;
                    pcplus4_fifo_ddr[tail_index_pc_ddr] <= store_pcplus4_data_ddr;
                    tail_index_pc_ddr <= (tail_index_pc_ddr + 1) % fifo_depth;
                    bram_or_ddr[tail_index] <= 1;
                    tail_index <= (tail_index + 1) % (2*fifo_depth);
                end
                if (store_instr_bram) begin
                    instr_fifo_bram[tail_index_instr_bram] <= store_instr_data_bram;
                    tail_index_instr_bram <= (tail_index_instr_bram + 1) % fifo_depth;
                end 
                if (store_instr_ddr) begin
                    instr_fifo_ddr[tail_index_instr_ddr] <= store_instr_data_ddr;
                    tail_index_instr_ddr <= (tail_index_instr_ddr + 1) % fifo_depth;
                end 
            end
        end
    end

    // fifo counter
    always_ff @(posedge clk) begin
        if (~rstn) begin
            fifo_counter_pc_bram <= 0;
            fifo_counter_pc_ddr <= 0;
            fifo_counter_instr_bram <= 0;
            fifo_counter_instr_ddr <= 0;
        end else begin
            if (flush_and_store_pcanswer_into_head_bram | flush_and_store_pcanswer_into_head_ddr | flush_only_ddr) begin
                if (flush_and_store_pcanswer_into_head_bram) begin
                    fifo_counter_pc_bram <= 1;
                    fifo_counter_instr_bram <= 0;
                    fifo_counter_pc_ddr <= 0;
                    fifo_counter_instr_ddr <= 0;
                end 
                else if (flush_and_store_pcanswer_into_head_ddr) begin
                    fifo_counter_pc_ddr <= 1;
                    fifo_counter_instr_ddr <= 0;
                    fifo_counter_pc_bram <= 0;
                    fifo_counter_instr_bram <= 0;
                end
                else if (flush_only_ddr) begin                    
                    fifo_counter_pc_ddr <= 0;
                    fifo_counter_instr_ddr <= 0;
                    fifo_counter_pc_bram <= 0;
                    fifo_counter_instr_bram <= 0;
                end
            end else begin
                fifo_counter_pc_bram <= fifo_counter_pc_bram
                                        + store_pc_bram
                                        - ((~bram_or_ddr[head_index]) & proceed);

                fifo_counter_instr_bram <= fifo_counter_instr_bram
                                        + store_instr_bram
                                        - ((~bram_or_ddr[head_index]) & proceed);

                fifo_counter_pc_ddr <= fifo_counter_pc_ddr
                                        + store_pc_ddr
                                        - ((bram_or_ddr[head_index]) & proceed);

                fifo_counter_instr_ddr <= fifo_counter_instr_ddr
                                        + store_instr_ddr
                                        - ((bram_or_ddr[head_index]) & proceed);
            end
        end
    end


endmodule

`default_nettype wire

