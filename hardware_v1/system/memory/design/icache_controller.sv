/**
 * cache_controller.sv
 *
 * CPUとDRAMの間に位置する、シンプルなブロッキングキャッシュコントローラ。
 * - ダイレクトマップ方式
 * - リード要求のみ対応 (ライトは未実装)
 * - キャッシュミス時はCPUを待たせる(ブロッキング)
 */
module instr_memory # (
    parameter NON_DDR_ADDRESS = 32'hffff0008
)(
    // グローバルクロックと非同期リセット
    input logic clk,
    input logic rstn, // Active Low


    // CPU側インターフェース
    input wire[31:0] read_addr,      // CPUからのアドレス要求
    output logic[31:0] read_data, // CPUへの応答データ

    input wire[31:0] write_addr,      // CPUからのアドレス要求
    input logic[127:0] write_data, // CPUからの書き込みデータ (未使用)
    input wire       system_req_valid,
    input wire       read_start,
    
    output logic     mem_req_ready,   // CPUへの要求受理可能信号
    output logic     mem_data_valid,    // CPUへの応答有効信号
    // input wire       cpu_rsp_rdy,   // CPUからの応答受理可能信号

    // DRAM側インターフェース (マスターとして振る舞う)
    master_fifo.master fifo
);  
logic  has_read_started;
always_ff @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        has_read_started <= 1'b0;
    end else if (read_start) begin
        has_read_started <= 1'b1;
end
end
    logic [31:0] cpu_addr;
    // logic        cpu_req_we;
    logic        cpu_req_en;

    assign cpu_addr   = has_read_started ? read_addr : write_addr;
    // assign cpu_req_we = has_read_started ? 1'b0 : 1'b1;
    assign cpu_req_en = (has_read_started && read_addr != NON_DDR_ADDRESS)| system_req_valid;

    //================================================================
    // パラメータと型定義
    //================================================================

    // アドレス幅の定義 (27ビットアドレスを想定)
    localparam ADDR_WIDTH   = 27;
    localparam OFFSET_WIDTH = 4;  // 128bit = 16byte -> 2^4
    localparam INDEX_WIDTH  = 12; // 4096 lines -> 2^12
    localparam TAG_WIDTH    = ADDR_WIDTH - INDEX_WIDTH - OFFSET_WIDTH; // 27 - 12 - 4 = 11 bit
    localparam NUM_WAYS     = 2;      
                                                                                          
                                                                                                                            
                                                                                                             
    // データ幅の定義
    localparam DATA_WIDTH     = 128;
    localparam METADATA_WIDTH = TAG_WIDTH + 1; // Tag (11bit) + Valid (1bit) + Dirty (1bit)
 
    // ステートマシンの状態定義
    typedef enum logic [2:0] {
        IDLE_WRITE,
        IDLE,               // CPUからの要求待ち
        // TAG_CHECK,          // BRAMからタグを読み出し、ヒット/ミスを判定
        // MISS_WRITEBACK_WAIT, // (ミス時) DRAMへの書き戻し完了待ち
        // WAIT_WRITEBACK_SEND,
        WAIT_REQ_DRAM,
        MISS_REQ_DRAM,      // (ミス時) DRAMへデータ要求
        MISS_WAIT_DRAM,     // (ミス時) DRAMからのデータ受信待ち
        MISS_UPDATE_CACHE   // (ミス時) BRAMを更新し、CPUへ応答
    } state_t;



    //================================================================
    // 内部信号宣言
    //================================================================

    // ステートマシン
    state_t state, next_state;

    // CPUからの要求をラッチするレジスタ
    logic [ADDR_WIDTH-1:0]  latched_addr;
    logic [TAG_WIDTH-1:0]   req_tag;
    logic [INDEX_WIDTH-1:0] req_index;
    logic [OFFSET_WIDTH-1:0]req_offset;
    logic [31:0]           req_data;
    // logic                   latched_we;

    // BRAMインターフェース信号           
    logic [INDEX_WIDTH-1:0]   bram_addra;
    logic [INDEX_WIDTH-1:0]   bram_addrb;

    logic                     metadata_wea_way0;
    logic [METADATA_WIDTH-1:0]metadata_ina_way0;
    logic [METADATA_WIDTH-1:0]metadata_outa_way0;

    logic                     metadata_wea_way1;
    logic [METADATA_WIDTH-1:0]metadata_ina_way1;
    logic [METADATA_WIDTH-1:0]metadata_outa_way1;

    logic                     metadata_web_way0;
    logic                     metadata_web_way1;

    logic [METADATA_WIDTH-1:0]metadata_inb_way0;
    logic [METADATA_WIDTH-1:0]metadata_outb_way0;

    logic [METADATA_WIDTH-1:0]metadata_inb_way1;
    logic [METADATA_WIDTH-1:0]metadata_outb_way1;           

    logic                     data_wea_way0;
    logic [DATA_WIDTH-1:0]    data_ina_way0;
    logic [DATA_WIDTH-1:0]    data_outa_way0;

    logic                     data_wea_way1;
    logic [DATA_WIDTH-1:0]    data_ina_way1;
    logic [DATA_WIDTH-1:0]    data_outa_way1;

    logic                     data_web_way0;
    logic [DATA_WIDTH-1:0]    data_inb_way0;
    logic [DATA_WIDTH-1:0]    data_outb_way0;

    logic                     data_web_way1;
    logic [DATA_WIDTH-1:0]    data_inb_way1;
    logic [DATA_WIDTH-1:0]    data_outb_way1;

    //logic [INDEX_WIDTH-1:0] lru_bram_addrb;
    logic                   lru_bram_doutb; // BRAMからの読み出し(1bit)
    logic                   update_lru_we;
    logic                   update_lru_to;

    // キャッシュから読み出したメタデータ
    // logic                    dirty_bit_way0;
    // logic                    dirty_bit_way1;
    // logic                    dirty_bit;
    logic                     stored_valid_way0;
    logic                     stored_valid_way1;
    // logic                     stored_valid;
    logic [TAG_WIDTH-1:0]     stored_tag_way0;
    logic [TAG_WIDTH-1:0]     stored_tag_way1;
    // logic [TAG_WIDTH-1:0]     stored_tag;

    // ヒット判定ロジック
    logic is_hit;

    //LRUテーブル
    logic latched_lru_bit;
    // logic lru_bits [2**INDEX_WIDTH];

    logic is_req_en_before;
        //pipeline化の本体
    logic s2_rsp_en;
    logic pipeline_stall;

    //stall時の対応のため, cpu_index_nowから参照されているデータを取っておく
    // logic [DATA_WIDTH-1:0] data_outb_way0_reg;
    // logic [DATA_WIDTH-1:0] data_outb_way1_reg;



    blk_mem_gen_5 metadata_bram_way0 (
        .clka(clk),
        .wea(metadata_wea_way0),
        .addra(bram_addra),
        .dina(metadata_ina_way0),
        .douta(metadata_outa_way0),
        .ena(1'b1),
        .clkb(clk),
        .web(metadata_web_way0),
        .addrb(bram_addrb),
        .dinb(metadata_inb_way0),
        .doutb(metadata_outb_way0),
        .enb(1'b1)
    );
    blk_mem_gen_7 metadata_bram_way1 (
        .clka(clk),
        .wea(metadata_wea_way1),
        .addra(bram_addra),
        .dina(metadata_ina_way1),
        .douta(metadata_outa_way1),
        .ena(1'b1),
        .clkb(clk),
        .web(metadata_web_way1),
        .addrb(bram_addrb),
        .dinb(metadata_inb_way1),
        .doutb(metadata_outb_way1),
        .enb(1'b1)
    );
    blk_mem_gen_6 data_bram_way0 (
        .clka(clk),
        .wea(data_wea_way0),
        .addra(bram_addra),
        .dina(data_ina_way0),
        .douta(data_outa_way0),
        .ena(1'b1),
        .clkb(clk),          
        .web(data_web_way0),
        .addrb(bram_addrb),
        .dinb(data_inb_way0),
        .doutb(data_outb_way0),
        .enb(1'b1)
    );
    blk_mem_gen_8 data_bram_way1 (
        .clka(clk),
        .wea(data_wea_way1),
        .addra(bram_addra),
        .dina(data_ina_way1),
        .douta(data_outa_way1),
        .ena(1'b1),
        .clkb(clk),
        .web(data_web_way1),
        .addrb(bram_addrb),
        .dinb(data_inb_way1),
        .doutb(data_outb_way1),
        .enb(1'b1)
    );
    blk_mem_gen_9 lru_bram (
    .clka(clk),                // Port A (Write)
    .wea(update_lru_we),       // ★書き込みイネーブル
    .addra(req_index),         // ★書き込みアドレス
    .dina(update_lru_to),      // ★書き込みデータ
    .ena(1'b1),

    .clkb(clk),                // Port B (Read)
    .addrb(bram_addrb),    // ★読み出しアドレス
    .doutb(lru_bram_doutb),    // ★読み出しデータ
    .enb(1'b1)
    );


    //================================================================
    // 内部ロジック
    //================================================================

    // アドレスをタグ、インデックス、オフセットに分解
    assign req_tag    = latched_addr[ADDR_WIDTH-1 : INDEX_WIDTH+OFFSET_WIDTH];
    assign req_index  = latched_addr[INDEX_WIDTH+OFFSET_WIDTH-1 : OFFSET_WIDTH];
    assign req_offset = latched_addr[OFFSET_WIDTH-1 : 0];

    // BRAMのアドレスは常にインデックス
    // assign bram_addr = req_index;
    logic [INDEX_WIDTH-1:0] cpu_index_now;
    assign cpu_index_now = cpu_addr[INDEX_WIDTH+OFFSET_WIDTH-1 : OFFSET_WIDTH];

    // BRAMから読み出したメタデータをValidとTagに分割
    // assign dirty_bit_way0   = metadata_outb_way0[TAG_WIDTH+1];
    assign stored_valid_way0 = metadata_outb_way0[TAG_WIDTH];
    assign stored_tag_way0   = metadata_outb_way0[TAG_WIDTH-1:0];

    // assign dirty_bit_way1   = metadata_outb_way1[TAG_WIDTH+1];
    assign stored_valid_way1 = metadata_outb_way1[TAG_WIDTH];
    assign stored_tag_way1   = metadata_outb_way1[TAG_WIDTH-1:0];

    // ヒット条件: Validビットが1で、かつタグが一致
    assign is_hit_way0 = stored_valid_way0 && (stored_tag_way0 == req_tag);
    assign is_hit_way1 = stored_valid_way1 && (stored_tag_way1 == req_tag);
    assign is_hit = is_hit_way0 || is_hit_way1;

// どのwayにヒットしたかを保持する信号
    logic [NUM_WAYS-1:0] hit_way_oh; // One-hot
    assign hit_way_oh = {is_hit_way1, is_hit_way0};
    // DRAMへのクロックはコントローラのクロックと同じ
    assign fifo.clk = clk;
    logic start_counter;
    logic stop_counter;
    logic [127:0] dram_data_buffer;
                                                              
    // logic latched_addr_en;

    //================================================================
    // ステートマシン (FSM)
    //================================================================

    // FSMシーケンシャルロジック (状態遷移)
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= IDLE_WRITE;
        end else begin
            state <= next_state;
        end
    end
    reg stop;



    always_ff @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        latched_addr <= '0;
        req_data <= '0;
        // latched_we <= 1'b0;
        latched_lru_bit <= 1'b0;
        is_req_en_before <= 1'b0;
        dram_data_buffer <= '0;
    end else if (!pipeline_stall&&next_state==IDLE) begin 
        // latched_lru_bit <= lru_bram_doutb;
        req_data <= write_data;
        latched_addr <= cpu_addr[ADDR_WIDTH-1:0];
        // latched_we <= cpu_req_we;
        is_req_en_before <= cpu_req_en;
        // data_outb_way0_reg <= data_outb_way0;
        // data_outb_way1_reg <= data_outb_way1;
    end else if (stop_counter) begin
        is_req_en_before <= 1'b0;
    end else if (state == MISS_WAIT_DRAM && fifo.rsp_en) begin
        dram_data_buffer <= fifo.rsp.data;
    end
end

    // Victim選択用のLRUビットを決定する組み合わせロジック
// logic lru_bit_for_victim_selection;
// assign lru_bit_for_victim_selection = (state != IDLE) ? latched_lru_bit : lru_bram_doutb;
// ★ FSM動作中はラッチした値、IDLE中はライブの値を使う

// Victim Way の決定
logic victim_is_way0;
assign victim_is_way0 = (lru_bram_doutb == 1'b0);
    logic [DATA_WIDTH-1:0] selected_data_out;
    logic [METADATA_WIDTH-1:0] new_metadata;

    assign s2_rsp_en = is_req_en_before && is_hit; // S2が応答すべきか
    assign pipeline_stall = (state != IDLE);
    assign mem_req_ready = (!pipeline_stall && (!is_req_en_before || is_hit))|| (state == IDLE_WRITE && fifo.req_rdy);

    assign bram_addrb = !pipeline_stall ? cpu_index_now : req_index;

    // logic write_stalled;// system_req_validが立ったがfifo.req_rdyが立っていないときに立つ
    // always_ff @(posedge clk or negedge rstn) begin
    // if (!rstn) begin
    //     write_stalled <= 1'b0;
    // end else if (state == IDLE_WRITE) begin
    //     if(system_req_valid && !fifo.req_rdy) begin
    //         write_stalled <= 1'b1;
    //     end else if (fifo.req_rdy) begin
    //         write_stalled <= 1'b0;
    //     end
    // end
    // end


    always_comb begin
                // --- デフォルト値の設定 ---
        next_state = state;


        start_counter = 1'b0;
        stop_counter  = 1'b0;

        update_lru_we = 1'b0;
        update_lru_to = 1'b0;

        // CPUインターフェース
        // mem_req_ready = 1'b0;
        mem_data_valid  = 1'b0;
        read_data = '1;

        // DRAMインターフェース
        fifo.req_en     = 1'b0;
        fifo.req.cmd    = 1'b1; // Read
        fifo.req.addr   = {req_tag, req_index, {OFFSET_WIDTH{1'b0}}}; // オフセットは0に固定
        fifo.req.data   = '0;
        fifo.rsp_rdy    = 1'b0;

        // BRAMインターフェース
        metadata_wea_way0 = 1'b0;
        metadata_ina_way0 = '0;
        data_wea_way0     = 1'b0;
        data_ina_way0     = '0;

        metadata_wea_way1 = 1'b0;
        metadata_ina_way1 = '0;
        data_wea_way1     = 1'b0;
        data_ina_way1     = '0;


        metadata_web_way0 = 1'b0;
        metadata_inb_way0 = '0;
        data_web_way0     = 1'b0;
        data_inb_way0     = '0;

        metadata_web_way1 = 1'b0;
        metadata_inb_way1 = '0;
        data_web_way1     = 1'b0;
        data_inb_way1     = '0;

        new_metadata = '0;

        bram_addra = req_index; 
        // bram_addrb = cpu_index_now;


        // latched_addr_en = 1'b0;
        // if (cpu_req_en && !pipeline_stall) {
        //     latched_addr_en = 1'b1;
        // }


        case (hit_way_oh)
            2'b01:  selected_data_out = data_outb_way0; // Way0にヒット
            2'b10:  selected_data_out = data_outb_way1; // Way1にヒット
            default: selected_data_out = '0; // ヒットしていない
        endcase
        case (state)
            IDLE_WRITE: begin
                if(read_start) begin
                    next_state = IDLE;
                end
                fifo.req_en = system_req_valid;
                fifo.req.cmd    = 1'b0; // Write
                fifo.req.addr   = {cpu_addr[ADDR_WIDTH-1:OFFSET_WIDTH], {OFFSET_WIDTH{1'b0}}}; // オフセットは0に固定
                fifo.req.data   = write_data;
            end
            IDLE: begin
            // mem_req_ready = 1'b1;
            if (is_req_en_before) begin
                start_counter = 1'b1;
                if (is_hit) begin
                    // ---- キャッシュヒット ----
                    mem_data_valid = 1'b1;
                    case (req_offset[3:2])
                        2'b00:  read_data = selected_data_out[31:0];
                        // 2'b01:  read_data = selected_data_out[63:32];
                        // 2'b10:  read_data = selected_data_out[95:64];
                        // 2'b11:  read_data = selected_data_out[127:96];
                        // 2'b00:  read_data = 32'h0000_1234;
                        2'b01:  read_data = selected_data_out[63:32];
                        2'b10:  read_data = selected_data_out[95:64];
                        2'b11:  read_data = selected_data_out[127:96];
                        default: read_data = '0;
                    endcase
                    stop_counter = 1'b1;


                    // CPUが応答を受け取ったらIDLEへ
                    // if (cpu_rsp_rdy) begin
                        next_state = IDLE;
                        update_lru_we = 1'b1;
                        update_lru_to = (hit_way_oh == 2'b01) ? 1'b1 : 1'b0; // ヒットしたWayをLRUで最新に
                    // end
                end else begin
                    // // ★ victim_is_way0 を使ってVictimのDirtyビットを特定
                    // logic victim_dirty_bit;
                    // if (victim_is_way0) begin
                    //     victim_dirty_bit = dirty_bit_way0;
                    // end else begin
                    //     victim_dirty_bit = dirty_bit_way1;
                    // end

                    // if (!victim_dirty_bit) begin
                    //     next_state = WAIT_REQ_DRAM;
                    // end else begin
                    //     // ---- キャッシュミス + ダーティビットが立っている ----
                    //     next_state = WAIT_WRITEBACK_SEND;
                    // end
                    next_state = WAIT_REQ_DRAM;
                end
            end
            end
           WAIT_REQ_DRAM: begin
                next_state = MISS_REQ_DRAM;
            end


            MISS_REQ_DRAM: begin
                // DRAMへデータ要求を出す
                fifo.req_en = 1'b1;
                if (fifo.req_rdy) begin
                    next_state = MISS_WAIT_DRAM;
                end
            end

            MISS_WAIT_DRAM: begin
                // DRAMからの応答を待つ
                fifo.rsp_rdy = 1'b1;
                if (fifo.rsp_en) begin
                    next_state = MISS_UPDATE_CACHE;
                end
            end



            MISS_UPDATE_CACHE: begin
                // BRAMを新しいデータで更新
                // metadata_wea = 1'b1;
                // metadata_ina = {1'b0, 1'b1, req_tag}; // Valid=1, Tag=要求されたタグ

                // data_wea = 1'b1;
                // data_ina = fifo.rsp.data; // DRAMから来たデータ
                if(victim_is_way0) begin
                    metadata_wea_way0 = 1'b1;
                    metadata_ina_way0 = {1'b1, req_tag}; // Valid=1, Dirty=0, Tag=要求されたタグ

                    data_wea_way0 = 1'b1;
                    // data_ina_way0 = fifo.rsp.data; // DRAMから来たデータ
                    data_ina_way0 = dram_data_buffer;
                end else begin
                    metadata_wea_way1 = 1'b1;
                    metadata_ina_way1 = {1'b1, req_tag}; // Valid=1, Dirty=0, Tag=要求されたタグ

                    data_wea_way1 = 1'b1;
                    // data_ina_way1 = fifo.rsp.data; // DRAMから来たデータ
                    data_ina_way1 = dram_data_buffer;
                end

                // 同時にCPUへも応答
                mem_data_valid = 1'b1;
                case (req_offset[3:2])
                    // 2'b00:  read_data = fifo.rsp.data[31:0];
                    2'b00:  read_data = dram_data_buffer[31:0];
                    // 2'b01:  read_data = fifo.rsp.data[63:32];
                    2'b01:  read_data = dram_data_buffer[63:32];
                    // 2'b10:  read_data = fifo.rsp.data[95:64];
                    2'b10:  read_data = dram_data_buffer[95:64];
                    // 2'b11:  read_data = fifo.rsp.data[127:96];
                    2'b11:  read_data = dram_data_buffer[127:96];
                    default: read_data = '0;
                endcase
                stop_counter = 1'b1;

                // CPUが応答を受け取ったらIDLEへ戻る
                // BRAMへの書き込みは1サイクルで完了すると仮定
                // if (cpu_rsp_rdy) begin
                    next_state = IDLE;
                    update_lru_we = 1'b1;
                    update_lru_to = victim_is_way0 ? 1'b1 : 1'b0; // 新たに書き込んだWayをLRUで最新に
                // end
                    
                    // metadata_wea = 1'b1;
                    // metadata_ina = {1'b1, 1'b1, req_tag}; // Valid=1, Dirty=1, Tag=要求されたタグ



                    // data_wea = 1'b1;

            end

            default: begin
                next_state = IDLE;
            end
        endcase
        
        
    end

   

endmodule