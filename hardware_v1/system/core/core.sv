`default_nettype wire

// Core (in-order pipeline, non-blocking fpu)

module core #(
   parameter INIT_SP = 4096,
   parameter HEAP_START = 32'h00001000,
   parameter UART_TX_ADDR = 32'hffff0000,
   parameter REG_NUM = 32,
   parameter INVALID_PC = 32'hffff0008,
   parameter NOPE_INSTR = 0,
   parameter INSTR_SIZE_BYTES = 512,
   parameter INSTR_BRAM_SIZE_BYTES = 256,
   parameter PC_INST_FIFO_DEPTH = 3
) (
   input logic clk,
   input logic rstn,

   // to instruction memory
   output logic [31:0] PC_BRAM_output, // program counter to fetch
   output logic [31:0] PC_DDR_output, // program counter to fetch
   input logic [31:0] Instr_BRAM_input, // instruction fetched
   input logic [31:0] Instr_DDR_input, // instruction fetched

   output logic Flush_output,
   output logic [2:0] DDRValidsToIgnoreInit_output,
   output logic [2:0] BRAMValidsToIgnoreInit_output,
   input logic DataValidFromInstBRAM_input, // already ignored proper amount by system
   input logic DataValidFromInstDDR_input,   // already ignored proper amount by system
   input logic InstMemDDRBusy,
   input logic InstMemDDRBusyNow_ButFreeNextCycle,

   // to memory
   output logic MemRead_output, // lw, flw
   output logic [31:0] ReadAddr_output,
   input logic [31:0] ReadData_input,
   output logic MemWrite_output, // sw, fsw
   output logic [31:0] WriteAddr_output,
   output logic [31:0] WriteData_output,

   // to system
   input logic LWStall_input,
   input logic SWStall_input,
   input logic UARTStall_input,
   output logic HaltSignal_output, // cpu's halting signal (system keeps going),
   input logic ReadRequestOffOrderFromSystem

);

   import       types_pkg::*;

// ----- localparams -----
   localparam REG_SD_BIT_WIDTH = $clog2(REG_NUM);
   localparam OPCODE_BIT_WIDTH = 32 - 3 * REG_SD_BIT_WIDTH - 3 - 7;
   localparam STAGES           = 5; // pipeline num stages
   localparam IF_ID            = 0;
   localparam ID_EX            = 1;
   localparam EX_MEM           = 2;
   localparam MEM_WB           = 3;
   localparam IF               = IF_ID;
   localparam ID               = ID_EX;
   localparam EX               = EX_MEM;
   localparam MEM              = MEM_WB;
   localparam WB               = MEM + 1;
   localparam KEEP_EXPCETCING_PC_NEXT = 32'hbfbfbfbf;



// ----- declarations of logics -----
   // ----- start from interface(system) -----
   logic [31:0] Instr         [STAGES];
   logic InstrValid_BRAM;
   logic InstrValid_DDR;
   logic [31:0] InstrFetched_BRAM;
   logic [31:0] InstrFetched_DDR;
   logic [7:0] lb_byte;
   logic [31:0] ReadData      [STAGES];

   // ----- start from IF stage -----
   logic [31:0] RequestingPC_BRAM;
   logic [31:0] RequestingPC_DDR;
   logic [31:0] PC [STAGES];
   logic [31:0] PCPlus4 [STAGES];
   logic [31:0] PCNext [STAGES];
   logic [31:0] PCStoringIntoFIFO_BRAM;
   logic [31:0] PCStoringIntoFIFO_DDR;
   logic [31:0] ExpectingPCNext;
   logic [31:0] PC_After_PCStoringIntoFIFO;
   logic StorePC_BRAM;
   logic StorePC_DDR;
   logic StoreInstr_BRAM;
   logic StoreInstr_DDR;
   logic [31:0] StoreInstrData_BRAM;
   logic [31:0] StoreInstrData_DDR;
   logic ProceedPCInstrQueue;
   logic FlushAndStorePCAnswer_BRAM;
   logic FlushAndStorePCAnswer_DDR;
   logic [31:0] HeadPC;
   logic [31:0] HeadPCNext;
   logic [31:0] HeadPCPlus4;
   logic [31:0] HeadInstr;
   logic CanProceedPcInstrFIFO;
   logic PCFIFOFull_BRAM;
   logic PCFIFOFull_DDR;
   logic [2:0] DDRValidsToIgnoreInit;
   logic [2:0] BRAMValidsToIgnoreInit;
   logic [2:0] NumValidIncomingFromNextCycle_BRAM;
   logic [2:0] NumValidIncomingFromNextCycle_DDR;
   logic [2:0] NumValidIncomingIncludingThisCycle_BRAM;
   logic [2:0] NumValidIncomingIncludingThisCycle_DDR;
   logic ErrorInst;
   logic ExpectingPCNext_Is_To_BRAM;
   logic ExpectingPCNext_Is_To_DDR;
   logic PCAnswer_Is_To_BRAM;
   logic PCAnswer_Is_To_DDR;
   logic [31:0] PC_Into_BranchPredictor;
   logic ErrorBranchPredictor;
   logic FlushIgnoredThisCycle;
   logic FlushOnlyDDR;
   logic AlreadyPushedIntoFIFOButNeedsResending;
   logic FutureValid_DDR;
   logic [31:0] InstructionNum        [STAGES];
   logic [31:0] InstructionNumCounter;


   // ----- start from ID stage ----- 
   logic        HaltSignal            [STAGES];
   logic [2:0]  ImmSrc                [STAGES];
   logic [2:0]  ResultSrc             [STAGES];
   logic        Jump                  [STAGES];
   logic        Branch                [STAGES];
   logic        JumpStart             [STAGES];
   logic        IntRegWrite           [STAGES];
   logic        FloatRegWrite         [STAGES];
   logic [3:0]  ALUControl            [STAGES];
   logic [1:0]  ALUSrcA               [STAGES];
   logic [2:0]  ALUSrcB               [STAGES];
   logic        FPU                   [STAGES];
   logic        FToI                  [STAGES];
   logic        MemRead               [STAGES];
   logic        MemWrite              [STAGES];
   logic        MemWriteIntOrFloat    [STAGES];
   logic [REG_SD_BIT_WIDTH-1:0] rd    [STAGES];
   logic [2:0]  f3                    [STAGES];
   logic [REG_SD_BIT_WIDTH-1:0] rs1   [STAGES];
   logic [REG_SD_BIT_WIDTH-1:0] rs2   [STAGES];
   logic [31:0] IntRD1                [STAGES];
   logic [31:0] IntRD2                [STAGES];
   logic [31:0] FloatRD1              [STAGES];
   logic [31:0] FloatRD2              [STAGES];
   logic        IntRegBusyS1          [STAGES];
   logic        IntRegBusyS2          [STAGES];
   logic        IntRegBusyRD          [STAGES];
   logic        FpRegBusyS1           [STAGES];
   logic        FpRegBusyS2           [STAGES];
   logic        FpRegBusyRD           [STAGES];
   logic [31:0] ImmExt                [STAGES];
   logic        Lb                    [STAGES];
   types_pkg::inst_t InstructionType  [STAGES];

   // ----- start from EX stage -----
   logic [31:0] PCTarget      [STAGES];
   logic [31:0] PCAnswer      [STAGES];
   logic [31:0] ALUResult     [STAGES];
   logic        PCSrc         [STAGES];
   logic [31:0] SrcA          [STAGES];
   logic [31:0] SrcB          [STAGES];
   logic        Zero          [STAGES];
   logic [31:0] WriteAddr     [STAGES];
   logic BranchPredictorWrong [STAGES];

   // ----- start from MEM stage -----
   logic [31:0] ReadAddr                                    [STAGES];
   logic [31:0] WriteData                                   [STAGES];
   logic IntScoreboardWriteEnable1                          [STAGES];
   logic [REG_SD_BIT_WIDTH-1:0] IntScoreboardWriteAddress1  [STAGES];
   logic IntScoreboardWriteData1                            [STAGES];
   logic FpScoreboardWriteEnable1                           [STAGES];
   logic [REG_SD_BIT_WIDTH-1:0] FpScoreboardWriteAddress1   [STAGES];
   logic FpScoreboardWriteData1                             [STAGES];
   logic FPURegWriteInt;
   logic [REG_SD_BIT_WIDTH-1:0] FPUWriteAddressInt;
   logic [31:0] FPUWriteDataInt;
   logic FPURegWriteFp;
   logic [REG_SD_BIT_WIDTH-1:0] FPUWriteAddressFp;
   logic [31:0] FPUWriteDataFp;
   logic [31:0] FPUWriteInstNum;
   logic [1:0] LbIndex; // And read data from memory
   logic [31:0] ReadDataLatched;
 
   // ----- start from WB stage -----
   logic [31:0] Result   [STAGES];
   logic IntPrioritizeWhichPort;
   logic FloatPrioritizeWhichPort;

   // ----- start from Hazard Unit -----
   logic [1:0] ForwardAInt          [STAGES];
   logic [1:0] ForwardAFloat        [STAGES];
   logic [1:0] ForwardBInt          [STAGES];
   logic [1:0] ForwardBFloat        [STAGES];
   logic WBEXForwardAInt            [STAGES];
   logic WBEXForwardAFloat          [STAGES];
   logic WBEXForwardBInt            [STAGES];
   logic WBEXForwardBFloat          [STAGES];
   logic lwstall;
   logic swstall;
   logic registerstall;
   logic mmiostall;
   logic Stall;
   logic LwStallLatched;
   logic Flush                      [STAGES-1];
   logic DataWaitingAtEXStage;

// ----- declarations of pipeline registers -----
   // ----- start from IF stage -----
   logic [31:0] Instr_Pipe          [STAGES-1];
   logic [31:0] PC_Pipe             [STAGES-1];
   logic [31:0] PCNext_Pipe         [STAGES-1];
   logic [31:0] PCPlus4_Pipe        [STAGES-1];
   logic [31:0] InstructionNum_Pipe [STAGES-1];

   // ----- start from ID stage ----- 
   logic        Branch_Pipe                  [STAGES-1];
   logic [2:0]  f3_Pipe                      [STAGES-1];
   logic        Jump_Pipe                    [STAGES-1];
   logic        JumpStart_Pipe               [STAGES-1];
   logic [31:0] ImmExt_Pipe                  [STAGES-1];
   logic [1:0]  ALUSrcA_Pipe                 [STAGES-1];
   logic [2:0]  ALUSrcB_Pipe                 [STAGES-1];
   logic [31:0] IntRD1_Pipe                  [STAGES-1];
   logic [31:0] IntRD2_Pipe                  [STAGES-1];
   logic [31:0] FloatRD1_Pipe                [STAGES-1];
   logic [31:0] FloatRD2_Pipe                [STAGES-1];
   logic        MemWriteIntOrFloat_Pipe      [STAGES-1];
   logic        FPU_Pipe                     [STAGES-1];
   logic [3:0]  ALUControl_Pipe              [STAGES-1];
   logic [REG_SD_BIT_WIDTH-1:0] rd_Pipe      [STAGES-1];
   logic [2:0]  ResultSrc_Pipe               [STAGES-1];
   logic [REG_SD_BIT_WIDTH-1:0] rs1_Pipe     [STAGES-1];
   logic [REG_SD_BIT_WIDTH-1:0] rs2_Pipe     [STAGES-1];
   logic        IntRegWrite_Pipe             [STAGES-1];
   logic        FloatRegWrite_Pipe           [STAGES-1];
   logic        MemWrite_Pipe                [STAGES-1];
   logic        MemRead_Pipe                 [STAGES-1];
   logic        Lb_Pipe                      [STAGES-1];
   logic        HaltSignal_Pipe              [STAGES-1];
   types_pkg::inst_t InstructionType_Pipe    [STAGES-1];

   // ----- start from EX stage -----
   logic [31:0] ALUResult_Pipe      [STAGES-1];
   logic [31:0] SrcA_Pipe           [STAGES-1];
   logic [31:0] SrcB_Pipe           [STAGES-1];
   logic [31:0] ReadAddr_Pipe       [STAGES-1];
   logic [31:0] WriteAddr_Pipe      [STAGES-1];
   logic [31:0] WriteData_Pipe      [STAGES-1];


   // ----- start from MEM stage -----
   logic [31:0] ReadData_Pipe       [STAGES-1];



// ----- updating pipeline register -----

   always_ff @(posedge clk) begin
      if (~rstn) begin
         for (int i = 0; i < STAGES - 1; i++) begin
            Instr_Pipe[i]              <= NOPE_INSTR;
            Branch_Pipe[i]             <= 0;
            f3_Pipe[i]                 <= 0;
            Jump_Pipe[i]               <= 0;
            JumpStart_Pipe[i]          <= 0;
            PC_Pipe[i]                 <= INVALID_PC;
            ImmExt_Pipe[i]             <= 0;
            PCNext_Pipe[i]             <= INVALID_PC;
            ALUSrcA_Pipe[i]            <= 0;
            ALUSrcB_Pipe[i]            <= 0;
            IntRD1_Pipe[i]             <= 0;
            IntRD2_Pipe[i]             <= 0;
            FloatRD1_Pipe[i]           <= 0;
            FloatRD2_Pipe[i]           <= 0;
            ALUResult_Pipe[i]          <= 0;
            MemWriteIntOrFloat_Pipe[i] <= 0;
            FPU_Pipe[i]                <= 0;
            ALUControl_Pipe[i]         <= 0;
            SrcA_Pipe[i]               <= 0;
            SrcB_Pipe[i]               <= 0;
            rd_Pipe[i]                 <= 0;
            ResultSrc_Pipe[i]          <= 0;
            ReadData_Pipe[i]           <= 0;
            PCPlus4_Pipe[i]            <= INVALID_PC;
            rs1_Pipe[i]                <= 0;
            rs2_Pipe[i]                <= 0;
            IntRegWrite_Pipe[i]        <= 0;
            FloatRegWrite_Pipe[i]      <= 0;
            MemWrite_Pipe[i]           <= 0;
            MemRead_Pipe[i]            <= 0;
            ReadAddr_Pipe[i]           <= 0;
            WriteAddr_Pipe[i]          <= 0;
            WriteData_Pipe[i]          <= 0;
            Lb_Pipe[i]                 <= 0;
            HaltSignal_Pipe[i]         <= 0;
            InstructionType_Pipe[i]    <= NOPE;
            InstructionNum_Pipe[i]     <= 0;
         end
      end else begin
         for (int i = 0; i < STAGES - 1; i++) begin
            // ----- IF/ID -----
            if (i == IF_ID) begin
               if (~Flush[IF_ID]) begin
                  if (ProceedPCInstrQueue) begin // Stall == 0 && instr_counter >= 1

                     Instr_Pipe[IF_ID]                             <= HeadInstr;
                     PC_Pipe[IF_ID]                                <= HeadPC;
                     PCNext_Pipe[IF_ID]                            <= HeadPCNext;
                     PCPlus4_Pipe[IF_ID]                           <= HeadPCPlus4;
                     InstructionNum_Pipe[IF_ID]                    <= InstructionNum[IF];

                  end else begin // Stall == 1 || instr_counter == 0
                     if (Stall) begin

                        // IF/ID registers holds

                     end else begin // couter == 0 && Stall == 1

                        // pipeline proceeds, so need to insert bubble
                        Instr_Pipe[IF_ID]                          <= NOPE_INSTR;
                        PC_Pipe[IF_ID]                             <= INVALID_PC;
                        PCNext_Pipe[IF_ID]                         <= INVALID_PC;
                        PCPlus4_Pipe[IF_ID]                        <= INVALID_PC;
                        InstructionNum_Pipe[IF_ID]                 <= 0;

                     end

                  end
               end else begin

                  // flush
                  Instr_Pipe[IF_ID]                             <= NOPE_INSTR;
                  PC_Pipe[IF_ID]                                <= INVALID_PC;
                  PCNext_Pipe[IF_ID]                            <= INVALID_PC;
                  PCPlus4_Pipe[IF_ID]                           <= INVALID_PC;
                  InstructionNum_Pipe[IF_ID]                    <= 0;

               end
            end
            
            // ----- ID/EX -----
            // Basically, InstMemDDRBusy does not have the right to stop the pipeline.
            // Instead, they insert zero inst to the pipeline to prevent double executing
            else if (i == ID_EX) begin
               if (~Flush[ID_EX]) begin
                  if (~Stall) begin
                     Instr_Pipe[ID_EX]                                <= Instr[ID];
                     PC_Pipe[ID_EX]                                   <= PC[ID];
                     PCNext_Pipe[ID_EX]                               <= PCNext[ID];
                     PCPlus4_Pipe[ID_EX]                              <= PCPlus4[ID];
                     Branch_Pipe[ID_EX]                               <= Branch[ID];
                     f3_Pipe[ID_EX]                                   <= f3[ID];
                     Jump_Pipe[ID_EX]                                 <= Jump[ID];
                     JumpStart_Pipe[ID_EX]                            <= JumpStart[ID];
                     ImmExt_Pipe[ID_EX]                               <= ImmExt[ID];
                     ALUSrcA_Pipe[ID_EX]                              <= ALUSrcA[ID];
                     ALUSrcB_Pipe[ID_EX]                              <= ALUSrcB[ID];
                     // WB -> EX forward (Do this before WB stage's information dies)
                     if (~WBEXForwardAInt[ID]) IntRD1_Pipe[ID_EX]     <= IntRD1[ID];
                     else                     IntRD1_Pipe[ID_EX]      <= Result[WB];
                     
                     if (~WBEXForwardAFloat[ID]) FloatRD1_Pipe[ID_EX] <= FloatRD1[ID];
                     else                       FloatRD1_Pipe[ID_EX]  <= Result[WB];
                     
                     if (~WBEXForwardBInt[ID]) IntRD2_Pipe[ID_EX]     <= IntRD2[ID];
                     else                     IntRD2_Pipe[ID_EX]      <= Result[WB];
                     
                     if (~WBEXForwardBFloat[ID]) FloatRD2_Pipe[ID_EX] <= FloatRD2[ID];
                     else                       FloatRD2_Pipe[ID_EX]  <= Result[WB];

                     MemWriteIntOrFloat_Pipe[ID_EX]                   <= MemWriteIntOrFloat[ID];
                     FPU_Pipe[ID_EX]                                  <= FPU[ID];
                     ALUControl_Pipe[ID_EX]                           <= ALUControl[ID];
                     rd_Pipe[ID_EX]                                   <= rd[ID];
                     ResultSrc_Pipe[ID_EX]                            <= ResultSrc[ID];
                     rs1_Pipe[ID_EX]                                  <= rs1[ID];
                     rs2_Pipe[ID_EX]                                  <= rs2[ID];
                     IntRegWrite_Pipe[ID_EX]                          <= IntRegWrite[ID];
                     FloatRegWrite_Pipe[ID_EX]                        <= FloatRegWrite[ID];
                     MemWrite_Pipe[ID_EX]                             <= MemWrite[ID];
                     MemRead_Pipe[ID_EX]                              <= MemRead[ID];
                     Lb_Pipe[ID_EX]                                   <= Lb[ID];
                     HaltSignal_Pipe[ID_EX]                           <= HaltSignal[ID];
                     InstructionType_Pipe[ID_EX]                      <= InstructionType[ID];
                     InstructionNum_Pipe[ID_EX]                       <= InstructionNum[ID];
                  end else begin 
                     // Stall -> ID/EX pipeline reg holds
                     // should stop sending double FPU requests (decrease stalls)
                     // FPU already accepted the previous cycle request
                     // FPU stalls occur by registerstall, so no need to care about FPU handshake here
                     // when EX stage is waiting for MEM stage reading, keep FPU on (when obtained, we need to put the FPU into fpu_start)
                     if (~DataWaitingAtEXStage) begin
                        FPU_Pipe[ID_EX] <= 0;
                     end
                  end
               end else begin // flush
                  if (~Stall) begin
                     Instr_Pipe[ID_EX]                                <= NOPE_INSTR;
                     PC_Pipe[ID_EX]                                   <= INVALID_PC;
                     PCNext_Pipe[ID_EX]                               <= INVALID_PC;
                     PCPlus4_Pipe[ID_EX]                              <= INVALID_PC;
                     Branch_Pipe[ID_EX]                               <= 0;
                     f3_Pipe[ID_EX]                                   <= 0;
                     Jump_Pipe[ID_EX]                                 <= 0;
                     JumpStart_Pipe[ID_EX]                            <= 0;
                     ImmExt_Pipe[ID_EX]                               <= 0;
                     ALUSrcA_Pipe[ID_EX]                              <= 0;
                     ALUSrcB_Pipe[ID_EX]                              <= 0;
                     IntRD1_Pipe[ID_EX]                               <= 0;
                     IntRD2_Pipe[ID_EX]                               <= 0;
                     FloatRD1_Pipe[ID_EX]                             <= 0;
                     FloatRD2_Pipe[ID_EX]                             <= 0;
                     MemWriteIntOrFloat_Pipe[ID_EX]                   <= 0;
                     FPU_Pipe[ID_EX]                                  <= 0;
                     ALUControl_Pipe[ID_EX]                           <= 0;
                     rd_Pipe[ID_EX]                                   <= 0;
                     ResultSrc_Pipe[ID_EX]                            <= 0;
                     IntRegWrite_Pipe[ID_EX]                          <= 0;
                     FloatRegWrite_Pipe[ID_EX]                        <= 0;
                     MemWrite_Pipe[ID_EX]                             <= 0;
                     MemRead_Pipe[ID_EX]                              <= 0;
                     Lb_Pipe[ID_EX]                                   <= 0; 
                     HaltSignal_Pipe[ID_EX]                           <= 0; 
                     InstructionType_Pipe[ID_EX]                      <= NOPE;
                     InstructionNum_Pipe[ID_EX]                       <= 0;
                  end else begin
                     if (~DataWaitingAtEXStage) begin
                        FPU_Pipe[ID_EX] <= 0;
                     end
                  end
               end
            end
            // ----- EX/MEM, MEM/WB -----
            else begin //  no flushes
               if (~Stall) begin
                  Instr_Pipe[i]                                       <= Instr[i];
                  PC_Pipe[i]                                          <= PC[i];
                  PCPlus4_Pipe[i]                                     <= PCPlus4[i];
                  ALUResult_Pipe[i]                                   <= ALUResult[i];
                  FPU_Pipe[i]                                         <= FPU[i];
                  rd_Pipe[i]                                          <= rd[i];
                  ResultSrc_Pipe[i]                                   <= ResultSrc[i];
                  ImmExt_Pipe[i]                                      <= ImmExt[i];
                  IntRegWrite_Pipe[i]                                 <= IntRegWrite[i];
                  FloatRegWrite_Pipe[i]                               <= FloatRegWrite[i];
                  MemRead_Pipe[i]                                     <= MemRead[i];
                  MemWrite_Pipe[i]                                    <= MemWrite[i];
                  ReadAddr_Pipe[i]                                    <= ReadAddr[i];
                  WriteAddr_Pipe[i]                                   <= WriteAddr[i];
                  WriteData_Pipe[i]                                   <= WriteData[i];
                  Lb_Pipe[i]                                          <= Lb[i];
                  HaltSignal_Pipe[i]                                  <= HaltSignal[i];
                  InstructionType_Pipe[i]                             <= InstructionType[i];
                  InstructionNum_Pipe[i]                              <= InstructionNum[i];
                  
                  // !! ReadData is only available for 1 cycle after it's obtained !!
                  if (i == MEM_WB) begin
                     if (LwStallLatched) begin // back from lw stall -> ReadData has valid data
                        ReadData_Pipe[i] <= ReadData[MEM];
                     end else begin
                        ReadData_Pipe[i] <= ReadDataLatched;
                     end
                  end

               end else begin
                  // Stall = lwstall | swstall | registerstall | mmiostall

                  if (i == EX_MEM) begin
                     // must not send MMIO double requests (EX/MEM pipeline register)
                     // should not send MemRead, MemWrite double requests (even when cache hit, stalls 1 cycle)
                     if (~mmiostall & ~swstall) begin
                        MemWrite_Pipe[EX_MEM] <= 0;
                        WriteData_Pipe[EX_MEM] <= 0;
                     end // if mmiostall or swstall, keep the write enable on until stall stops (= req_ready && write_enable)

                     if (~lwstall) begin
                        if (~swstall & ~mmiostall) begin
                           MemRead_Pipe[EX_MEM] <= 0;
                           ReadAddr_Pipe[EX_MEM] <= 0;
                        end
                     end else begin // if lwstall, keep the read enable on until signal from system comes (= read_ready && req_ready)
                        if (ReadRequestOffOrderFromSystem) begin
                           MemRead_Pipe[EX_MEM] <= 0;
                           ReadAddr_Pipe[EX_MEM] <= 0;
                        end
                     end
                  end

                  if (i == MEM_WB) begin
                     if (IntRegWrite[WB] & FPURegWriteInt & ~IntPrioritizeWhichPort) begin
                        // prioritize FPU reg write!
                        IntRegWrite_Pipe[MEM_WB] <= 0;
                     end else if (FloatRegWrite[WB] & FPURegWriteFp & ~FloatPrioritizeWhichPort) begin
                        // prioritize FPU reg write!
                        FloatRegWrite_Pipe[MEM_WB] <= 0;
                     end
                  end
               end
            end
         end
      end
   end



// ----- interface signals -----
   assign PC_BRAM_output      = RequestingPC_BRAM; // PC to fetch
   assign PC_DDR_output       = RequestingPC_DDR; // PC to fetch
   assign InstrFetched_BRAM   = Instr_BRAM_input;
   assign InstrFetched_DDR    = Instr_DDR_input;
   assign InstrValid_BRAM     = DataValidFromInstBRAM_input;
   assign InstrValid_DDR      = DataValidFromInstDDR_input;
   assign MemRead_output      = MemRead[MEM];
   assign ReadAddr_output     = ReadAddr[MEM];
   assign lb_byte             = ReadData_input[8*LbIndex +: 8];
   assign ReadData[MEM]       = ~Lb[MEM] ? ReadData_input : {{24{1'b0}}, lb_byte}; // unsigned load byte
   assign MemWrite_output     = MemWrite[MEM];
   assign WriteAddr_output    = WriteAddr[MEM];
   assign WriteData_output    = WriteData[MEM];
   assign HaltSignal_output   = HaltSignal[WB];
   assign lwstall             = LWStall_input;     // lw stall (Memory deals with RAW hazard. Thanks!)
   assign swstall             = SWStall_input;     // sw stall
   assign mmiostall           = UARTStall_input;  // mmio stall
   assign Stall               = lwstall | swstall | mmiostall | registerstall;
   assign Flush_output        = Flush[ID];
   assign DDRValidsToIgnoreInit_output = DDRValidsToIgnoreInit;
   assign BRAMValidsToIgnoreInit_output = BRAMValidsToIgnoreInit;


// ------------------------------ 1. Instruction Fetch (IF stage) ------------------------------

// ----- related to stall (other stages) -----
   // FIFO proceeding
   always_comb begin
      ProceedPCInstrQueue = 0;
      if (~BranchPredictorWrong[EX]) begin
         if (~CanProceedPcInstrFIFO | Stall) begin
            ProceedPCInstrQueue = 0; 
         end else begin
            ProceedPCInstrQueue = 1;
         end
      end
   end

// ----- no relation to stall -----
// ----- placing modules -----
// ----- branch predictor -----
   always_comb begin
      PC_Into_BranchPredictor = INVALID_PC;
      ErrorBranchPredictor = 0;

      if (BranchPredictorWrong[EX]) begin
         PC_Into_BranchPredictor = PCAnswer[EX];
      end else begin
         if ((PCStoringIntoFIFO_BRAM != INVALID_PC) & (PCStoringIntoFIFO_DDR != INVALID_PC)) begin
            ErrorBranchPredictor = 1;
         end else if (PCStoringIntoFIFO_BRAM != INVALID_PC) begin
            PC_Into_BranchPredictor = PCStoringIntoFIFO_BRAM;
         end else if (PCStoringIntoFIFO_DDR != INVALID_PC) begin
            PC_Into_BranchPredictor = PCStoringIntoFIFO_DDR;
         end
      end
   end

   // ----- Branch prediction -----
   branch_predictor #(
      .INVALID_PC (INVALID_PC)
   ) branch_predictor (
      .clk (clk),
      .rstn (rstn),

      // input
      .PC (PC_Into_BranchPredictor), // 100% next cycle PC
      .update (BranchPredictorWrong[EX]), // train whenever branchpredictor made mistakes
      .wrong_PC (PCNext[EX]),
      .update_taken (PCSrc[EX]), // answer of taken or untaken
      .update_PC (PCAnswer[EX]), // answer of PC

      // output
      .Next_PC (PC_After_PCStoringIntoFIFO) // combinational
   );

// ----- pc instr fifo -----
   // --- PC & Instr FIFO ---
   pc_instr_fifo #(
      .fifo_depth (PC_INST_FIFO_DEPTH),
      .INVALID_PC (INVALID_PC),
      .NOPE_INSTR (NOPE_INSTR)
   ) pc_instr_fifo (
      .clk (clk),
      .rstn (rstn),

      // input
      .store_pc_data_bram (PCStoringIntoFIFO_BRAM),
      .store_pc_data_ddr (PCStoringIntoFIFO_DDR),
      .store_pcnext_data_bram (PC_After_PCStoringIntoFIFO),
      .store_pcnext_data_ddr (PC_After_PCStoringIntoFIFO),
      .store_pcplus4_data_bram (PCStoringIntoFIFO_BRAM + 4),
      .store_pcplus4_data_ddr (PCStoringIntoFIFO_DDR + 4),
      .store_instr_data_bram (StoreInstrData_BRAM),
      .store_instr_data_ddr (StoreInstrData_DDR),
      .store_pc_bram (StorePC_BRAM),
      .store_pc_ddr (StorePC_DDR),
      .store_instr_bram (StoreInstr_BRAM),
      .store_instr_ddr (StoreInstr_DDR),
      .proceed (ProceedPCInstrQueue),
      .flush_and_store_pcanswer_into_head_bram (FlushAndStorePCAnswer_BRAM),
      .flush_and_store_pcanswer_into_head_ddr (FlushAndStorePCAnswer_DDR),
      .flush_only_ddr (FlushOnlyDDR),
      // output
      .head_pc (HeadPC),
      .head_pcnext (HeadPCNext),
      .head_pcplus4 (HeadPCPlus4),
      .head_instr (HeadInstr),
      .pc_fifo_full_bram (PCFIFOFull_BRAM),
      .pc_fifo_full_ddr (PCFIFOFull_DDR),
      .can_proceed_pc_instr_fifo (CanProceedPcInstrFIFO)
      
   );

// ----- Storing Instruction -----
   
   always_comb begin
      StoreInstr_BRAM = 0;
      StoreInstr_DDR = 0;
      StoreInstrData_BRAM = NOPE_INSTR;
      StoreInstrData_DDR = NOPE_INSTR;

      if (~BranchPredictorWrong[EX]) begin
         StoreInstr_BRAM = InstrValid_BRAM;
         StoreInstr_DDR = InstrValid_DDR;
         StoreInstrData_BRAM = InstrFetched_BRAM;
         StoreInstrData_DDR = InstrFetched_DDR;
      end
   end

// ----- Requesting PC to instruction memory -----

   always_ff @(posedge clk) begin
      if (~rstn) begin
         RequestingPC_BRAM <= INVALID_PC; // direct into PC_output (inst mem req)
         RequestingPC_DDR <= INVALID_PC;
      end else begin
         // 命令メモリがreadyなとき以外はPCStoringIntoFIFOはInvalidにする。readyなときはvalidな値が入ってくる。
         RequestingPC_BRAM <= PCStoringIntoFIFO_BRAM;
         RequestingPC_DDR <= PCStoringIntoFIFO_DDR;
      end
   end

// ----- Storing PC into FIFO -----
   
   always_comb begin // 注意：always_combは手続き的代入が書けることに注意。ブロッキング代入は、実行の度に上から順に実行されることに注意！回路的には配線の途中途中でmuxが入っているイメージ。
                     // 関係している信号が少しでも値が変わればalways_combブロックがすべて実行しなおされる。回路的にも自然。

      // when sending invalid pc, ExpectingPC holds.
      ErrorInst = 0;
      FlushAndStorePCAnswer_BRAM = 0;
      FlushAndStorePCAnswer_DDR = 0;
      FlushIgnoredThisCycle = 0;
      PCStoringIntoFIFO_BRAM = INVALID_PC;
      PCStoringIntoFIFO_DDR = INVALID_PC;
      StorePC_BRAM = 0;
      StorePC_DDR = 0;
      FlushOnlyDDR = 0;
      FutureValid_DDR = 0;


      // !!!! DDR Busy !!!!
      if (InstMemDDRBusy) begin // PC_DDR_output = RequestingPC_DDR this cycle is being ignored now!

         if (InstMemDDRBusyNow_ButFreeNextCycle) begin // accept next cycle request

            if (BranchPredictorWrong[EX]) begin
               if (PCAnswer_Is_To_BRAM) begin
                  PCStoringIntoFIFO_BRAM = PCAnswer[EX]; // DDRからのvalidはシステム側で無視するので、BRAMへバンバン送ってよい！
                  FlushAndStorePCAnswer_BRAM = 1;
               end else if (PCAnswer_Is_To_DDR) begin
                  PCStoringIntoFIFO_DDR = PCAnswer[EX];
                  FlushAndStorePCAnswer_DDR = 1;
               end else begin
                  ErrorInst = 1;
               end
               FutureValid_DDR = StorePC_DDR;
            end else begin
               // no one is being skipped
               if (ExpectingPCNext_Is_To_BRAM) begin
                  if (~PCFIFOFull_BRAM) begin
                     PCStoringIntoFIFO_BRAM = ExpectingPCNext; // ちゃんとDDRがreadyな状態でならBRAMに要求してよい
                     StorePC_BRAM = 1;
                  end
                  FutureValid_DDR = StorePC_DDR;
               end else if (ExpectingPCNext_Is_To_DDR) begin
                  if (~AlreadyPushedIntoFIFOButNeedsResending) begin
                     if (~PCFIFOFull_DDR) begin
                        PCStoringIntoFIFO_DDR = ExpectingPCNext; // most usual case
                        StorePC_DDR = 1;
                     end
                     FutureValid_DDR = StorePC_DDR;
                  end else begin
                     PCStoringIntoFIFO_DDR = ExpectingPCNext; // 再送なので、あらたにFIFOにpushはしない
                     StorePC_DDR = 0;
                     FutureValid_DDR = 1;
                  end
               end else begin
                  ErrorInst = 1;
               end
            end

         end else begin // also next cycle is being ignored

            // sending invalid pc unless PCAnswer is to BRAM
            if (BranchPredictorWrong[EX]) begin
               if (PCAnswer_Is_To_BRAM) begin
                  PCStoringIntoFIFO_BRAM = PCAnswer[EX];
                  FlushAndStorePCAnswer_BRAM = 1;
               end else if (PCAnswer_Is_To_DDR) begin
                  FlushIgnoredThisCycle = 1;
                  FlushOnlyDDR = 1;
               end else begin
                  ErrorInst = 1;
               end
            end
            FutureValid_DDR = StorePC_DDR;

         end

      // !!!! DDR Free !!!!
      end else begin 
         // DDR accept this cycle request!
         // How about next cycle? -> assume it they accept, but if they don't, the case above(somenone skipping exists) deals with it
         
         if (BranchPredictorWrong[EX]) begin
            if (PCAnswer_Is_To_DDR) begin
               PCStoringIntoFIFO_DDR = PCAnswer[EX];
               FlushAndStorePCAnswer_DDR = 1;
            end else if (PCAnswer_Is_To_BRAM) begin
               PCStoringIntoFIFO_BRAM = PCAnswer[EX]; // DDRからのvalidはシステム側で無視するので、BRAMへバンバン送ってよい！
               FlushAndStorePCAnswer_BRAM = 1;
            end else begin
               ErrorInst = 1;
            end
            FutureValid_DDR = StorePC_DDR;
         end else begin
            if (ExpectingPCNext_Is_To_BRAM) begin
               if (~PCFIFOFull_BRAM) begin
                  PCStoringIntoFIFO_BRAM = ExpectingPCNext; // most usual case
                  StorePC_BRAM = 1;
               end
               FutureValid_DDR = StorePC_DDR;
            end else if (ExpectingPCNext_Is_To_DDR) begin
               if (~AlreadyPushedIntoFIFOButNeedsResending) begin
                  if (~PCFIFOFull_DDR) begin
                     PCStoringIntoFIFO_DDR = ExpectingPCNext; // most usual case
                     StorePC_DDR = 1;
                  end
                  FutureValid_DDR = StorePC_DDR;
               end else begin
                  PCStoringIntoFIFO_DDR = ExpectingPCNext; // 再送なので、あらたにFIFOにpushはしない
                  StorePC_DDR = 0;
                  FutureValid_DDR = 1;
               end
            end else begin
               ErrorInst = 1;
            end
         end
      end

   end

// ----- Expecting Next PC -----
   // holds when PCStoring is both invalid.
   always_ff @(posedge clk) begin
      if (~rstn) begin
         ExpectingPCNext <= 0; // latching the prediction to the next cycle. Start from 0.
      end else begin
         if (BranchPredictorWrong[EX]) begin
            if (FlushIgnoredThisCycle) begin
               ExpectingPCNext <= PCAnswer[EX];
            end else begin
               // my expectation was wrong. update it to the expectation to PCAnswer.
               ExpectingPCNext <= PC_After_PCStoringIntoFIFO; 
            end
         end else begin
            // ExpectingPCNext is NOT CONSUMED (not put in fifo)!
            if ((PCStoringIntoFIFO_BRAM != ExpectingPCNext) & (PCStoringIntoFIFO_DDR != ExpectingPCNext)) begin
               if (InstMemDDRBusy & (RequestingPC_DDR != INVALID_PC)) begin // そもそも前のPCが受け取られていない->Expectingを普通に更新すると意味をなさなくなるので、その値自体を保持する（"次のPC"）
                  // ExpectingPC holds the "being ignored" PC
                  ExpectingPCNext <= RequestingPC_DDR;
               end else begin
                  // hold
                  ExpectingPCNext <= ExpectingPCNext;
               end
            end else begin // PCStoringIntoFIFO == ExpectingPCNext
               // My expectation is now in fifo.
               ExpectingPCNext <= PC_After_PCStoringIntoFIFO;
            end
         end
      end
   end

// ----- Dealing with the Quickly pushed instruction -----
   always_ff @(posedge clk) begin
      if (~rstn) begin
         AlreadyPushedIntoFIFOButNeedsResending <= 0;
      end else begin

         if (BranchPredictorWrong[EX]) begin
            AlreadyPushedIntoFIFOButNeedsResending <= 0;
         end else begin
            
            if (InstMemDDRBusy & (RequestingPC_DDR != INVALID_PC)) begin // someone being skipped!
               AlreadyPushedIntoFIFOButNeedsResending <= 1;
            end else begin
               if ((InstMemDDRBusyNow_ButFreeNextCycle | ~InstMemDDRBusy) & ExpectingPCNext_Is_To_DDR & AlreadyPushedIntoFIFOButNeedsResending) begin // ここで再送を行う
                  AlreadyPushedIntoFIFOButNeedsResending <= 0;
               end // else -> holds
            end

         end

      end
   end
   
// ----- instruction ignoring -----
   assign NumValidIncomingFromNextCycle_DDR = NumValidIncomingIncludingThisCycle_DDR - DataValidFromInstDDR_input;
   assign NumValidIncomingFromNextCycle_BRAM = NumValidIncomingIncludingThisCycle_BRAM - DataValidFromInstBRAM_input;
   // #valids counting up
   always_ff @(posedge clk) begin
      if (~rstn) begin

         NumValidIncomingIncludingThisCycle_DDR <= 0;
         NumValidIncomingIncludingThisCycle_BRAM <= 0;

      end else begin

         // #valids coming in the future (from Flush to Flush)
         if (BranchPredictorWrong[EX]) begin

            if (PCAnswer_Is_To_BRAM) begin
               NumValidIncomingIncludingThisCycle_DDR <= 0; // accumulate new #valids until next flush
               NumValidIncomingIncludingThisCycle_BRAM <= 1;
            end else if (PCAnswer_Is_To_DDR) begin
               if (InstMemDDRBusy & ~InstMemDDRBusyNow_ButFreeNextCycle) begin
                  if (RequestingPC_DDR != INVALID_PC) begin // someone being skipped!
                     NumValidIncomingIncludingThisCycle_DDR <= 0; // accumulate new #valids until next flush
                     NumValidIncomingIncludingThisCycle_BRAM <= 0;                     
                  end else begin // no one being skipped!
                     NumValidIncomingIncludingThisCycle_DDR <= 0; // accumulate new #valids until next flush
                     NumValidIncomingIncludingThisCycle_BRAM <= 0;
                  end
               end else begin
                  NumValidIncomingIncludingThisCycle_DDR <= 1; // accumulate new #valids until next flush
                  NumValidIncomingIncludingThisCycle_BRAM <= 0;
               end
            end

         end else begin
            
            if (InstMemDDRBusy & (RequestingPC_DDR != INVALID_PC)) begin // someone being skipped!
               if (InstMemDDRBusyNow_ButFreeNextCycle) begin
                  NumValidIncomingIncludingThisCycle_DDR <= NumValidIncomingIncludingThisCycle_DDR + FutureValid_DDR - DataValidFromInstDDR_input;
                  NumValidIncomingIncludingThisCycle_BRAM <= NumValidIncomingIncludingThisCycle_BRAM + StorePC_BRAM - DataValidFromInstBRAM_input;
               end else begin
                  NumValidIncomingIncludingThisCycle_DDR <= NumValidIncomingIncludingThisCycle_DDR + FutureValid_DDR - DataValidFromInstDDR_input - 1;
                  NumValidIncomingIncludingThisCycle_BRAM <= NumValidIncomingIncludingThisCycle_BRAM + StorePC_BRAM - DataValidFromInstBRAM_input;
               end
            end else begin
               NumValidIncomingIncludingThisCycle_DDR <= NumValidIncomingIncludingThisCycle_DDR + FutureValid_DDR - DataValidFromInstDDR_input;
               NumValidIncomingIncludingThisCycle_BRAM <= NumValidIncomingIncludingThisCycle_BRAM + StorePC_BRAM - DataValidFromInstBRAM_input;
            end

         end

      end
   end

   // #ignores init (system obtain this #ignores(counts up) when flushing detected and start ignoring the accumulated amount)
   always_comb begin

      DDRValidsToIgnoreInit = 0;
      BRAMValidsToIgnoreInit = 0;

      if (BranchPredictorWrong[EX]) begin
         if (InstMemDDRBusy & (RequestingPC_DDR != INVALID_PC)) begin // someone being skipped -> unnecessary NumValidIncomingFromNextCycle
            DDRValidsToIgnoreInit = NumValidIncomingFromNextCycle_DDR - 1;
            BRAMValidsToIgnoreInit = NumValidIncomingFromNextCycle_BRAM;
         end else begin
            DDRValidsToIgnoreInit = NumValidIncomingFromNextCycle_DDR;
            BRAMValidsToIgnoreInit = NumValidIncomingFromNextCycle_BRAM;
         end
      end
      
   end

   // --- helper signals ---
   assign ExpectingPCNext_Is_To_DDR = (ExpectingPCNext >= INSTR_BRAM_SIZE_BYTES) & (ExpectingPCNext < INSTR_SIZE_BYTES) & (ExpectingPCNext != INVALID_PC);
   assign ExpectingPCNext_Is_To_BRAM = (ExpectingPCNext < INSTR_BRAM_SIZE_BYTES) & (ExpectingPCNext != INVALID_PC);
   assign PCAnswer_Is_To_DDR = (PCAnswer[EX] >= INSTR_BRAM_SIZE_BYTES) & (PCAnswer[EX] < INSTR_SIZE_BYTES) & (PCAnswer[EX] != INVALID_PC);
   assign PCAnswer_Is_To_BRAM = (PCAnswer[EX] < INSTR_BRAM_SIZE_BYTES) & (PCAnswer[EX] != INVALID_PC);

// ----- instruction counting -----

   always_ff @(posedge clk) begin
      if (~rstn) begin
         InstructionNumCounter <= 0;
      end else begin
         if (ProceedPCInstrQueue) begin
            InstructionNumCounter <= InstructionNumCounter + 1;
         end
      end
   end

   assign InstructionNum[IF] = InstructionNumCounter;

// ----------------------------- 2. Instruction Decode & Register Fetch (ID stage) -----------------------------

   // drive from pipeline registers
   assign Instr[ID] = Instr_Pipe[IF_ID];
   assign PC[ID] = PC_Pipe[IF_ID];
   assign PCNext[ID] = PCNext_Pipe[IF_ID];
   assign PCPlus4[ID] = PCPlus4_Pipe[IF_ID];
   assign InstructionNum[ID] = InstructionNum_Pipe[IF_ID];

   // decode
   decoder # (
      .REG_NUM (REG_NUM),
      .NOPE_INSTR (NOPE_INSTR)
   ) decoder (
      // input
      .Instr (Instr[ID]),

      //output
      .HaltSignal (HaltSignal[ID]),

      .ImmSrc (ImmSrc[ID]),
      .ResultSrc (ResultSrc[ID]),
      .Jump (Jump[ID]),
      .Branch (Branch[ID]),
      .JumpStart (JumpStart[ID]),
      .Lb (Lb[ID]),
      .InstructionType (InstructionType[ID]),
      
      .IntRegWrite (IntRegWrite[ID]),
      .FloatRegWrite (FloatRegWrite[ID]),

      .ALUControl (ALUControl[ID]),
      .ALUSrcA (ALUSrcA[ID]),
      .ALUSrcB (ALUSrcB[ID]),
      .FPU (FPU[ID]),
      .FToI (FToI[ID]),

      .MemRead (MemRead[ID]),
      .MemWrite (MemWrite[ID]),
      .MemWriteIntOrFloat (MemWriteIntOrFloat[ID])

   );

   // register fetch
   assign rd[ID]  = Instr[ID][OPCODE_BIT_WIDTH+REG_SD_BIT_WIDTH-1:OPCODE_BIT_WIDTH];
   assign f3[ID]  = Instr[ID][OPCODE_BIT_WIDTH+REG_SD_BIT_WIDTH+2:OPCODE_BIT_WIDTH+REG_SD_BIT_WIDTH];
   assign rs1[ID] = Instr[ID][OPCODE_BIT_WIDTH+2*REG_SD_BIT_WIDTH+2:OPCODE_BIT_WIDTH+REG_SD_BIT_WIDTH+3];
   assign rs2[ID] = Instr[ID][OPCODE_BIT_WIDTH+3*REG_SD_BIT_WIDTH+2:OPCODE_BIT_WIDTH+2*REG_SD_BIT_WIDTH+3];
   
   int_register_file # (
      .INIT_SP(INIT_SP),
      .UART_TX_ADDR (UART_TX_ADDR),
      .HEAP_START(HEAP_START),
      .REG_NUM (REG_NUM)
   ) int_register_file (
      // inputs
      .clk (clk),
      .rstn (rstn),

      .read_addr1 (rs1[ID]),
      .read_addr2 (rs2[ID]),

      .write_enable_1 (FPURegWriteInt),
      .write_addr_1 (FPUWriteAddressInt),
      .write_data_1 (FPUWriteDataInt),
   
      .write_enable_2 (IntRegWrite[WB]), // prioritize
      .write_addr_2 (rd[WB]),
      .write_data_2 (Result[WB]),

      // register reservation
      .int_scoreboard_write_enable_1 (IntScoreboardWriteEnable1[EX]),
      .int_scoreboard_write_data_1 (IntScoreboardWriteData1[EX]),
      .int_scoreboard_write_addr_1 (IntScoreboardWriteAddress1[EX]),

      .int_scoreboard_write_enable_2 (FToI[ID] & ~Flush[ID] & ~IntRegBusyRD[ID] & ~Stall), // busy flag should be asserted at ID stage (when flush occurs, instruction at ID stage is invalid, so they can't reserve reg!)
      .int_scoreboard_write_data_2 (1'b1),
      .int_scoreboard_write_addr_2 (rd[ID]),

      .prioritize_which_port_reg (IntPrioritizeWhichPort),
      .prioritize_which_port_scoreboard (1'b1),

      // outputs
      .read_data1 (IntRD1[ID]),
      .read_data2 (IntRD2[ID]),

      .int_reg_busy_s1 (IntRegBusyS1[ID]),
      .int_reg_busy_s2 (IntRegBusyS2[ID]),
      .int_reg_busy_rd (IntRegBusyRD[ID])
   );

   fp_register_file #(
      .REG_NUM (REG_NUM)
   ) fp_register_file (
      // inputs
      .clk (clk),
      .rstn (rstn),

      .read_addr1 (rs1[ID]),
      .read_addr2 (rs2[ID]),

      .write_enable_1 (FPURegWriteFp),
      .write_addr_1 (FPUWriteAddressFp),
      .write_data_1 (FPUWriteDataFp),

      .write_enable_2 (FloatRegWrite[WB]), // prirotize
      .write_addr_2 (rd[WB]),
      .write_data_2 (Result[WB]),

      // register reservation
      .fp_scoreboard_write_enable_1 (FpScoreboardWriteEnable1[EX]),
      .fp_scoreboard_write_data_1 (FpScoreboardWriteData1[EX]),
      .fp_scoreboard_write_addr_1 (FpScoreboardWriteAddress1[EX]),

      .fp_scoreboard_write_enable_2 (FPU[ID] & ~FToI[ID] & ~Flush[ID] & ~FpRegBusyRD[ID] & ~Stall), // Busy flag (does not write when reg is already busy **until pipeline proceeds**! Also does not write when it's flushing cycle)
      .fp_scoreboard_write_data_2 (1'b1),
      .fp_scoreboard_write_addr_2 (rd[ID]),
   
      .prioritize_which_port_reg (FloatPrioritizeWhichPort),
      .prioritize_which_port_scoreboard (1'b1),

      // outputs
      .read_data1 (FloatRD1[ID]),
      .read_data2 (FloatRD2[ID]),

      .fp_reg_busy_s1 (FpRegBusyS1[ID]),
      .fp_reg_busy_s2 (FpRegBusyS2[ID]),
      .fp_reg_busy_rd (FpRegBusyRD[ID])
   );

   // immediate extension
   always_comb begin
      ImmExt[ID] = 0;
      case (ImmSrc[ID]) // Immdiate form
         0: ImmExt[ID] = {{20{Instr[ID][31]}}, Instr[ID][31:20]};                                        // I type (extended immediate)
         1: ImmExt[ID] = {{20{Instr[ID][31]}}, Instr[ID][31:25], Instr[ID][11:7]};                       // S type
         2: ImmExt[ID] = {{20{Instr[ID][31]}}, Instr[ID][7], Instr[ID][30:25], Instr[ID][11:8], 1'b0};   // B type
         3: ImmExt[ID] = {{12{Instr[ID][31]}}, Instr[ID][19:12], Instr[ID][20], Instr[ID][30:21], 1'b0}; // J type
         4: ImmExt[ID] = {Instr[ID][31:12], 12'b0};                                                      // for lui
         5: ImmExt[ID] = {20'b0, Instr[ID][31:20]};                                                      // logical instruction
      endcase
   end



// ---------------------------- 3. Execute (EX stage) ----------------------------
   // drive from pipeline registers
   assign Instr[EX]              = Instr_Pipe[ID_EX];
   assign Branch[EX]             = Branch_Pipe[ID_EX];
   assign f3[EX]                 = f3_Pipe[ID_EX];
   assign Jump[EX]               = Jump_Pipe[ID_EX];
   assign JumpStart[EX]          = JumpStart_Pipe[ID_EX];
   assign PC[EX]                 = PC_Pipe[ID_EX];
   assign ImmExt[EX]             = ImmExt_Pipe[ID_EX];
   assign PCNext[EX]             = PCNext_Pipe[ID_EX];
   assign PCPlus4[EX]            = PCPlus4_Pipe[ID_EX];
   assign ALUSrcA[EX]            = ALUSrcA_Pipe[ID_EX];
   assign ALUSrcB[EX]            = ALUSrcB_Pipe[ID_EX];
   assign IntRD1[EX]             = IntRD1_Pipe[ID_EX];
   assign IntRD2[EX]             = IntRD2_Pipe[ID_EX];
   assign FloatRD1[EX]           = FloatRD1_Pipe[ID_EX];
   assign FloatRD2[EX]           = FloatRD2_Pipe[ID_EX];
   assign MemWriteIntOrFloat[EX] = MemWriteIntOrFloat_Pipe[ID_EX];
   assign FPU[EX]                = FPU_Pipe[ID_EX];
   assign ALUControl[EX]         = ALUControl_Pipe[ID_EX];
   assign rd[EX]                 = rd_Pipe[ID_EX];
   assign ResultSrc[EX]          = ResultSrc_Pipe[ID_EX];
   assign rs1[EX]                = rs1_Pipe[ID_EX];
   assign rs2[EX]                = rs2_Pipe[ID_EX];
   assign IntRegWrite[EX]        = IntRegWrite_Pipe[ID_EX];
   assign FloatRegWrite[EX]      = FloatRegWrite_Pipe[ID_EX];
   assign MemRead[EX]            = MemRead_Pipe[ID_EX];
   assign MemWrite[EX]           = MemWrite_Pipe[ID_EX];
   assign Lb[EX]                 = Lb_Pipe[ID_EX];
   assign HaltSignal[EX]         = HaltSignal_Pipe[ID_EX];
   assign InstructionType[EX]    = InstructionType_Pipe[ID_EX];
   assign InstructionNum[EX]     = InstructionNum_Pipe[ID_EX];

   // branch
   always_comb begin
      if (Branch[EX]) begin
         case (f3[EX])
            0: begin // beq
               PCSrc[EX] = Jump[EX] | Zero[EX];
            end
            1: begin // bne
               PCSrc[EX] = Jump[EX] | ~Zero[EX];
            end
            4: begin // blt
               PCSrc[EX] = Jump[EX] | ~Zero[EX];
            end
            5: begin // bge
               PCSrc[EX] = Jump[EX] | Zero[EX];
            end
            6: begin // bltu
               PCSrc[EX] = Jump[EX] | ~Zero[EX];
            end
            7: begin // bgeu
               PCSrc[EX] = Jump[EX] | Zero[EX];
            end
         endcase
      end else begin
         PCSrc[EX] = Jump[EX];
      end
   end

   always_comb begin
      case (JumpStart[EX])
         0: PCTarget[EX] = PC[EX] + ImmExt[EX]; // jal
         1: PCTarget[EX] = SrcA[EX] + ImmExt[EX]; // jalr
      endcase
   end

   // the answer to the branch predictor
   // must be 0 when reset or flush occured!
   always_comb begin 
      case (PCSrc[EX])
         0: PCAnswer[EX] = PCPlus4[EX]; // untaken
         1: PCAnswer[EX] = PCTarget[EX]; // jal, jalr, branch
      endcase
   end

   // attention! PCAnswer also can be exposed to load-use hazard
   // assign BranchPredictorWrong[EX] = (Instr[EX] != NOPE_INSTR) & (PCNext[EX] != PCAnswer[EX]) & ~DataWaitingAtEXStage;
   assign BranchPredictorWrong[EX] = (Instr[EX] != NOPE_INSTR) & (PCNext[EX] != PCAnswer[EX]) & ~(lwstall | swstall);

   // Forwarding

   logic [31:0] ForwardingResult;

   always_comb begin

      ForwardingResult = 32'hdeadbeef;

      if (ResultSrc[MEM] == 3) begin
         ForwardingResult = ImmExt[MEM];
      end else begin
         ForwardingResult = ALUResult[MEM];
      end

   end

   always_comb begin

      SrcA[EX] = 32'hdeadbeef;
      SrcB[EX] = 32'hdeadbeef;

      case (ALUSrcA[EX]) // first source of ALU/FPU (named "ALU Src" conventionally)
         0: begin // source from int reg or forward
            case (ForwardAInt[EX])
               0: SrcA[EX] = IntRD1[EX];
               1: SrcA[EX] = Result[WB];
               2: begin
                  // EX -> EX forward
                  // Lb, Lw, Flw -> EX forward
                  if ((InstructionType[MEM] == LB) | (InstructionType[MEM] == LW) | (InstructionType[MEM] == FLW)) begin
                     if (~lwstall) begin
                        if (LwStallLatched) begin // Data obtained now!
                           SrcA[EX] = ReadData[MEM];
                        end else begin
                           SrcA[EX] = ReadDataLatched;
                        end
                     end
                  end 

                  // ALU -> EX forward
                  else begin
                     SrcA[EX] = ForwardingResult;
                  end
               end
            endcase
         end
         1: SrcA[EX] = PC[EX];
         2: begin // source from float reg or forward
            case (ForwardAFloat[EX])
               0: SrcA[EX] = FloatRD1[EX];
               1: SrcA[EX] = Result[WB];
               2: begin
                  // EX -> EX forward
                  // Lb, Lw, Flw -> EX forward
                  if ((InstructionType[MEM] == LB) | (InstructionType[MEM] == LW) | (InstructionType[MEM] == FLW)) begin
                     if (~lwstall) begin
                        if (LwStallLatched) begin
                           SrcA[EX] = ReadData[MEM];
                        end else begin
                           SrcA[EX] = ReadDataLatched;
                        end
                     end
                  end 
                  
                  // ALU -> EX forward
                  else begin
                     SrcA[EX] = ForwardingResult;
                  end
               end
            endcase
         end
      endcase

      case (ALUSrcB[EX]) // second source of ALU/FPU
         0: begin
            case (ForwardBInt[EX]) // source from int reg or forward
               0: SrcB[EX] = IntRD2[EX];
               1: SrcB[EX] = Result[WB];
               2: begin
                  // EX -> EX forward
                  // Lb, Lw, Flw -> EX forward
                  if ((InstructionType[MEM] == LB) | (InstructionType[MEM] == LW) | (InstructionType[MEM] == FLW)) begin
                     if (~lwstall) begin
                        if (LwStallLatched) begin
                           SrcB[EX] = ReadData[MEM];
                        end else begin
                           SrcB[EX] = ReadDataLatched;
                        end
                     end
                  end 
                  
                  // ALU -> EX forward
                  else begin
                     SrcB[EX] = ForwardingResult;
                  end
               end
            endcase
         end
         1: SrcB[EX] = ImmExt[EX]; // source from immediate
         2: begin
            case (ForwardBInt[EX]) // source from int reg or forward
               0: SrcB[EX] = {27'b0, IntRD2[EX][4:0]}; // sll instruction's second operand
               1: SrcB[EX] = {27'b0, Result[WB][4:0]};
               2: SrcB[EX] = {27'b0, ForwardingResult[4:0]};
            endcase  
         end
         3: SrcB[EX] = {27'b0, Instr[EX][24:20]}; // slli instruction's second operand
         4: begin
            case (ForwardBFloat[EX]) // source from float reg or forward
               0: SrcB[EX] = FloatRD2[EX];
               1: SrcB[EX] = Result[WB];
               2: begin
                  // EX -> EX forward
                  // Lb, Lw, Flw -> EX forward
                  if ((InstructionType[MEM] == LB) | (InstructionType[MEM] == LW) | (InstructionType[MEM] == FLW)) begin
                     if (~lwstall) begin
                        if (LwStallLatched) begin
                           SrcB[EX] = ReadData[MEM];
                        end else begin
                           SrcB[EX] = ReadDataLatched;
                        end
                     end
                  end 
                  
                  // ALU -> EX forward
                  else begin
                     SrcB[EX] = ForwardingResult;
                  end
               end
            endcase
         end
      endcase
   end

   // Memory Access

   // address
   assign ReadAddr[EX] = ALUResult[EX];
   assign WriteAddr[EX] = ALUResult[EX];

   // write data
   always_comb begin
      case (MemWriteIntOrFloat[EX]) // memory write data
         0: begin // int reg
            case (ForwardBInt[EX]) // source from int reg or forward
               0: WriteData[EX] = IntRD2[EX];
               1: WriteData[EX] = Result[WB];
               2: begin
                  // EX -> EX forward
                  // Lb, Lw, Flw -> EX forward
                  if ((InstructionType[MEM] == LB) | (InstructionType[MEM] == LW) | (InstructionType[MEM] == FLW)) begin
                     if (~lwstall) begin
                        if (LwStallLatched) begin
                           WriteData[EX] = ReadData[MEM];
                        end else begin
                           WriteData[EX] = ReadDataLatched;
                        end
                     end
                  end 
                  
                  // ALU -> EX forward
                  else begin
                     WriteData[EX] = ForwardingResult;
                  end
               end
            endcase  
         end 
         1: begin // float reg
            case (ForwardBFloat[EX]) // source from float reg or forward
               0: WriteData[EX] = FloatRD2[EX];
               1: WriteData[EX] = Result[WB];
               2: begin
                  // EX -> EX forward
                  // Lb, Lw, Flw -> EX forward
                  if ((InstructionType[MEM] == LB) | (InstructionType[MEM] == LW) | (InstructionType[MEM] == FLW)) begin
                     if (~lwstall) begin
                        if (LwStallLatched) begin
                           WriteData[EX] = ReadData[MEM];
                        end else begin
                           WriteData[EX] = ReadDataLatched;
                        end
                     end
                  end 
                  
                  // ALU -> EX forward
                  else begin
                     WriteData[EX] = ForwardingResult;
                  end
               end
            endcase
         end
      endcase
   end

   // executing
   alu alu (
      // inputs
      .alu_control (ALUControl[EX]),
      .operand_a (SrcA[EX]),
      .operand_b (SrcB[EX]),

      // outputs
      .result (ALUResult[EX]),
      .zero_flag (Zero[EX])
   );

   fpu #(
      .REG_NUM (REG_NUM)
   ) fpu (
      // inputs
      .clk (clk),
      .rstn (rstn),
      .fpu_start (FPU[EX] & ~DataWaitingAtEXStage),
      .fpu_control (ALUControl[EX]),
      .operand_a (SrcA[EX]),
      .operand_b (SrcB[EX]),
      .register_destination (rd[EX]),
      .fpu_inst_number_input (InstructionNum[EX]),

      // outputs
      .int_scoreboard_write_enable (IntScoreboardWriteEnable1[EX]),
      .int_scoreboard_write_addr (IntScoreboardWriteAddress1[EX]),
      .int_scoreboard_write_data (IntScoreboardWriteData1[EX]),

      .fpu_write_enable_int (FPURegWriteInt),
      .fpu_write_addr_int (FPUWriteAddressInt),
      .fpu_write_data_int (FPUWriteDataInt),

      .fp_scoreboard_write_enable (FpScoreboardWriteEnable1[EX]),
      .fp_scoreboard_write_addr (FpScoreboardWriteAddress1[EX]),
      .fp_scoreboard_write_data (FpScoreboardWriteData1[EX]),

      .fpu_write_enable_fp (FPURegWriteFp),
      .fpu_write_addr_fp (FPUWriteAddressFp),
      .fpu_write_data_fp (FPUWriteDataFp),

      .fpu_inst_number_output (FPUWriteInstNum)
   );



// ---------------------------- 4. Memory・FPU (MEM stage) ----------------------------
   // drive from pipeline registers
   assign Instr[MEM]              = Instr_Pipe[EX_MEM];
   assign PC[MEM]                 = PC_Pipe[EX_MEM];
   assign ALUResult[MEM]          = ALUResult_Pipe[EX_MEM];
   assign FPU[MEM]                = FPU_Pipe[EX_MEM];
   assign rd[MEM]                 = rd_Pipe[EX_MEM];
   assign ResultSrc[MEM]          = ResultSrc_Pipe[EX_MEM];
   assign PCPlus4[MEM]            = PCPlus4_Pipe[EX_MEM];
   assign ImmExt[MEM]             = ImmExt_Pipe[EX_MEM];
   assign IntRegWrite[MEM]        = IntRegWrite_Pipe[EX_MEM];
   assign FloatRegWrite[MEM]      = FloatRegWrite_Pipe[EX_MEM];
   assign MemWrite[MEM]           = MemWrite_Pipe[EX_MEM];
   assign MemRead[MEM]            = MemRead_Pipe[EX_MEM];
   assign ReadAddr[MEM]           = ReadAddr_Pipe[EX_MEM];
   assign WriteAddr[MEM]          = WriteAddr_Pipe[EX_MEM];
   assign WriteData[MEM]          = WriteData_Pipe[EX_MEM];
   assign Lb[MEM]                 = Lb_Pipe[EX_MEM];
   assign HaltSignal[MEM]         = HaltSignal_Pipe[EX_MEM];
   assign InstructionType[MEM]    = InstructionType_Pipe[EX_MEM];
   assign InstructionNum[MEM]     = InstructionNum_Pipe[EX_MEM];

   // liitle endian
   assign LbIndex = ALUResult[MEM][1:0];

   // Latch ReadData (It only keeps for 1 cycle after it's back. We need to keep it when reg stall (Other stage stall) happens.)
   always_ff @(posedge clk) begin
      if (~rstn) begin
         ReadDataLatched <= 0;
      end else begin
         if (LwStallLatched & ~lwstall) begin // back from lwstall -> ReadData is valid
            ReadDataLatched <= ReadData[MEM];
         end
      end
   end


// ---------------------------- 5. Register Write Back (WB stage) ----------------------------
   // drive from pipeline registers
   // Be careful! MemRead, MemWrite, ReadAddr, WriteAddr, WriteData is already invalid this stage! You cannot use it!
   assign Instr[WB]              = Instr_Pipe[MEM_WB];
   assign PC[WB]                 = PC_Pipe[MEM_WB];
   assign ResultSrc[WB]          = ResultSrc_Pipe[MEM_WB];
   assign ALUResult[WB]          = ALUResult_Pipe[MEM_WB];
   assign ReadData[WB]           = ReadData_Pipe[MEM_WB];
   assign PCPlus4[WB]            = PCPlus4_Pipe[MEM_WB];
   assign ImmExt[WB]             = ImmExt_Pipe[MEM_WB];
   assign rd[WB]                 = rd_Pipe[MEM_WB];
   assign IntRegWrite[WB]        = IntRegWrite_Pipe[MEM_WB];
   assign FloatRegWrite[WB]      = FloatRegWrite_Pipe[MEM_WB];
   assign FPU[WB]                = FPU_Pipe[MEM_WB];
   assign HaltSignal[WB]         = HaltSignal_Pipe[MEM_WB];
   assign InstructionType[WB]    = InstructionType_Pipe[MEM_WB];
   assign InstructionNum[WB]     = InstructionNum_Pipe[MEM_WB];

   always_comb begin
      case (ResultSrc[WB]) // Computation Result
         0: Result[WB] = ALUResult[WB];
         1: Result[WB] = ReadData[WB]; // load
         2: Result[WB] = PCPlus4[WB];
         3: Result[WB] = ImmExt[WB];
      endcase
   end

   // Which port do we priortize when racing happens?
   always_comb begin
      IntPrioritizeWhichPort = 0;
      FloatPrioritizeWhichPort = 0;

      if (IntRegWrite[WB] & FPURegWriteInt) begin // racing at int reg!!
         if (InstructionNum[WB] <= FPUWriteInstNum) begin
            IntPrioritizeWhichPort = 0; // FPU write enable is younger than WB write enable
         end else begin
            IntPrioritizeWhichPort = 1;
         end
      end else if (FloatRegWrite[WB] & FPURegWriteFp) begin // racing at float reg!!
         if (InstructionNum[WB] <= FPUWriteInstNum) begin
            FloatPrioritizeWhichPort = 0; // FPU write enable is younger than WB write enable
         end else begin
            FloatPrioritizeWhichPort = 1;
         end
      end
   end




// ---------------------------- Hazard Units ----------------------------
   // --- ALU forwarding ---
   // normal forwarding
   assign ForwardAInt[EX] = ((rs1[EX] == rd[MEM]) & ((IntRegWrite[MEM]) & (rs1[EX] != 0)) & ~FPU[MEM]) ? 2 : (            // EX -> EX forward (including ALU and MEM)
                            ((rs1[EX] == rd[WB]) & ((IntRegWrite[WB]) & (rs1[EX] != 0)) & ~FPU[WB]) ? 1 :                 // MEM -> EX forward
                             0);
   assign ForwardAFloat[EX] = (((rs1[EX] == rd[MEM]) & FloatRegWrite[MEM] & ~FPU[MEM]) ? 2 : (       // EX -> EX forward (fsgn, feq, etc)
                              ((rs1[EX] == rd[WB]) & FloatRegWrite[WB] & ~FPU[WB]) ? 1 :             // MEM -> EX forward
                               0));
   assign ForwardBInt[EX] = ((rs2[EX] == rd[MEM]) & ((IntRegWrite[MEM]) & (rs2[EX] != 0) & ~FPU[MEM])) ? 2 : (            // EX -> EX forward
                            ((rs2[EX] == rd[WB]) & ((IntRegWrite[WB]) & (rs2[EX] != 0)) & ~FPU[WB]) ? 1 :                 // MEM -> EX forward
                             0);
   assign ForwardBFloat[EX] = (((rs2[EX] == rd[MEM]) & FloatRegWrite[MEM] & ~FPU[MEM]) ? 2 : (       // EX -> EX forward
                              ((rs2[EX] == rd[WB]) & FloatRegWrite[WB] & ~FPU[WB]) ? 1 :             // MEM -> EX forward
                               0));
   // instead of using negedge, we use another forwarding path : WB -> EX (about ALU)
   // compare @ ID & WB stage (1 stage before RAW hazard happens)
   assign WBEXForwardAInt[ID] = (rs1[ID] == rd[WB]) & ((IntRegWrite[WB]) & (rs1[ID] != 0)) & ~FPU[WB] & ~((IntRegWrite[WB] & FPURegWriteInt & ~IntPrioritizeWhichPort)); // when racing occurs and prioritize FPU result, WB->EX forward should be disabled!
   assign WBEXForwardAFloat[ID] = (rs1[ID] == rd[WB]) & ((FloatRegWrite[WB]) & (rs1[ID] != 0)) & ~FPU[WB] & ~((FloatRegWrite[WB] & FPURegWriteFp & ~FloatPrioritizeWhichPort));
   assign WBEXForwardBInt[ID] = (rs2[ID] == rd[WB]) & ((IntRegWrite[WB]) & (rs2[ID] != 0)) & ~FPU[WB] & ~((IntRegWrite[WB] & FPURegWriteInt & ~IntPrioritizeWhichPort));
   assign WBEXForwardBFloat[ID] = (rs2[ID] == rd[WB]) & ((FloatRegWrite[WB]) & (rs2[ID] != 0)) & ~FPU[WB] & ~((FloatRegWrite[WB] & FPURegWriteFp & ~FloatPrioritizeWhichPort));

   assign DataWaitingAtEXStage = ((ForwardAInt[EX] == 2) | (ForwardAFloat[EX] == 2) | (ForwardBInt[EX] == 2) | (ForwardBFloat[EX] == 2)) & ((InstructionType[MEM] == LB) | (InstructionType[MEM] == LW) | (InstructionType[MEM] == FLW)) & lwstall;
  
   // --- stalling ---
   // register busy stall = ALU source busy or WriteData source busy
   // When flushing, registerstall @ ID stage should be ignored!
   assign registerstall = ~Flush[ID_EX] & (((ALUSrcA[ID] == 0) & IntRegBusyS1[ID]) | ((ALUSrcB[ID] == 0) & IntRegBusyS2[ID]) | ((ALUSrcB[ID] == 2) & IntRegBusyS2[ID]) | ((ALUSrcA[ID] == 2) & FpRegBusyS1[ID]) | ((ALUSrcB[ID] == 4) & FpRegBusyS2[ID]) | (MemWrite[ID] & ~MemWriteIntOrFloat[ID] & IntRegBusyS2[ID]) | (MemWrite[ID] & MemWriteIntOrFloat[ID] & FpRegBusyS2[ID]));
   // other stalls come from outside core

   // --- latching ---
   always_ff @(posedge clk) begin
      if (~rstn) begin
         LwStallLatched <= 0;
      end else begin
         LwStallLatched <= lwstall;
      end
   end

   // --- flushing ---
   assign Flush[IF_ID] = BranchPredictorWrong[EX]; // Flush IF/ID registers when branch predictor is wrong.
   assign Flush[ID_EX] = BranchPredictorWrong[EX];

// ----------------------
// ----- debug core -----
// ----------------------
   localparam int PC_DEBUG_W     = 32;
   localparam int PC_DEBUG_DEPTH = 8;
   localparam int PC_DEBUG_AW    = $clog2(PC_DEBUG_DEPTH);

   (* mark_debug="true" *) logic [PC_DEBUG_W-1:0] pc_dbg;
   (* mark_debug="true" *) logic [PC_DEBUG_AW:0] pc_log_wr_ptr; // widened
   (* mark_debug="true" *) logic                  pc_log_full;
   (* mark_debug="true" *) logic [PC_DEBUG_W*PC_DEBUG_DEPTH-1:0] pc_log_flat;

   logic pc_log_en;

   assign pc_dbg = PC[MEM];

   // log_en 条件：PC!=0 のときだけ（fullなら止める）
   always_comb begin
      pc_log_en = (pc_dbg != 32'h0) && rstn && (pc_dbg != INVALID_PC);
   end

   debug_log_fifo_2 #(
      .W     (PC_DEBUG_W),
      .DEPTH (PC_DEBUG_DEPTH)
   ) u_log_pc (
      .clk      (clk),
      .rstn     (rstn),
      .log_en   (pc_log_en),
      .log_data (pc_dbg),
      .wr_ptr   (pc_log_wr_ptr),
      .full     (pc_log_full),
      .mem_flat (pc_log_flat)
   );




endmodule

`default_nettype wire
