`default_nettype wire

module debug_log_fifo #(
    parameter int W = 5,                 // A_dbg 幅
    parameter int DEPTH = 32,             // ← 32固定運用推奨
    parameter int ADDR_W = $clog2(DEPTH)
) (
    input  logic              clk,
    input  logic              rstn,

    input  logic              log_en,
    input  logic [W-1:0]      log_data,

    output logic [ADDR_W-1:0] wr_ptr,
    output logic              full,

    // ILAでまとめて見る用：mem[0]が下位、mem[31]が上位
    output logic [W*DEPTH-1:0] mem_flat
);

    logic [W-1:0] mem [0:DEPTH-1];

    // mem を 1本のバスへパック（ILAに突っ込みやすい）
    genvar i;
    generate
        for (i = 0; i < DEPTH; i++) begin : GEN_PACK
            assign mem_flat[W*i +: W] = mem[i];
        end
    endgenerate

    always_ff @(posedge clk) begin
        if (!rstn) begin
            wr_ptr <= '0;
            full   <= 1'b0;
        end else begin
            if (log_en && !full) begin
                mem[wr_ptr] <= log_data;

                if (wr_ptr == DEPTH-1) begin
                    full   <= 1'b1;   // 32個埋まったら止める
                    wr_ptr <= wr_ptr; // そのまま
                end else begin
                    wr_ptr <= wr_ptr + 1'b1;
                end
            end
        end
    end

endmodule

`default_nettype wire

// FIFO_2 

module debug_log_fifo_2 #(
    parameter int W = 5,
    parameter int DEPTH = 32,
    parameter int ADDR_W = $clog2(DEPTH)
) (
    input  logic              clk,
    input  logic              rstn,

    input  logic              log_en,
    input  logic [W-1:0]      log_data,

    // 今何個たまってるか（0..DEPTH）
    output logic [ADDR_W:0]   wr_ptr,   // ← 0..DEPTH を表したいので 1bit 広げる
    output logic              full,

    // ILAでまとめて見る用：mem[0]が先頭（最古寄り）, mem[DEPTH-1]が最後尾（最新）
    output logic [W*DEPTH-1:0] mem_flat
);

    logic [W-1:0] mem [0:DEPTH-1];

    // mem を 1本のバスへパック（mem[0]が下位側）
    genvar i;
    generate
        for (i = 0; i < DEPTH; i++) begin : GEN_PACK
            assign mem_flat[W*i +: W] = mem[i];
        end
    endgenerate

    integer k;

    always_ff @(posedge clk) begin
        if (!rstn) begin
            wr_ptr <= '0;
            full   <= 1'b0;
            // 任意：見やすさのため初期化（なくてもOK）
            for (k = 0; k < DEPTH; k++) begin
                mem[k] <= '0;
            end
        end else begin
            if (log_en) begin
                if (!full) begin
                    // まだ満杯じゃない：末尾へ“追加”
                    mem[wr_ptr] <= log_data;
                    wr_ptr      <= wr_ptr + 1'b1;
                    if (wr_ptr + 1'b1 == DEPTH) begin
                        full <= 1'b1;
                    end
                end else begin
                    // 満杯：常に「後ろに詰める」＝左にシフトして末尾に最新
                    for (k = 0; k < DEPTH-1; k++) begin
                        mem[k] <= mem[k+1];
                    end
                    mem[DEPTH-1] <= log_data;

                    // fullのまま、wr_ptrはDEPTH固定（今DEPTH個保持中）
                    wr_ptr <= DEPTH[ADDR_W:0];
                    full   <= 1'b1;
                end
            end
        end
    end

endmodule

`default_nettype wire


`default_nettype wire

