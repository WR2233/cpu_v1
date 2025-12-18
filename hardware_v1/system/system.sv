`default_nettype wire

// System motherboard
// "ROM" can be written in this context

module system (
    input logic clk,
    input logic rstn,

    input logic uart_rx,
    output logic uart_tx,
    output logic halted,

    // for DDR2
    output wire [12:0] ddr2_addr,
    output wire [2:0]  ddr2_ba,
    output wire        ddr2_cas_n,
    output wire [0:0]  ddr2_ck_n,
    output wire [0:0]  ddr2_ck_p,
    output wire [0:0]  ddr2_cke,
    output wire        ddr2_ras_n,
    output wire        ddr2_we_n,
    inout  wire [15:0] ddr2_dq,
    inout  wire [1:0]  ddr2_dqs_n,
    inout  wire [1:0]  ddr2_dqs_p,
    output wire [0:0]  ddr2_cs_n,
    output wire [1:0]  ddr2_dm,
    output wire [0:0]  ddr2_odt
);

    import types_pkg::*;

// ============
// declarations
// ============

// ----- flexible settings -----

    // parameters should basically be 1 << n for optimization!

    // size settings
    parameter TOTAL_BRAM_SIZE_BYTES        = (4860000 - 2800000) / 8; // without cache 256 * 1000 Bytes
    parameter INSTR_BRAM_SIZE_BYTES        = 96 * 1024;
    localparam INSTR_MEM_SIZE_DDR_BYTES    = 0; // <---- !!!
    parameter STACK_BRAM_SIZE_BYTES        = 96 * 1024; // stack bram size = ideally 128KB
    parameter DDR_SIZE_ORDER               = 27; // bytes
    parameter PC_INST_FIFO_DEPTH           = 1 << 4;

    // UART settings
    parameter FCLK_MHz                     = 30; // cpu clk Hz
    parameter N                            = 16;
    parameter OVERSAMPLING_NUM             = 16;
    parameter SEND_FIFO_DEPTH_UART         = 1 << 4;
    parameter RECEIVE_FIFO_DEPTH_UART      = 1 << 4;
    parameter SEND_FIFO_DEPTH_INSTR_LOADER = 1 << 4;

    // file size settings (depends on files)
    parameter DATA_IN_PROGRAM_SIZE_BYTES   = 240;
    parameter INSTR_SIZE_BYTES             = 76928; // size of instruction_only file in bytes
    parameter SLD_SIZE_BYTES               = 1200; // SLD file size in bytes, must be times of 4

    // basic settings
    parameter HEAP_START                   = 32'h00001000; // initial heap pointer (if address is smaller than this, mem access will be for sld ROM.)
    parameter CACHE_LINE_SIZE_BIT          = 128;
    parameter REG_NUM                      = 32;


// ----- fixed parameter calculation -----

    // UART
    localparam CLK_PER_HALF_BIT            = (OVERSAMPLING_NUM / 2) * N; // (CLK_PER_HALF_BIT*2) %% OVERSAMPLING_NUM == 0 must be satisfied
    localparam BAUDRATE                    = FCLK_MHz * 1000000 / (2 * CLK_PER_HALF_BIT);

    // BRAM
    localparam DATA_ROM_TABLE_SIZE_BYTES   = DATA_IN_PROGRAM_SIZE_BYTES;
    localparam INSTR_BRAM_SIZE_WORDS       = INSTR_BRAM_SIZE_BYTES / 4; // size of instruction bram size
    localparam DATA_ROM_TABLE_SIZE_WORDS   = DATA_ROM_TABLE_SIZE_BYTES / 4; // size in bytes, more than fp immediates
    localparam SLD_ROM_TABLE_SIZE_BYTES    = HEAP_START;
    localparam SLD_ROM_TABLE_SIZE_WORDS    = SLD_ROM_TABLE_SIZE_BYTES / 4;
    localparam STACK_BRAM_SIZE_WORDS       = STACK_BRAM_SIZE_BYTES / 4;

    // DDR + cache
    localparam TOTAL_DDR_SIZE_BYTES        = 1 << DDR_SIZE_ORDER; // including DDR for instruction and data
    localparam INSTR_MEM_SIZE_DDR_WORDS    = INSTR_MEM_SIZE_DDR_BYTES / 4;
    localparam INIT_SP                     = 32'h40000000 + STACK_BRAM_SIZE_BYTES;
    localparam UART_TX_ADDR                = 32'hFFFF0000; // Send MMIO address (register to pc)
    localparam OPCODE_BIT_WIDTH            = (REG_NUM == 32) ? 7 : 4;
    localparam NON_DDR_ADDRESS             = 32'hffff0008; // address which will not be requested for DDR
    localparam INVALID_PC                  = 32'hfafafafa; // address which will not be requested for bram or DDR
    localparam NOPE_INSTR                  = 0;
  
    // parameter validity check
    generate
        if ((INSTR_BRAM_SIZE_BYTES + DATA_ROM_TABLE_SIZE_BYTES + SLD_ROM_TABLE_SIZE_BYTES) > TOTAL_BRAM_SIZE_BYTES) begin
            initial $error("execessive BRAM");
        end
    endgenerate

    typedef enum logic [3:0] {
        S_HELLO_SENDING       = 0,
        S_INSTR               = 1,   // load program file
        S_AA_SENDING          = 2,
        S_SLD                 = 3,
        S_IDLE                = 4,
        S_UART_WAITING        = 5,
        S_MEM_WRITE_WAITING   = 6,
        S_MEM_READ_WAITING    = 7,
        S_BRAM_READING        = 8
    } system_state_t;

    system_state_t state_system;


// ----- logics (used in placed modules) -----
    // clock
    logic mig_clk;
    logic cpu_clk;
    
    // reset
    logic rstn_synced;

    // system
    logic hello_sent;
    logic AA_sent;

    // instruction DDR
    logic [31:0] instr_read_addr_DDR;
    logic instr_write_enable_DDR;
    logic [31:0] instr_write_addr_DDR;
    logic [CACHE_LINE_SIZE_BIT-1:0] instr_write_data_DDR;
    logic cpu_instr_read_start_DDR;
    logic instr_mem_req_ready_DDR;
    logic instr_mem_data_valid_DDR;
    logic [31:0] read_instr_from_DDR;

    // data DDR
    logic cpu_data_read_ready_DDR;
    logic [31:0] data_read_addr_DDR;
    logic data_write_enable_DDR;
    logic [31:0] data_write_addr_DDR;
    logic [31:0] data_write_data_DDR;
    logic data_mem_req_ready_DDR;
    logic [31:0] read_data_from_DDR;
    logic data_mem_data_valid_DDR;

    // instr bram
    logic [31:0] instr_read_addr_INSTR_BRAM;
    logic [31:0] instr_write_addr_INSTR_BRAM;
    logic [31:0] instr_write_data_INSTR_BRAM;
    logic instr_write_enable_INSTR_BRAM;
    logic [31:0] read_instr_from_INSTR_BRAM;
    logic instr_mem_data_valid_INSTR_BRAM;

    // sld rom table
    logic [31:0] data_read_addr_sld_rom_table;
    logic [31:0] data_write_addr_sld_rom_table;
    logic [31:0] data_write_data_sld_rom_table;
    logic data_write_enable_sld_rom_table;
    logic [31:0] read_data_from_sld_rom_table;

    // data rom table
    logic [31:0] data_read_addr_data_rom_table;
    logic [31:0] data_write_addr_data_rom_table;
    logic [31:0] data_write_data_data_rom_table;
    logic data_write_enable_data_rom_table;
    logic [31:0] read_data_from_data_rom_table;

    // stack bram
    logic [31:0] data_read_addr_stack_bram;
    logic [31:0] data_write_addr_stack_bram;
    logic [31:0] data_write_data_stack_bram;
    logic data_write_enable_stack_bram;
    logic [31:0] read_data_from_stack_bram;

    // uart
    logic uart_rx_ready;
    logic uart_tx_valid;
    logic [7:0] uart_tx_data;
    logic uart_tx_ready;
    logic uart_rx_valid;
    logic [7:0] uart_rx_data;

    // instruction loader
    logic instruction_loader_rstn_synced;
    logic uart_rx_ready_instr_loader;
    logic [31:0] instr_write_data_BRAM_ROM;
    logic [31:0] instr_write_addr_BRAM_ROM;
    logic instr_write_enable_BRAM_ROM;
    logic data_table_or_instr_bram;
    logic instr_load_done;

    // sld loader
    logic sld_loader_rstn_synced;
    logic uart_rx_ready_sld_loader;
    logic sld_load_done;

    // core
    logic cpu_rstn_synced;
    logic [31:0] read_instr_to_cpu_bram;
    logic [31:0] read_instr_to_cpu_ddr;
    logic [31:0] read_data_to_cpu;
    logic instr_mem_data_valid_to_cpu;
    logic cpu_uart_stall;
    logic cpu_lw_stall;
    logic cpu_sw_stall;
    logic [31:0] instr_read_addr_bram_from_cpu;
    logic [31:0] instr_read_addr_ddr_from_cpu;
    logic cpu_instr_read_start;
    logic [31:0] data_read_addr_from_cpu;
    logic [31:0] data_write_addr_from_cpu;
    logic [31:0] write_data_from_cpu;
    logic data_write_enable_from_cpu;
    logic halt_signal;
    logic data_read_enable_from_cpu;
    logic flush_from_cpu;
    logic ddr_busy;
    logic ddr_busy_but_free_next_cycle;
    logic [2:0] DDR_valids_to_ignore_init;
    logic [2:0] BRAM_valids_to_ignore_init;
    logic instr_mem_data_valid_DDR_to_cpu;
    logic instr_mem_data_valid_BRAM_to_cpu;
    logic read_req_off_order_to_cpu;

// ================
// placing modules
// ================

// ----- clk wizard -----
    clk_wiz_0 clk_gen (
        .clk_in1(clk),
        .clk_out1(mig_clk),
        .clk_out2(cpu_clk)
    );

// ----- DDR2 / cache -----
    master_fifo dram_fifo();
    master_fifo icache_if();
    master_fifo dcache_if();
    slave_fifo  slave_fifo();

    cache_arbiter arb (
        .icache_fifo(icache_if),
        .dcache_fifo(dcache_if),
        .dram_fifo(dram_fifo),
        .clk(cpu_clk),
        .rstn(rstn_synced)
    );

    dram_buf dram_buf (
        .master(dram_fifo),
        .slave(slave_fifo)
    );
    
    dram_controller dram_controller (
        .ddr2_addr  (ddr2_addr),
        .ddr2_ba    (ddr2_ba),
        .ddr2_cas_n (ddr2_cas_n),
        .ddr2_ck_n  (ddr2_ck_n),
        .ddr2_ck_p  (ddr2_ck_p),
        .ddr2_cke   (ddr2_cke),
        .ddr2_ras_n (ddr2_ras_n),
        .ddr2_we_n  (ddr2_we_n),
        .ddr2_dq    (ddr2_dq),
        .ddr2_dqs_n (ddr2_dqs_n),
        .ddr2_dqs_p (ddr2_dqs_p),
        .ddr2_cs_n  (ddr2_cs_n),
        .ddr2_dm    (ddr2_dm),
        .ddr2_odt   (ddr2_odt),

        .sys_clk(mig_clk),
        .fifo(slave_fifo)
    );
    
 
    instr_memory # (
        .NON_DDR_ADDRESS (NON_DDR_ADDRESS)
    ) instr_memory (
        // inputs
        .fifo(icache_if),
        .clk(cpu_clk),
        .rstn(rstn_synced),
        .read_addr(instr_read_addr_DDR),
        .system_req_valid(instr_write_enable_DDR),
        .write_addr(instr_write_addr_DDR),
        .write_data(instr_write_data_DDR),
        .read_start(cpu_instr_read_start_DDR),

        // outputs
        .mem_req_ready(instr_mem_req_ready_DDR),
        .mem_data_valid(instr_mem_data_valid_DDR),
        .read_data(read_instr_from_DDR)
    );

    data_memory data_memory (
        // inputs
        .fifo(dcache_if),
        .clk(cpu_clk),
        .rstn(rstn_synced),
        .cpu_read_ready(cpu_data_read_ready_DDR),
        .read_addr(data_read_addr_DDR),
        .write_enable(data_write_enable_DDR),
        .write_addr(data_write_addr_DDR),
        .write_data(data_write_data_DDR),

        // outputs
        .mem_req_ready(data_mem_req_ready_DDR),
        .read_data(read_data_from_DDR),
        .mem_data_valid(data_mem_data_valid_DDR)
    );

// ----- BRAM -----
    bram # (
        .MEM_SIZE (INSTR_BRAM_SIZE_WORDS),
        .INVALID_ADDRESS (INVALID_PC)
    ) instruction_bram (
        .clk (cpu_clk),
        .rstn (rstn_synced),

        // input
        .read_addr (instr_read_addr_INSTR_BRAM),
        .write_addr (instr_write_addr_INSTR_BRAM),
        .write_data (instr_write_data_INSTR_BRAM),
        .write_enable (instr_write_enable_INSTR_BRAM),
        
        // output
        .read_data (read_instr_from_INSTR_BRAM)
    );

    bram # (
        .MEM_SIZE (DATA_ROM_TABLE_SIZE_WORDS)
    ) data_rom_table (
        .clk (cpu_clk),
        .rstn (rstn_synced),

        // input
        .read_addr (data_read_addr_data_rom_table),
        .write_addr (data_write_addr_data_rom_table),
        .write_data (data_write_data_data_rom_table),
        .write_enable (data_write_enable_data_rom_table),
        
        // output
        .read_data (read_data_from_data_rom_table)
    );

    bram # (
        .MEM_SIZE (SLD_ROM_TABLE_SIZE_WORDS)
    ) sld_rom_table (
        .clk (cpu_clk),
        .rstn (rstn_synced),

        // input
        .read_addr (data_read_addr_sld_rom_table),
        .write_addr (data_write_addr_sld_rom_table),
        .write_data (data_write_data_sld_rom_table),
        .write_enable (data_write_enable_sld_rom_table),
        
        // output
        .read_data (read_data_from_sld_rom_table)
    );

    bram # (
        .MEM_SIZE (STACK_BRAM_SIZE_WORDS)
    ) stack_bram (
        .clk (cpu_clk),
        .rstn (rstn_synced),

        // input
        .read_addr (data_read_addr_stack_bram),
        .write_addr (data_write_addr_stack_bram),
        .write_data (data_write_data_stack_bram),
        .write_enable (data_write_enable_stack_bram),
        
        // output
        .read_data (read_data_from_stack_bram)
    );

// ----- uart / instruction loader / sld loader -----
    uart #(
        .OVERSAMPLING_NUM (OVERSAMPLING_NUM),
        .CLK_PER_HALF_BIT (CLK_PER_HALF_BIT),
        .SEND_FIFO_DEPTH (SEND_FIFO_DEPTH_UART),
        .RECEIVE_FIFO_DEPTH (RECEIVE_FIFO_DEPTH_UART)
    ) uart (
        .clk (cpu_clk),
        .rstn (rstn_synced),

        // input
        .rx (uart_rx), // pin from PC
        .rx_ready (uart_rx_ready), // system is read-ready
        .tx_valid (uart_tx_valid), // system's data is valid
        .tx_data (uart_tx_data), // data to send

        // output
        .tx (uart_tx), // pin to PC
        .tx_ready (uart_tx_ready), // uart is send-ready
        .rx_valid (uart_rx_valid), // uart's data is valid
        .rx_data (uart_rx_data) // received data
    );

    instruction_loader # (
        .INSTR_BRAM_SIZE_WORDS (INSTR_BRAM_SIZE_WORDS),
        .OPCODE_BIT_WIDTH (OPCODE_BIT_WIDTH),
        .CACHE_LINE_SIZE_BIT (CACHE_LINE_SIZE_BIT),
        .INST_LOADER_FIFO_DEPTH (SEND_FIFO_DEPTH_INSTR_LOADER)
    ) instruction_loader (
        // inputs
        .clk(cpu_clk),
        .rstn(instruction_loader_rstn_synced),
        .uart_rx_data(uart_rx_data),
        .uart_rx_valid(uart_rx_valid),
        .instr_mem_req_ready_DDR(instr_mem_req_ready_DDR),

        // outputs
        .uart_rx_ready(uart_rx_ready_instr_loader),
        .instr_write_data_DDR(instr_write_data_DDR),
        .instr_write_addr_DDR(instr_write_addr_DDR),
        .instr_write_enable_DDR(instr_write_enable_DDR),
        .instr_write_data_BRAM_ROM(instr_write_data_BRAM_ROM),
        .instr_write_addr_BRAM_ROM(instr_write_addr_BRAM_ROM),
        .instr_write_enable_BRAM_ROM(instr_write_enable_BRAM_ROM),
        .data_table_or_instr_bram(data_table_or_instr_bram),
        .instr_load_done(instr_load_done)
    );

    sld_loader # (
        .SLD_SIZE_BYTES (SLD_SIZE_BYTES)
    ) sld_loader (
        .clk (cpu_clk),  
        .rstn (sld_loader_rstn_synced),      

        // input
        .uart_rx_data (uart_rx_data),
        .uart_rx_valid (uart_rx_valid), // uart_rx_dataが有効であることを示す信号

        // output
        .uart_rx_ready (uart_rx_ready_sld_loader), // ローダーが次のデータを受け取れる状態であることを示す信号
        .sld_write_data (data_write_data_sld_rom_table),      // 書き込む32ビットデータ (ローダー内部で4バイト分を結合)
        .sld_write_addr (data_write_addr_sld_rom_table),      // 命令メモリへの書き込み先メモリアドレス(systemへの通達)
        .sld_write_enable (data_write_enable_sld_rom_table), // 書き込めという指令
        .sld_load_done (sld_load_done)    // プログラムのロードが完了したことを示す信号
    );

// ----- core -----

    core # (
        .INIT_SP (INIT_SP), // stackポインタの初期値
        .HEAP_START (HEAP_START),
        .UART_TX_ADDR (UART_TX_ADDR),
        .REG_NUM (REG_NUM),
        .INVALID_PC (INVALID_PC),
        .NOPE_INSTR (NOPE_INSTR),
        .INSTR_BRAM_SIZE_BYTES (INSTR_BRAM_SIZE_BYTES),
        .INSTR_SIZE_BYTES (INSTR_SIZE_BYTES),
        .PC_INST_FIFO_DEPTH (PC_INST_FIFO_DEPTH)
    ) core (
        .clk (cpu_clk),
        .rstn (cpu_rstn_synced), 

        // input into CPU
        .Instr_BRAM_input (read_instr_to_cpu_bram),  // メモリから読み込んだ命令データ
        .Instr_DDR_input (read_instr_to_cpu_ddr),  // メモリから読み込んだ命令データ
        .ReadData_input (read_data_to_cpu),   // lwで読み込んだデータ or rxから読んだデータ
        .UARTStall_input (cpu_uart_stall),
        .LWStall_input (cpu_lw_stall),
        .SWStall_input (cpu_sw_stall),
        .DataValidFromInstDDR_input (instr_mem_data_valid_DDR_to_cpu),
        .DataValidFromInstBRAM_input (instr_mem_data_valid_BRAM_to_cpu),

        // output from cpu
        .PC_BRAM_output (instr_read_addr_bram_from_cpu),  // 命令をフェッチするアドレス (PCの値)
        .PC_DDR_output (instr_read_addr_ddr_from_cpu),  // 命令をフェッチするアドレス (PCの値)
        .ReadAddr_output (data_read_addr_from_cpu),       // lwでアクセスするアドレス
        .WriteAddr_output (data_write_addr_from_cpu),  // swでアクセスするアドレス
        .WriteData_output (write_data_from_cpu),    // swで書き込むデータ (rs2の値)
        .MemWrite_output (data_write_enable_from_cpu),         // 書き込み許可信号
        .HaltSignal_output (halt_signal),
        .MemRead_output (data_read_enable_from_cpu),
        .Flush_output (flush_from_cpu),
        .DDRValidsToIgnoreInit_output (DDR_valids_to_ignore_init),
        .BRAMValidsToIgnoreInit_output (BRAM_valids_to_ignore_init),
        .InstMemDDRBusy (ddr_busy),
        .InstMemDDRBusyNow_ButFreeNextCycle (ddr_busy_but_free_next_cycle),
        .ReadRequestOffOrderFromSystem (read_req_off_order_to_cpu)
    );

// =======
// logics
// =======

// ----- synchronizing rstn & halt signal-----
    logic rstn_sync1;
    always_ff @(posedge cpu_clk) begin
        if (~rstn) begin
            rstn_sync1 <= 0;
            rstn_synced <= 0;
        end else begin
            rstn_sync1 <= 1;
            rstn_synced <= rstn_sync1;
        end
    end

    always_ff @(posedge cpu_clk) begin
        if (~rstn_synced) begin
            halted <= 0;
        end else begin
            if (halt_signal) begin
                halted <= 1;
            end
        end
    end

// ----- core -----
    assign cpu_rstn_synced = rstn_synced & instr_load_done & sld_load_done;
    assign cpu_instr_read_start = cpu_rstn_synced;

// ----- writing instructions -----
    assign instr_write_enable_INSTR_BRAM = instr_write_enable_BRAM_ROM & data_table_or_instr_bram;
    assign instr_write_addr_INSTR_BRAM = instr_write_addr_BRAM_ROM;
    assign instr_write_data_INSTR_BRAM = instr_write_data_BRAM_ROM;

// ----- reading instructions -----

    // ----- bram -----
    logic instr_fetch_to_INSTR_BRAM;
    assign instr_fetch_to_INSTR_BRAM = (instr_read_addr_bram_from_cpu != INVALID_PC);
    assign instr_read_addr_INSTR_BRAM = instr_read_addr_bram_from_cpu;

    // data valid from instruction bram
    always_ff @(posedge cpu_clk or negedge rstn_synced) begin
        if (~rstn_synced) begin
            instr_mem_data_valid_INSTR_BRAM <= 0;
        end else begin
            if (cpu_instr_read_start & instr_fetch_to_INSTR_BRAM) begin
                instr_mem_data_valid_INSTR_BRAM <= 1; // assert next cycle
            end else begin
                instr_mem_data_valid_INSTR_BRAM <= 0;
            end
        end
    end

    // ----- DDR -----
    // PC out of DDR instruction range will be taken as NON-DDR, which means valids will not come.
    assign cpu_instr_read_start_DDR = cpu_instr_read_start; // wait for cpu by reading NON-DDR-ADDRESS until valid PC comes in
    logic instr_fetch_to_DDR;
    assign instr_fetch_to_DDR = (instr_read_addr_ddr_from_cpu != INVALID_PC);
    assign instr_read_addr_DDR = instr_fetch_to_DDR ? (instr_read_addr_ddr_from_cpu - INSTR_BRAM_SIZE_BYTES) : NON_DDR_ADDRESS;

    // ------ reading & ignoring ------
    logic [2:0] DDR_valids_to_ignore;
    logic [2:0] BRAM_valids_to_ignore;

    always_comb begin

        read_instr_to_cpu_bram = NOPE_INSTR;
        read_instr_to_cpu_ddr = NOPE_INSTR;
        instr_mem_data_valid_DDR_to_cpu= 0;
        instr_mem_data_valid_BRAM_to_cpu = 0;

        if (DDR_valids_to_ignore != 0) begin
            if (BRAM_valids_to_ignore == 0) begin
                instr_mem_data_valid_BRAM_to_cpu = instr_mem_data_valid_INSTR_BRAM;
                read_instr_to_cpu_bram = read_instr_from_INSTR_BRAM;
            end
        end else begin
            if (BRAM_valids_to_ignore != 0) begin
                instr_mem_data_valid_DDR_to_cpu = instr_mem_data_valid_DDR;
                read_instr_to_cpu_ddr = read_instr_from_DDR;
            end else begin
                instr_mem_data_valid_DDR_to_cpu = instr_mem_data_valid_DDR;
                instr_mem_data_valid_BRAM_to_cpu = instr_mem_data_valid_INSTR_BRAM;                
                read_instr_to_cpu_bram = read_instr_from_INSTR_BRAM;
                read_instr_to_cpu_ddr = read_instr_from_DDR;
            end
        end
    end

    typedef enum logic [2:0] {
        IDLE,
        NEXT_AFTER_DDR_REQ,
        DDR_MISS
    } state_inst_fetch_ddr_t;
    state_inst_fetch_ddr_t state_inst_fetch_ddr;

    always_comb begin
        ddr_busy = 0;
        ddr_busy_but_free_next_cycle = 0;
        
        if (instr_mem_data_valid_DDR) begin
            if (state_inst_fetch_ddr == DDR_MISS) begin // DDR MISS & data_vaid_DDR -> busy 1 cycle bubble
                ddr_busy = 1;
                ddr_busy_but_free_next_cycle = 1;
            end // else -> cache hit  
        end else begin
            if ((state_inst_fetch_ddr == NEXT_AFTER_DDR_REQ) | (state_inst_fetch_ddr == DDR_MISS)) begin // valid_DDR = 0 && Next cycle after DDR req -> miss, DDR_MISS & valid = 0 -> still waiting
                ddr_busy = 1;
            end
        end
    end

    always_ff @(posedge cpu_clk) begin
        if (~rstn_synced) begin
            state_inst_fetch_ddr <= IDLE;
        end else begin
            case (state_inst_fetch_ddr)
                IDLE: begin
                    if (cpu_instr_read_start_DDR & instr_fetch_to_DDR) begin
                        state_inst_fetch_ddr <= NEXT_AFTER_DDR_REQ;
                    end
                end
                NEXT_AFTER_DDR_REQ: begin
                    if (~instr_mem_data_valid_DDR) begin // cache miss
                        state_inst_fetch_ddr <= DDR_MISS;
                    end else begin // cache hit
                        if (instr_fetch_to_DDR) begin
                            state_inst_fetch_ddr <= NEXT_AFTER_DDR_REQ;
                        end else begin
                            state_inst_fetch_ddr <= IDLE;
                        end
                    end
                end
                DDR_MISS: begin
                    if (instr_mem_data_valid_DDR) begin
                        state_inst_fetch_ddr <= IDLE;
                    end
                end
            endcase
        end
    end

   always_ff @(posedge cpu_clk) begin
        if (~rstn_synced) begin

            DDR_valids_to_ignore <= 0;
            BRAM_valids_to_ignore <= 0;

        end else begin
                
            if (flush_from_cpu) begin

                if (DDR_valids_to_ignore != 0) begin // need to ignore
                    DDR_valids_to_ignore <= DDR_valids_to_ignore + DDR_valids_to_ignore_init - instr_mem_data_valid_DDR;
                end else begin // no need to ignore
                    DDR_valids_to_ignore <= DDR_valids_to_ignore + DDR_valids_to_ignore_init;
                end

                if (BRAM_valids_to_ignore != 0) begin // need to ignore
                    BRAM_valids_to_ignore <= BRAM_valids_to_ignore + BRAM_valids_to_ignore_init - instr_mem_data_valid_INSTR_BRAM;
                end else begin // no need to ignore
                    BRAM_valids_to_ignore <= BRAM_valids_to_ignore + BRAM_valids_to_ignore_init;
                end

            end else begin

                if (DDR_valids_to_ignore != 0) begin // need to ignore
                    DDR_valids_to_ignore <= DDR_valids_to_ignore - instr_mem_data_valid_DDR;
                end

                if (BRAM_valids_to_ignore != 0) begin // need to ignore
                    BRAM_valids_to_ignore <= BRAM_valids_to_ignore - instr_mem_data_valid_INSTR_BRAM;
                end

            end

        end
    end

// ----- reading & writing data -----

    // --- sld rom table --- 
    logic read_from_sld_rom_table;
    assign read_from_sld_rom_table = data_read_enable_from_cpu & (data_read_addr_from_cpu < HEAP_START);
    assign data_read_addr_sld_rom_table = read_from_sld_rom_table ? data_read_addr_from_cpu : 0; 

    // data valid from sld rom table
    logic data_mem_data_valid_sld_rom_table;
    always_ff @(posedge cpu_clk or negedge rstn_synced) begin
        if (~rstn_synced) begin
            data_mem_data_valid_sld_rom_table <= 0;
        end else begin
            if (read_from_sld_rom_table) begin
                data_mem_data_valid_sld_rom_table <= 1; // assert next cycle
            end else begin
                data_mem_data_valid_sld_rom_table <= 0;
            end
        end
    end

    // --- data rom table ---
    logic read_from_data_rom_table;
    assign read_from_data_rom_table = data_read_enable_from_cpu & data_read_addr_from_cpu[31];
    logic write_to_data_rom_table;
    assign write_to_data_rom_table = data_write_enable_from_cpu & data_write_addr_from_cpu[31] & (data_write_addr_from_cpu != UART_TX_ADDR);

    logic data_write_enable_data_rom_table_from_loader;
    assign data_write_enable_data_rom_table_from_loader = instr_write_enable_BRAM_ROM & ~data_table_or_instr_bram;
    logic data_write_enable_data_rom_table_from_cpu;
    assign data_write_enable_data_rom_table_from_cpu = write_to_data_rom_table;

    assign data_read_addr_data_rom_table = read_from_data_rom_table ? (32'h7fff & data_read_addr_from_cpu) : 0; // mask MSB
    assign data_write_enable_data_rom_table = data_write_enable_data_rom_table_from_loader | data_write_enable_data_rom_table_from_cpu;
    assign data_write_addr_data_rom_table = data_write_enable_data_rom_table_from_loader ? instr_write_addr_BRAM_ROM :
                                            data_write_enable_data_rom_table_from_cpu ?  (32'h7fff & data_write_addr_from_cpu) : 0;
    assign data_write_data_data_rom_table = data_write_enable_data_rom_table_from_loader ? instr_write_data_BRAM_ROM :
                                            data_write_enable_data_rom_table_from_cpu ? write_data_from_cpu : 0;

    // data valid from data rom table
    logic data_mem_data_valid_data_rom_table;
    always_ff @(posedge cpu_clk or negedge rstn_synced) begin
        if (~rstn_synced) begin
            data_mem_data_valid_data_rom_table <= 0;
        end else begin
            if (read_from_data_rom_table) begin
                data_mem_data_valid_data_rom_table <= 1; // assert next cycle
            end else begin
                data_mem_data_valid_data_rom_table <= 0;
            end
        end
    end

    // --- stack bram ---
    logic read_from_stack_bram;
    assign read_from_stack_bram = data_read_enable_from_cpu & ~data_read_addr_from_cpu[31] & data_read_addr_from_cpu[30];
    logic write_to_stack_bram;
    assign write_to_stack_bram = data_write_enable_from_cpu & ~data_write_addr_from_cpu[31] & data_write_addr_from_cpu[30] & (data_write_addr_from_cpu != UART_TX_ADDR);

    assign data_read_addr_stack_bram = read_from_stack_bram ? (32'hbfffffff & data_read_addr_from_cpu) : 0; // mask addr[30]
    assign data_write_enable_stack_bram = write_to_stack_bram;
    assign data_write_addr_stack_bram = data_write_enable_stack_bram ?  (32'hbfffffff & data_write_addr_from_cpu) : 0;
    assign data_write_data_stack_bram = data_write_enable_stack_bram ? write_data_from_cpu : 0;

    // data valid from stack bram
    logic data_mem_data_valid_stack_bram;
    always_ff @(posedge cpu_clk or negedge rstn_synced) begin
        if (~rstn_synced) begin
            data_mem_data_valid_stack_bram <= 0;
        end else begin
            if (read_from_stack_bram) begin
                data_mem_data_valid_stack_bram <= 1; // assert next cycle
            end else begin
                data_mem_data_valid_stack_bram <= 0;
            end
        end
    end

    // --- DDR ---
    // About data DDR, read enable and write enable exists, so no need to branch other cases
    logic read_from_stack_DDR;
    assign read_from_stack_DDR = data_read_enable_from_cpu & ~data_read_addr_from_cpu[31] & ~data_read_addr_from_cpu[30] & data_read_addr_from_cpu[29]; // 0x3f.... -> bottom of DDR (max size is 1 << 27)
    logic write_to_stack_DDR;
    assign write_to_stack_DDR = data_write_enable_from_cpu & ~data_write_addr_from_cpu[31] & ~data_write_addr_from_cpu[30] & data_write_addr_from_cpu[29] & (data_write_addr_from_cpu != UART_TX_ADDR); // 0x3f... -> bottom of DDR (max size is 1 << 27)

    assign data_read_addr_DDR = ~read_from_stack_DDR ? (data_read_addr_from_cpu - HEAP_START + INSTR_MEM_SIZE_DDR_BYTES) : {{(32-DDR_SIZE_ORDER){1'b0}}, data_read_addr_from_cpu[DDR_SIZE_ORDER-1:0]};
    assign data_write_addr_DDR = ~write_to_stack_DDR ? (data_write_addr_from_cpu - HEAP_START + INSTR_MEM_SIZE_DDR_BYTES) : {{(32-DDR_SIZE_ORDER){1'b0}}, data_write_addr_from_cpu[DDR_SIZE_ORDER-1:0]};
    assign data_write_data_DDR = write_data_from_cpu;

    // --- cpu ---
    assign read_data_to_cpu = data_mem_data_valid_sld_rom_table ? read_data_from_sld_rom_table : 
                              (data_mem_data_valid_data_rom_table ? read_data_from_data_rom_table : 
                              (data_mem_data_valid_stack_bram ? read_data_from_stack_bram :
                              (data_mem_data_valid_DDR ? read_data_from_DDR : 32'hdeadbeef
                              )));

// ----- signals -----

    // ----- signals from core -----
    // read
    logic bram_read_req_from_cpu;
    assign bram_read_req_from_cpu = read_from_sld_rom_table | read_from_data_rom_table | read_from_stack_bram;
    logic DDR_read_req_from_cpu;
    assign DDR_read_req_from_cpu = data_read_enable_from_cpu & ~bram_read_req_from_cpu;
    // write
    logic bram_store_req_from_cpu;
    assign bram_store_req_from_cpu = write_to_data_rom_table | write_to_stack_bram;
    logic MMIO_req_from_cpu;
    assign MMIO_req_from_cpu = data_write_enable_from_cpu & (data_write_addr_from_cpu == UART_TX_ADDR);
    logic DDR_store_req_from_cpu;
    assign DDR_store_req_from_cpu = data_write_enable_from_cpu & ~bram_store_req_from_cpu & ~MMIO_req_from_cpu;

    // ----- ready/valid -----
    assign uart_rx_ready = (state_system == S_INSTR) ? uart_rx_ready_instr_loader :
                          ((state_system == S_SLD) ? uart_rx_ready_sld_loader : 
                            0); // cpu will not receive any data from pc when it's waken up.
    assign uart_tx_valid = (state_system == S_HELLO_SENDING) | (state_system == S_AA_SENDING) | MMIO_req_from_cpu;
    assign uart_tx_data = (state_system == S_HELLO_SENDING) ? 8'h99 :
                          (state_system == S_AA_SENDING)    ? 8'hAA :
                          (MMIO_req_from_cpu                ? write_data_from_cpu[7:0] :
                           0);
    logic cpu_data_read_ready_bram;
    assign cpu_data_read_ready_bram = bram_read_req_from_cpu;
    assign cpu_data_read_ready_DDR = DDR_read_req_from_cpu;
    assign data_write_enable_DDR = DDR_store_req_from_cpu;

    // ----- stall ----- ! stall signal must be asserted at the cycle it turned out that cpu has to stall (1 cycle before the actual bubble cycle)
    logic cpu_bram_read_stall;
    assign cpu_bram_read_stall = ((state_system == S_IDLE) & bram_read_req_from_cpu);
    logic cpu_DDR_read_stall;
    assign cpu_DDR_read_stall = ((state_system == S_IDLE) & cpu_data_read_ready_DDR & ~data_mem_data_valid_DDR) | ((state_system == S_MEM_READ_WAITING) & ~data_mem_data_valid_DDR); 
    logic cpu_DDR_write_stall;
    assign cpu_DDR_write_stall = ((state_system == S_IDLE) & data_write_enable_DDR & ~data_mem_req_ready_DDR) | ((state_system == S_MEM_WRITE_WAITING) & ~data_mem_req_ready_DDR);
    assign cpu_lw_stall = cpu_bram_read_stall | cpu_DDR_read_stall;
    assign cpu_sw_stall = cpu_DDR_write_stall; // bram storing doesn't require a stall
    assign cpu_uart_stall = ((state_system == S_IDLE) & uart_tx_valid & ~uart_tx_ready) | ((state_system == S_UART_WAITING) & ~uart_tx_ready);
    assign read_req_off_order_to_cpu = (cpu_data_read_ready_DDR & data_mem_req_ready_DDR) | cpu_data_read_ready_bram;

// ----- FSM -----
    always_ff @(posedge cpu_clk or negedge rstn_synced) begin
        if (~rstn_synced) begin
            hello_sent <= 0;
            AA_sent <= 0;
            state_system <= S_HELLO_SENDING;
            instruction_loader_rstn_synced <= 0;
            sld_loader_rstn_synced <= 0;
        end else begin
            case (state_system) 
                // hello
                S_HELLO_SENDING: begin
                    if (rstn_synced && uart_tx_ready) begin // they're ready to receive 0x99
                        state_system <= S_INSTR;
                        hello_sent <= 1;
                        instruction_loader_rstn_synced <= 1;
                    end
                end

                // instr
                S_INSTR: begin
                    if (instr_load_done) begin // 命令プログラムの送信完了
                        state_system <= S_AA_SENDING;
                    end
                end

                // AA
                S_AA_SENDING: begin
                    if (uart_tx_ready) begin
                        AA_sent <= 1;
                        state_system <= S_SLD;
                        sld_loader_rstn_synced <= 1;
                    end
                end

                // sld
                S_SLD: begin
                    if (sld_load_done) begin
                        state_system <= S_IDLE;
                    end
                end

                // idle (cpu processing)
                S_IDLE: begin
                    // writing
                    if (uart_tx_valid) begin
                        if (~uart_tx_ready) begin // if both module handshaked this cycle, state remains.
                            state_system <= S_UART_WAITING;
                        end
                    end else if (data_write_enable_DDR) begin
                        if (~data_mem_req_ready_DDR) begin
                            state_system <= S_MEM_WRITE_WAITING;
                        end
                    end 
                    
                    // reading
                    else if (cpu_data_read_ready_DDR) begin
                        if (~data_mem_data_valid_DDR) begin // combinational memory may enable read_req & data_valid to both assert in the same cycle
                            state_system <= S_MEM_READ_WAITING;
                        end
                    end else if (bram_read_req_from_cpu) begin // in any case consumes 1 cycle
                        state_system <= S_BRAM_READING;
                    end
                end

                // uart
                S_UART_WAITING: begin
                    if (uart_tx_ready) begin
                        state_system <= S_IDLE;
                    end
                end

                // memory writing
                S_MEM_WRITE_WAITING: begin
                    if (data_mem_req_ready_DDR) begin
                        state_system <= S_IDLE;
                    end
                end

                // memory reading
                S_MEM_READ_WAITING: begin
                    if (data_mem_data_valid_DDR) begin
                        state_system <= S_IDLE;
                    end
                end 
                S_BRAM_READING: begin
                    state_system <= S_IDLE; // necessarily completes in 1 clk cycle
                end
            endcase
        end
    end

// -----------------
// ----- Debug -----
// -----------------

    // uart tx debug
    localparam int UART_DEBUG_W     = 8;
    localparam int UART_DEBUG_DEPTH = 16;

    (* mark_debug="true" *) logic [UART_DEBUG_W-1:0] uart_tx_data_dbg;
    (* mark_debug="true" *) logic                    uart_tx_valid_dbg;
    (* mark_debug="true" *) logic                    uart_tx_ready_dbg;
    (* mark_debug="true" *) logic [$clog2(UART_DEBUG_DEPTH)-1:0] uart_log_wr_ptr;
    (* mark_debug="true" *) logic                    uart_log_full;
    (* mark_debug="true" *) logic [UART_DEBUG_W*UART_DEBUG_DEPTH-1:0] uart_log_flat;
    (* mark_debug="true" *) logic [31:0] uart_counter_dbg;
    logic uart_log_en;

    always_ff @(posedge cpu_clk) begin
        if (!rstn_synced) begin
            uart_counter_dbg <= 32'd0;
        end else if (uart_tx_valid && uart_tx_ready) begin
            uart_counter_dbg <= uart_counter_dbg + 32'd1;
        end
    end

    assign uart_tx_ready_dbg = uart_tx_ready;
    assign uart_tx_valid_dbg = uart_tx_valid;
    assign uart_tx_data_dbg  = uart_tx_data;
    assign uart_log_en       = uart_tx_valid_dbg;

    debug_log_fifo #(
        .W(UART_DEBUG_W),
        .DEPTH(UART_DEBUG_DEPTH)
    ) u_log_uart (
        .clk     (cpu_clk),
        .rstn    (rstn_synced),
        .log_en  (uart_log_en),
        .log_data(uart_tx_data_dbg),
        .wr_ptr  (uart_log_wr_ptr),
        .full    (uart_log_full),
        .mem_flat(uart_log_flat)
    );

    // data memory debug
    // inputs to data_memory
    (* mark_debug="true" *) logic        cpu_data_read_ready_DDR_dbg;
    (* mark_debug="true" *) logic [31:0] data_read_addr_DDR_dbg;
    (* mark_debug="true" *) logic        data_write_enable_DDR_dbg;
    (* mark_debug="true" *) logic [31:0] data_write_addr_DDR_dbg;
    (* mark_debug="true" *) logic [31:0] data_write_data_DDR_dbg;

    // outputs from data_memory
    (* mark_debug="true" *) logic        data_mem_req_ready_DDR_dbg;
    (* mark_debug="true" *) logic [31:0] read_data_from_DDR_dbg;
    (* mark_debug="true" *) logic        data_mem_data_valid_DDR_dbg;

    // ---- input side (CPU → data_memory)
    assign cpu_data_read_ready_DDR_dbg = cpu_data_read_ready_DDR;
    assign data_read_addr_DDR_dbg      = data_read_addr_DDR;
    assign data_write_enable_DDR_dbg   = data_write_enable_DDR;
    assign data_write_addr_DDR_dbg     = data_write_addr_DDR;
    assign data_write_data_DDR_dbg     = data_write_data_DDR;

    // ---- output side (data_memory → CPU)
    assign data_mem_req_ready_DDR_dbg  = data_mem_req_ready_DDR;
    assign read_data_from_DDR_dbg      = read_data_from_DDR;
    assign data_mem_data_valid_DDR_dbg = data_mem_data_valid_DDR;

    (* mark_debug="true" *) logic [31:0] ddr_write_count_dbg;
    (* mark_debug="true" *) logic [31:0] ddr_read_count_dbg;

    always_ff @(posedge cpu_clk) begin
        if (!rstn_synced) begin
            ddr_write_count_dbg <= 32'd0;
            ddr_read_count_dbg  <= 32'd0;
        end else begin
            // Write count: request accepted by DDR
            if (data_write_enable_DDR && data_mem_req_ready_DDR) begin
                ddr_write_count_dbg <= ddr_write_count_dbg + 32'd1;
            end

            // Read count: data returned from DDR
            if (data_mem_data_valid_DDR) begin
                ddr_read_count_dbg <= ddr_read_count_dbg + 32'd1;
            end
        end
    end


/*
    // sld debug
    localparam int SLD_DEBUG_W     = 32;
    localparam int SLD_DEBUG_DEPTH = 8;

    (* mark_debug="true" *) logic [SLD_DEBUG_W-1:0] data_write_data_sld_rom_table_dbg;
    (* mark_debug="true" *) logic                   data_write_enable_sld_rom_table_dbg;
    (* mark_debug="true" *) logic [$clog2(SLD_DEBUG_DEPTH)-1:0] sld_log_wr_ptr;
    (* mark_debug="true" *) logic                   sld_log_full;
    (* mark_debug="true" *) logic [SLD_DEBUG_W*SLD_DEBUG_DEPTH-1:0] sld_log_flat;
    logic sld_log_en;

    assign data_write_data_sld_rom_table_dbg   = data_write_data_sld_rom_table;
    assign data_write_enable_sld_rom_table_dbg = data_write_enable_sld_rom_table;
    assign sld_log_en                          = data_write_enable_sld_rom_table_dbg;

    debug_log_fifo #(
        .W(SLD_DEBUG_W),
        .DEPTH(SLD_DEBUG_DEPTH)
    ) u_log_sld (
        .clk     (cpu_clk),
        .rstn    (rstn_synced),
        .log_en  (sld_log_en),
        .log_data(data_write_data_sld_rom_table_dbg),
        .wr_ptr  (sld_log_wr_ptr),
        .full    (sld_log_full),
        .mem_flat(sld_log_flat)
    );


    // state debug
    localparam int STATE_DEBUG_W     = 4;
    localparam int STATE_DEBUG_DEPTH = 8;

    (* mark_debug="true" *) logic [STATE_DEBUG_W-1:0] state_system_dbg;
    (* mark_debug="true" *) logic [$clog2(STATE_DEBUG_DEPTH)-1:0] state_log_wr_ptr;
    (* mark_debug="true" *) logic                   state_log_full;
    (* mark_debug="true" *) logic [STATE_DEBUG_W*STATE_DEBUG_DEPTH-1:0] state_log_flat;

    logic [STATE_DEBUG_W-1:0] state_system_latched;
    logic                     state_log_en;

    assign state_system_dbg = state_system[STATE_DEBUG_W-1:0];

    // 「遷移したら記録」：遷移検出は基本コンビでOK（FIFOがposedgeで見る）
    assign state_log_en = (state_system_dbg != state_system_latched) && !state_log_full;

    // 前回値を更新（fullになったら止めたいなら更新も止める）
    always_ff @(posedge cpu_clk) begin
        if (!rstn_synced) begin
            state_system_latched <= '0;
        end else if (!state_log_full) begin
            state_system_latched <= state_system_dbg;
        end
    end

    debug_log_fifo #(
        .W(STATE_DEBUG_W),
        .DEPTH(STATE_DEBUG_DEPTH)
    ) u_log_state (
        .clk     (cpu_clk),
        .rstn    (rstn_synced),
        .log_en  (state_log_en),
        .log_data(state_system_dbg),
        .wr_ptr  (state_log_wr_ptr),
        .full    (state_log_full),
        .mem_flat(state_log_flat)
    );
*/


endmodule

`default_nettype wire
