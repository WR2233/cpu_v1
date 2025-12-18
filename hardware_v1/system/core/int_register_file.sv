`default_nettype wire

// Integer register files

module int_register_file #(
   parameter INIT_SP = 1024 * 4, // initial stack pointer
   parameter UART_TX_ADDR = 32'hffff0000,
   parameter HEAP_START = 32'h00001000, // initial heap pointer
   parameter REG_NUM = 32
) (
   input logic clk,
   input logic rstn,

   input logic [$clog2(REG_NUM)-1:0] read_addr1,
   input logic [$clog2(REG_NUM)-1:0] read_addr2,
   output logic [31:0] read_data1,
   output logic [31:0] read_data2,

   input logic write_enable_1,
   input logic [$clog2(REG_NUM)-1:0] write_addr_1,
   input logic [31:0] write_data_1,

   input logic write_enable_2,
   input logic [$clog2(REG_NUM)-1:0] write_addr_2,
   input logic [31:0] write_data_2,

   input logic int_scoreboard_write_enable_1,
   input logic [$clog2(REG_NUM)-1:0] int_scoreboard_write_addr_1,
   input logic int_scoreboard_write_data_1,

   input logic int_scoreboard_write_enable_2,
   input logic [$clog2(REG_NUM)-1:0] int_scoreboard_write_addr_2,
   input logic int_scoreboard_write_data_2,

   input logic prioritize_which_port_reg,
   input logic prioritize_which_port_scoreboard,

   output logic int_reg_busy_s1,
   output logic int_reg_busy_s2,
   output logic int_reg_busy_rd
);

// ----- declarations -----
   logic [31:0] int_registers [REG_NUM];
   logic [REG_NUM-1:0] int_scoreboard;
   logic actual_write_enable_1;
   logic actual_write_enable_2;
   logic actual_int_scoreboard_write_enable_1;
   logic actual_int_scoreboard_write_enable_2;
   localparam SP_REG = 2;
   localparam UART_TX_REG = 3;
   localparam HP_REG = 4;

// ----- read -----
   assign read_data1 = int_registers[read_addr1];
   assign read_data2 = int_registers[read_addr2];
   assign int_reg_busy_s1 = int_scoreboard[read_addr1];
   assign int_reg_busy_s2 = int_scoreboard[read_addr2];
   assign int_reg_busy_rd = int_scoreboard[int_scoreboard_write_addr_2];

// ----- write -----
   // cannnot edit 0 reg!
   assign actual_write_enable_1 = write_enable_1 & (write_addr_1 != 0);
   assign actual_write_enable_2 = write_enable_2 & (write_addr_2 != 0);
   assign actual_int_scoreboard_write_enable_1 = int_scoreboard_write_enable_1 & (int_scoreboard_write_addr_1 != 0);
   assign actual_int_scoreboard_write_enable_2 = int_scoreboard_write_enable_2 & (int_scoreboard_write_addr_2 != 0);

   always_ff @(posedge clk) begin
      if (~rstn) begin
         for (int i = 0; i < REG_NUM; i++) begin
            int_scoreboard[i] <= 0;
            if (i == SP_REG) begin
               int_registers[i] <= INIT_SP;
            end else if (i == UART_TX_REG) begin
               int_registers[i] <= UART_TX_ADDR;
            end else if (i == HP_REG) begin
               int_registers[i] <= HEAP_START;
            end else begin
               int_registers[i] <= 0;
            end
         end
      end else begin // prioritize 2nd port write
         // register
         if (actual_write_enable_1 & actual_write_enable_2) begin
            if (write_addr_1 == write_addr_2) begin
               if (~prioritize_which_port_reg) begin
                  int_registers[write_addr_1] <= write_data_1;
               end else begin
                  int_registers[write_addr_2] <= write_data_2;
               end
            end else begin
               int_registers[write_addr_1] <= write_data_1;
               int_registers[write_addr_2] <= write_data_2;
            end
         end else if (actual_write_enable_1 & ~actual_write_enable_2) begin
            int_registers[write_addr_1] <= write_data_1;
         end else if (~actual_write_enable_1 & actual_write_enable_2) begin
            int_registers[write_addr_2] <= write_data_2;
         end

         // scoreboard
         if (actual_int_scoreboard_write_enable_1 & actual_int_scoreboard_write_enable_2) begin // prioritize 2nd port
            if (int_scoreboard_write_addr_1 == int_scoreboard_write_addr_2) begin
               if (~prioritize_which_port_scoreboard) begin
                  int_scoreboard[int_scoreboard_write_addr_1] <= int_scoreboard_write_data_1;
               end else begin
                  int_scoreboard[int_scoreboard_write_addr_2] <= int_scoreboard_write_data_2;
               end
            end else begin
               int_scoreboard[int_scoreboard_write_addr_1] <= int_scoreboard_write_data_1;
               int_scoreboard[int_scoreboard_write_addr_2] <= int_scoreboard_write_data_2;
            end
         end else if (actual_int_scoreboard_write_enable_1 & ~actual_int_scoreboard_write_enable_2) begin
            int_scoreboard[int_scoreboard_write_addr_1] <= int_scoreboard_write_data_1;
         end else if (~actual_int_scoreboard_write_enable_1 & actual_int_scoreboard_write_enable_2) begin
            int_scoreboard[int_scoreboard_write_addr_2] <= int_scoreboard_write_data_2;
         end
      end
   end

// ----------------------
// ----- debug core -----
// ----------------------

   (* mark_debug="true" *) logic [31:0] stackpointer_dbg;
   (* mark_debug="true" *) logic [31:0] x5_dbg;
   (* mark_debug="true" *) logic [31:0] x6_dbg;
   (* mark_debug="true" *) logic [31:0] x7_dbg;
   (* mark_debug="true" *) logic [31:0] x10_dbg;

   assign stackpointer_dbg = int_registers[SP_REG];
   assign x5_dbg = int_registers[5];
   assign x6_dbg = int_registers[6];
   assign x7_dbg = int_registers[7];
   assign x10_dbg = int_registers[10];


endmodule

`default_nettype wire
