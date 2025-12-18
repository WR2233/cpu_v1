`default_nettype wire

module bram #(
    parameter MEM_SIZE = 1024, // size in words
    parameter INVALID_ADDRESS = 32'hfafafafa
) (
    input logic clk,
    input logic rstn,

    input logic [31:0] read_addr,
    output logic [31:0] read_data,
    
    input logic [31:0] write_addr,
    input logic [31:0] write_data,
    input logic        write_enable
);

// ----- declarations -----
    (* ram_style = "block" *) logic [31:0] mem [0:MEM_SIZE-1];
    parameter AW = $clog2(MEM_SIZE);

    // registered raw value from BRAM
    logic [31:0] mem_q;

    // 1サイクル前の read_addr を保持
    logic [31:0] read_addr_q;

    // 安全なインデックス（INVALID_ADDRESS のときは 0 を使う）
    logic [AW-1:0] read_index;
    logic [AW-1:0] write_index;

// ----- initialization -----
    initial begin
        for (int i = 0; i < MEM_SIZE; i++) begin
            mem[i] = 32'd0;
        end
    end

// ----- index mask -----
    always_comb begin
        if (read_addr == INVALID_ADDRESS) begin
            read_index = '0;
        end else begin
            read_index = read_addr[2 +: AW];
        end

        write_index = write_addr[2 +: AW];
    end

// ----- read and write -----
    always_ff @(posedge clk) begin
        if (~rstn) begin
            mem_q       <= 32'd0;
            read_addr_q <= INVALID_ADDRESS;   // リセット直後は BEEF を返すように
        end else begin
            // 次サイクルに出てくる mem_q に対応するアドレスをラッチ
            read_addr_q <= read_addr;

            // BRAM read
            mem_q <= mem[read_index];

            // INVALID_ADDRESS への write は無視
            if (write_enable && (write_addr != INVALID_ADDRESS)) begin
                mem[write_index] <= write_data;
            end
        end
    end

// ----- output (INVALID masked here) -----
// mem_q は「read_addr_q に対応するデータ」
    assign read_data =
        (read_addr_q == INVALID_ADDRESS) ? 32'hbeefbeef : mem_q;

endmodule

`default_nettype wire
