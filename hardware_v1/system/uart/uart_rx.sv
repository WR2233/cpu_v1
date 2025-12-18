`default_nettype wire

// UART receive port

module uart_rx #(parameter CLK_PER_HALF_BIT = 434) (
               output logic [7:0] rdata,
               output logic       rdata_ready,
               output logic       ferr,
               input logic         rxd,
               input logic         clk,
               input logic         rstn
);

// ---- declarations -----

   // oversampling
   logic [2:0] temp; // for majority vote (temp >= 3 ? 1 : 0)
   parameter OVERSAMPLING_NUM = 16;
   parameter CLK_PER_TICK = (CLK_PER_HALF_BIT * 2) / OVERSAMPLING_NUM;

   // fsm
   logic [31:0] counter;
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

   
// ----- synchronize rxd (Important! Make all the circuits "synchronized"! Understand non-blocking substition!) -----
   logic rxd_sync1;
   logic rxd_sync2;
   logic rxd_synced;
   always_ff @(posedge clk) begin
      if (~rstn) begin
         rxd_sync1 <= 1;
         rxd_sync2 <= 1;
         rxd_synced <= 1;
      end else begin
         rxd_sync1 <= rxd;
         rxd_sync2 <= rxd_sync1;
         rxd_synced <= rxd_sync2;
      end
   end

// ----- FSM -----
   always_ff @(posedge clk) begin
      if (~rstn) begin
        rdata <= 0;
        rdata_ready <= 0;
        ferr <= 0;
        status <= s_idle;
        counter <= 0;
        temp <= 0;
      end else begin

         if (status == s_idle) begin

            rdata_ready <= 0;
            ferr <= 0;
            counter <= 0;
            temp <= 0;
            if (~rxd_synced) begin // start bit detected
               status <= s_start_bit;
               counter <= 1;
            end

         end else if (status == s_start_bit) begin

            // start bit check
            if (counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 - 2) ||
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 - 1) ||
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2)     ||
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 + 1) ||
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 + 2)) begin
               temp <= temp + rxd_synced;
            end
            else if (counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 + 3)) begin
               if (temp <= 2) begin
                  // start confirmed (low)
                  // keep going until 1 bit elapsed, then go to bit_0
               end else begin
                  // false start
                  counter <= 0;
                  temp    <= 0;
                  status  <= s_idle;
               end
            end

            // after full start bit time, move to bit_0
            if (counter == (CLK_PER_HALF_BIT * 2 - 1)) begin
               counter <= 0;
               temp    <= 0;
               status  <= s_bit_0;
            end else begin
               counter <= counter + 1;
            end

         end else if (status >= s_bit_0 && status <= s_bit_7) begin // main bits
            
            if (counter == CLK_PER_TICK * (OVERSAMPLING_NUM / 2 - 2) || 
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM / 2 - 1) || 
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM / 2) || 
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM / 2 + 1) || 
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM / 2 + 2)) begin
               // sampling
               temp <= temp + rxd_synced;
            end else if (counter == CLK_PER_TICK * (OVERSAMPLING_NUM / 2 + 3)) begin
               // majority vote
               if (temp >= 3) rdata <= {1'b1, rdata[7:1]};
               else rdata <= {1'b0, rdata[7:1]};
            end
            
            if (counter == (CLK_PER_HALF_BIT * 2 - 1)) begin
               counter <= 0;
               temp <= 0; 
               status <= status_t'(status + 1); // to the next stage
            end else begin
               counter <= counter + 1;
            end

         end else if (status == s_stop_bit) begin

            // stop bit sampling
            if (counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 - 2) ||
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 - 1) ||
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2)     ||
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 + 1) ||
               counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 + 2)) begin
               temp <= temp + rxd_synced;
            end
            else if (counter == CLK_PER_TICK * (OVERSAMPLING_NUM/2 + 3)) begin
               if (temp >= 3) rdata_ready <= 1;
               else ferr <= 1;
            end else begin
               rdata_ready <= 0;
            end

            if (counter == CLK_PER_HALF_BIT * 2 - 1) begin
               counter <= 0;
               temp <= 0;
               status  <= s_idle;
            end else begin
               counter <= counter + 1;
            end

         end
      end
   end
   
endmodule

`default_nettype wire
