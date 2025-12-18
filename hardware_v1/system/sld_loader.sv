`default_nettype wire

// SLD data loader

module sld_loader #(
    parameter SLD_SIZE_BYTES = 1300 // size in bytes
) (
    input logic clk,
    input logic rstn,

    input logic [7:0] uart_rx_data,
    input logic uart_rx_valid,
    output logic uart_rx_ready,

    output logic [31:0] sld_write_data,
    output logic [31:0] sld_write_addr, // byte address (from SLD_START = 0x0)
    output logic sld_write_enable,

    output logic sld_load_done
);

// ---- declarations -----
    logic [31:0] counter;
    logic [31:0] sld;

    typedef enum logic [2:0] {
        S_LOADING_WORD_1 = 1,
        S_LOADING_WORD_2 = 2,
        S_LOADING_WORD_3 = 3,
        S_LOADING_WORD_4 = 4,  
        S_LOAD_DONE = 5
    } sld_loader_state_t;

    sld_loader_state_t state_sld_loader;

// ---- combinational -----
    always_comb begin
        sld_load_done = 0;
        uart_rx_ready = 0;
        sld_write_data = 0;
        sld_write_addr = 0;
        sld_write_enable = 0;
        case (state_sld_loader)
            S_LOADING_WORD_1: begin
                uart_rx_ready = 1;
            end
            S_LOADING_WORD_2: begin
                uart_rx_ready = 1;
            end
            S_LOADING_WORD_3: begin
                uart_rx_ready = 1;
            end
            S_LOADING_WORD_4: begin
                uart_rx_ready = 1;
                if (uart_rx_valid) begin
                    sld_write_data = {uart_rx_data, sld[23:0]};
                    sld_write_addr = counter;
                    sld_write_enable = 1;
                end
            end
            S_LOAD_DONE: begin
                sld_load_done = 1;
            end
        endcase
    end

// ----- FSM -----
    always_ff @(posedge clk) begin
        if (~rstn) begin
            state_sld_loader <= S_LOADING_WORD_1;
            counter <= 0;
        end else begin
            case (state_sld_loader)
                S_LOADING_WORD_1: begin
                    if (uart_rx_valid) begin
                        sld[7:0] <= uart_rx_data;
                        state_sld_loader <= S_LOADING_WORD_2;
                    end
                end
                S_LOADING_WORD_2: begin
                    if (uart_rx_valid) begin
                        sld[15:8] <= uart_rx_data;
                        state_sld_loader <= S_LOADING_WORD_3;
                    end
                end
                S_LOADING_WORD_3: begin
                    if (uart_rx_valid) begin
                        sld[23:16] <= uart_rx_data;
                        state_sld_loader <= S_LOADING_WORD_4;
                    end
                end
                S_LOADING_WORD_4: begin
                    if (uart_rx_valid) begin
                        sld[31:24] <= uart_rx_data;
                        counter <= counter + 4;
                        if (counter == SLD_SIZE_BYTES - 4) begin // load done
                            state_sld_loader <= S_LOAD_DONE;
                        end else begin
                            state_sld_loader <= S_LOADING_WORD_1; // don't have to wait
                        end
                    end
                end
            endcase
        end
    end

endmodule

`default_nettype wire