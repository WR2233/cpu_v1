`default_nettype wire

// UART send port

module uart_tx #(parameter CLK_PER_HALF_BIT = 434) (
               input logic       clk,
               input logic       rstn,

               input logic [7:0] sdata,
               input logic       tx_start,
               output logic     tx_busy,
               output logic     txd
);

// ---- declarations -----

   parameter e_clk_bit = CLK_PER_HALF_BIT * 2 - 1;
   parameter e_clk_stop_bit = CLK_PER_HALF_BIT * 2 - 1;
   
   logic [7:0]                  txbuf;
   logic                        next;
   logic                        fin_stop_bit;
   logic                        rst_ctr;
   
   // fsm
   logic [31:0]                 counter;
   typedef enum logic [3:0] {
      s_idle,        // 0
      s_start_bit,   // 1
      s_bit_0,       // 2
      s_bit_1,       // 3
      s_bit_2,       // 4
      s_bit_3,       // 5
      s_bit_4,       // 6
      s_bit_5,       // 7
      s_bit_6,       // 8
      s_bit_7,       // 9
      s_stop_bit     // 10
   } status_t;

   status_t status;

   
// ---- signals -----
   always_ff @(posedge clk) begin
      if (~rstn) begin
         counter <= 0;
         next <= 0;
         fin_stop_bit <= 0;
      end else begin
         if (counter == e_clk_bit || rst_ctr) begin
            counter <= 0;
         end else begin
            if (status != s_idle) begin // when state is idle, don't count up!
               counter <= counter + 1;
            end else begin
               counter <= 0;
            end
         end
         if (~rst_ctr && counter == e_clk_bit) begin
            next <= 1;
         end else begin
            next <= 0;
         end
         if (~rst_ctr && counter == e_clk_stop_bit) begin
            fin_stop_bit <= 1;
         end else begin
            fin_stop_bit <= 0;
         end
      end
   end

// ---- FSM -----
   always_ff @(posedge clk) begin
      if (~rstn) begin
         txbuf <= 0;
         status <= s_idle;
         rst_ctr <= 0;
         txd <= 1;
         tx_busy <= 0;
      end else begin
         rst_ctr <= 0;
         
         if (status == s_idle) begin
            if (tx_start) begin
               txbuf <= sdata;
               status <= s_start_bit;
               rst_ctr <= 1;
               txd <= 0;
               tx_busy <= 1;
            end
         end else if (status == s_stop_bit) begin
            if (fin_stop_bit) begin
               txd <= 1;
               status <= s_idle;
               tx_busy <= 0;
            end
         end else if (next) begin
            if (status == s_bit_7) begin
               txd <= 1;
               status <= s_stop_bit;
            end else begin
               txd <= txbuf[0];
               txbuf <= txbuf >> 1;
               status <= status_t'(status + 1);
            end
         end
      end
   end

endmodule

`default_nettype wire
