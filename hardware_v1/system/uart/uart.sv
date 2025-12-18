`default_nettype wire

// UART

module uart # (
    parameter OVERSAMPLING_NUM = 16,
    parameter CLK_PER_HALF_BIT = 32,
    parameter SEND_FIFO_DEPTH = 128,
    parameter RECEIVE_FIFO_DEPTH = 128
)(
    input logic clk,
    input logic rstn,

    input logic [7:0] tx_data,  // Data to be transmitted
    input logic tx_valid, // asserted by system
    output logic tx_ready, // uart asserts when UART is ready for new tx_data

    output logic [7:0] rx_data,  // Data that has been received
    output logic rx_valid, // Asserts that rx_data is valid
    input logic rx_ready, // Asserts when system is ready for new rx_data

    // Physical pins
    output logic tx,           // Transmit pin
    input logic rx            // Receive pin
);

// ----- parameters -----
    parameter SEND_FIFO_COUNTER_BIT_WIDTH = $clog2(SEND_FIFO_DEPTH) + 1; // widened counter
    parameter RECEIVE_FIFO_COUNTER_BIT_WIDTH = $clog2(RECEIVE_FIFO_DEPTH) + 1;

// ----- declarations of signals -----
    // system interface
    logic tx_busy_to_system;

    // uart_tx interface
    logic tx_busy_to_uart_tx;
    logic tx_start_to_uart_tx;
    logic [7:0] tx_data_to_uart_tx;
    logic tx_valid_to_uart_tx;

    // uart_rx interface
    logic rdata_from_uart_valid;
    logic [7:0] rdata_from_uart;
    logic ferr;

// ----- FIFO -----
    // send FIFO
    logic [7:0] tx_FIFO [SEND_FIFO_DEPTH];
    logic [SEND_FIFO_COUNTER_BIT_WIDTH-1:0] SEND_FIFO_counter;
    logic SEND_FIFO_full;
    logic [SEND_FIFO_COUNTER_BIT_WIDTH-1:0] SEND_FIFO_ring_index_head;
    logic [SEND_FIFO_COUNTER_BIT_WIDTH-1:0] SEND_FIFO_ring_index_tail;
    logic consume_from_send_fifo;
    logic store_into_send_fifo;

    // receive FIFO
    logic [7:0] rx_FIFO [RECEIVE_FIFO_DEPTH];
    logic [RECEIVE_FIFO_COUNTER_BIT_WIDTH-1:0] RECEIVE_FIFO_counter;
    logic RECEIVE_FIFO_full;
    logic [RECEIVE_FIFO_COUNTER_BIT_WIDTH-1:0] RECEIVE_FIFO_ring_index_head;
    logic [RECEIVE_FIFO_COUNTER_BIT_WIDTH-1:0] RECEIVE_FIFO_ring_index_tail;
    logic consume_from_receive_fifo;
    logic store_into_receive_fifo;
   
// ----- signals -----
    // --- signals for sending ---
    assign SEND_FIFO_full = (SEND_FIFO_counter == SEND_FIFO_DEPTH);
    assign tx_busy_to_system = SEND_FIFO_full;
    // to system
    assign tx_ready = ~tx_busy_to_system;
    // to uart_tx
    assign tx_valid_to_uart_tx = (SEND_FIFO_counter >= 1); // When data is in FIFO, sending doesn't stop!
    assign tx_start_to_uart_tx = tx_valid_to_uart_tx;
    assign tx_data_to_uart_tx = tx_FIFO[SEND_FIFO_ring_index_head];
    assign consume_from_send_fifo = tx_start_to_uart_tx & ~tx_busy_to_uart_tx; // cosume @ this cycle
    assign store_into_send_fifo = tx_valid & tx_ready; // store @ this cycle

    // --- signals for receiving ---
    assign RECEIVE_FIFO_full = (RECEIVE_FIFO_counter == RECEIVE_FIFO_DEPTH);
    assign rx_valid = (RECEIVE_FIFO_counter >= 1);
    assign rx_data = rx_FIFO[RECEIVE_FIFO_ring_index_head];
    assign consume_from_receive_fifo = rx_valid && rx_ready; // cosume @ this cycle
    assign store_into_receive_fifo = ~RECEIVE_FIFO_full && rdata_from_uart_valid; // store @ this cycle

// ----- ports -----
    // send port
    uart_tx #(
        .CLK_PER_HALF_BIT (CLK_PER_HALF_BIT)
    ) uart_send_port (
        // input
        .clk (clk),
        .rstn (rstn),
        .sdata (tx_data_to_uart_tx),
        .tx_start (tx_start_to_uart_tx), // 送信開始せよという命令

        // output
        .tx_busy (tx_busy_to_uart_tx),
        .txd (tx)
    );

    // receive port
    uart_rx #(
        .CLK_PER_HALF_BIT (CLK_PER_HALF_BIT)
    ) uart_receive_port (

        //input
        .clk (clk),
        .rstn (rstn),
        .rxd (rx),

        //output
        .rdata (rdata_from_uart),
        .rdata_ready (rdata_from_uart_valid),
        .ferr (ferr)
    );

// ----- FIFO Control -----

    // send FIFO (from system to PC)
    always_ff @(posedge clk) begin
        if (~rstn) begin
            // FIFO's head is LSB side
            SEND_FIFO_ring_index_head <= 0;
            SEND_FIFO_ring_index_tail <= 0;
            SEND_FIFO_counter <= 0;
        end else begin
            if (tx_start_to_uart_tx & ~tx_busy_to_uart_tx) begin // pc consumes data
                // FIFO内のデータを一つ処理 (combinational change in tx_data_to_uart_tx)
                SEND_FIFO_ring_index_head <= (SEND_FIFO_ring_index_head == SEND_FIFO_DEPTH - 1 ? 0 : SEND_FIFO_ring_index_head + 1);
                // SEND_FIFO_ring_index_tail is unchanged 
            end 
            if (tx_valid & tx_ready) begin // hand shake @ top module & system -> stores into FIFO
                tx_FIFO[SEND_FIFO_ring_index_tail] <= tx_data; // store 1 byte into FIFO
                SEND_FIFO_ring_index_tail <= ((SEND_FIFO_ring_index_tail == SEND_FIFO_DEPTH - 1) ? 0 : (SEND_FIFO_ring_index_tail + 1));
            end
            SEND_FIFO_counter <= SEND_FIFO_counter + store_into_send_fifo - consume_from_send_fifo;
        end
    end

    // receive FIFO (from PC to system)
    always_ff @(posedge clk) begin
        if (~rstn) begin
            // FIFO's head is LSB side
            RECEIVE_FIFO_ring_index_head <= 0;
            RECEIVE_FIFO_ring_index_tail <= 0;
            RECEIVE_FIFO_counter <= 0;
        end else begin
            if (rx_valid && rx_ready) begin // system consumes data
                RECEIVE_FIFO_ring_index_head <= ((RECEIVE_FIFO_ring_index_head == RECEIVE_FIFO_DEPTH - 1) ? 0 : RECEIVE_FIFO_ring_index_head + 1);
                // RECEIVE_FIFO_ring_index_tail is unchanged 
            end 
            if (~RECEIVE_FIFO_full && rdata_from_uart_valid) begin // PCからデータをちゃんと受け取れた時
                rx_FIFO[RECEIVE_FIFO_ring_index_tail] <= rdata_from_uart; // store 1 byte into FIFO
                RECEIVE_FIFO_ring_index_tail <= ((RECEIVE_FIFO_ring_index_tail == RECEIVE_FIFO_DEPTH - 1) ? 0 : (RECEIVE_FIFO_ring_index_tail + 1));
            end
            RECEIVE_FIFO_counter <= RECEIVE_FIFO_counter + store_into_receive_fifo - consume_from_receive_fifo;
        end
    end

endmodule

`default_nettype wire
