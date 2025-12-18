`default_nettype wire

// Floating point register files

module fp_register_file # (
   parameter REG_NUM = 32
)(
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
   
   input logic fp_scoreboard_write_enable_1,
   input logic [$clog2(REG_NUM)-1:0] fp_scoreboard_write_addr_1,
   input logic fp_scoreboard_write_data_1,

   input logic fp_scoreboard_write_enable_2,
   input logic [$clog2(REG_NUM)-1:0] fp_scoreboard_write_addr_2,
   input logic fp_scoreboard_write_data_2,

   input logic prioritize_which_port_reg,
   input logic prioritize_which_port_scoreboard,

   output logic fp_reg_busy_s1, // RAW hazard
   output logic fp_reg_busy_s2,
   output logic fp_reg_busy_rd // WAW hazard
);

// ----- declarations -----
   logic [31:0] fp_registers [REG_NUM]; // x0 ~ x31
   logic [REG_NUM-1:0] fp_scoreboard; // scoreboard for x0 ~ x31
   logic actual_write_enable_1;
   logic actual_write_enable_2;
   logic actual_fp_scoreboard_write_enable_1;
   logic actual_fp_scoreboard_write_enable_2;


// ----- read -----
   assign read_data1 = fp_registers[read_addr1];
   assign read_data2 = fp_registers[read_addr2];
   assign fp_reg_busy_s1 = fp_scoreboard[read_addr1];
   assign fp_reg_busy_s2 = fp_scoreboard[read_addr2];
   assign fp_reg_busy_rd = fp_scoreboard[fp_scoreboard_write_addr_2]; // fp_scoreboard_write_address_2 = rd[ID] (fpu destination)

// ----- write -----   
   // cannnot edit 0 reg!
   assign actual_write_enable_1 = write_enable_1;
   assign actual_write_enable_2 = write_enable_2;
   assign actual_fp_scoreboard_write_enable_1 = fp_scoreboard_write_enable_1;
   assign actual_fp_scoreboard_write_enable_2 = fp_scoreboard_write_enable_2;

   always_ff @(posedge clk) begin
      if (~rstn) begin
         for (int i = 0; i < REG_NUM; i++) begin
            fp_registers[i] <= 0;
            fp_scoreboard[i] <= 0;
         end
      end else begin
         if (actual_write_enable_1 & actual_write_enable_2) begin
            if (write_addr_1 == write_addr_2) begin
               if (~prioritize_which_port_reg) begin // prioritize 1st port
                  fp_registers[write_addr_1] <= write_data_1;
               end else begin // prioritize 2nd port
                  fp_registers[write_addr_2] <= write_data_2;
               end
            end else begin
               fp_registers[write_addr_1] <= write_data_1;
               fp_registers[write_addr_2] <= write_data_2;
            end
         end else if (actual_write_enable_1 & ~actual_write_enable_2) begin
            fp_registers[write_addr_1] <= write_data_1;
         end else if (~actual_write_enable_1 & actual_write_enable_2) begin
            fp_registers[write_addr_2] <= write_data_2;
         end

         if (actual_fp_scoreboard_write_enable_1 & actual_fp_scoreboard_write_enable_2) begin
            if (fp_scoreboard_write_addr_1 == fp_scoreboard_write_addr_2) begin
               if (~prioritize_which_port_scoreboard) begin
                  fp_scoreboard[fp_scoreboard_write_addr_1] <= fp_scoreboard_write_data_1;
               end else begin
                  fp_scoreboard[fp_scoreboard_write_addr_2] <= fp_scoreboard_write_data_2;
               end
            end else begin
               fp_scoreboard[fp_scoreboard_write_addr_1] <= fp_scoreboard_write_data_1;
               fp_scoreboard[fp_scoreboard_write_addr_2] <= fp_scoreboard_write_data_2;
            end
         end else if (actual_fp_scoreboard_write_enable_1 & ~actual_fp_scoreboard_write_enable_2) begin
            fp_scoreboard[fp_scoreboard_write_addr_1] <= fp_scoreboard_write_data_1;
         end else if (~actual_fp_scoreboard_write_enable_1 & actual_fp_scoreboard_write_enable_2) begin
            fp_scoreboard[fp_scoreboard_write_addr_2] <= fp_scoreboard_write_data_2;
         end
      end
   end

endmodule

`default_nettype wire
