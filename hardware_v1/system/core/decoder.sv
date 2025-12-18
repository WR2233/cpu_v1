`default_nettype wire

// Decoder

module decoder # (
    parameter REG_NUM = 32,
    parameter NOPE_INSTR = 0
)(
    // to core
    input logic [31:0] Instr,
    output logic [2:0] ImmSrc,
    output logic [2:0] ResultSrc,
    output logic Jump,
    output logic Branch,
    output logic JumpStart,
    output logic Lb,
    output types_pkg::inst_t InstructionType,

    // to system
    output logic HaltSignal, // Signal to halt simulation

    // to register
    output logic IntRegWrite,
    output logic FloatRegWrite,
    output logic FPU,
    output logic FToI,

    // to ALU
    output logic [3:0] ALUControl,
    output logic [1:0] ALUSrcA,
    output logic [2:0] ALUSrcB,

    // to memory
    output logic MemRead,
    output logic MemWrite,
    output logic MemWriteIntOrFloat
);

    import types_pkg::*;
// ----- parameters -----
    parameter REG_SD_BIT_WIDTH = $clog2(REG_NUM);
    parameter OPCODE_BIT_WIDTH = 32 - 3 * REG_SD_BIT_WIDTH - 3 - 7;

    // RISC-V(32 registers) or 64 registers
    parameter NOPE_OPCODE = (OPCODE_BIT_WIDTH == 7) ?         0 : 0;
    parameter LOAD_INT_OPCODE = (OPCODE_BIT_WIDTH == 7) ?     3 : 1;
    parameter FLW_OPCODE = (OPCODE_BIT_WIDTH == 7) ?          7 : 2;
    parameter ITYPE_ALU_OPCODE = (OPCODE_BIT_WIDTH == 7) ?   19 : 3;
    parameter AUIPC_OPCODE = (OPCODE_BIT_WIDTH == 7) ?       23 : 4;
    parameter STORE_OPCODE = (OPCODE_BIT_WIDTH == 7) ?       35 : 5;
    parameter FSW_OPCODE = (OPCODE_BIT_WIDTH == 7) ?         39 : 6;
    parameter RTYPE_OPCODE = (OPCODE_BIT_WIDTH == 7) ?       51 : 7;
    parameter LUI_OPCODE = (OPCODE_BIT_WIDTH == 7) ?         55 : 9;
    parameter FLOAT_OPCODE = (OPCODE_BIT_WIDTH == 7) ?       83 : 10;
    parameter BRANCH_OPCODE = (OPCODE_BIT_WIDTH == 7) ?      99 : 11;
    parameter JALR_OPCODE = (OPCODE_BIT_WIDTH == 7) ?       103 : 12;
    parameter JAL_OPCODE = (OPCODE_BIT_WIDTH == 7) ?        111 : 13;
    parameter EBREAK_OPCODE = (OPCODE_BIT_WIDTH == 7) ?     115 : 14;
    parameter FMV_OPCODE = (OPCODE_BIT_WIDTH == 7) ?        116 : 15;


// ----- declarations -----
    logic [OPCODE_BIT_WIDTH-1:0] Opcode;
    logic [2:0] f3;
    logic [6:0] funct7;

// ----- Instr decomposition -----
    assign Opcode = Instr[OPCODE_BIT_WIDTH-1:0];
    assign f3 = Instr[OPCODE_BIT_WIDTH+REG_SD_BIT_WIDTH+2:OPCODE_BIT_WIDTH+REG_SD_BIT_WIDTH];
    assign funct7 = Instr[31:25];

// ===================
// ----- signals -----
// ===================
    always_comb begin
// ----- defaults -----
        Jump = 0;
        Branch = 0;
        ResultSrc = 0;
        MemWrite = 0;
        MemWriteIntOrFloat = 0;
        ALUControl = 0;
        ALUSrcB = 0;
        ALUSrcA = 0;
        ImmSrc = 0;
        IntRegWrite = 0;
        JumpStart = 0;
        HaltSignal = 0;
        MemRead = 0;
        FPU = 0;
        FloatRegWrite = 0;
        FToI = 0;
        Lb = 0;
        InstructionType = NOPE;

        case (Opcode)
// ----- nope ----
            NOPE_OPCODE: begin // does not affect FF or memory at all
                IntRegWrite = 0;
                FloatRegWrite = 0;
                FPU = 0;
                MemRead = 0;
                MemWrite = 0;
                InstructionType = NOPE;
            end
// ----- load (int) -----
            LOAD_INT_OPCODE: begin // lw命令
                case (f3)
                    0: begin
                        Lb = 1; // lb
                        InstructionType = LB;
                    end
                    2: begin
                        Lb = 0; // lw
                        InstructionType = LW;
                    end
                endcase
                ALUControl = 0; // add
                ALUSrcB = 1;
                ImmSrc = 0;
                IntRegWrite = 1;
                MemRead = 1;
                ResultSrc = 1;
            end
// ----- flw -----
            FLW_OPCODE: begin // flw命令 DDRからfpレジスタに
                ALUSrcB   = 1;
                ImmSrc   = 0;
                IntRegWrite = 0;
                MemRead = 1; // 普通にDDRから
                ResultSrc = 1;
                FloatRegWrite = 1;
                InstructionType = FLW;
            end
// ----- I-type ALU -----
            ITYPE_ALU_OPCODE: begin // 即値を引数に取る計算（I-type ALU）
                IntRegWrite = 1;
                case (f3)
                    0: begin // addi
                        ALUControl = 0; ALUSrcB = 1; ImmSrc = 0; InstructionType = ADDI;
                    end
                    1: begin // slli
                        ALUControl = 5; ALUSrcB = 3; ImmSrc = 0; InstructionType = SLLI;
                    end
                    2: begin // slti
                        ALUControl = 4; ALUSrcB = 1; ImmSrc = 0; InstructionType = SLTI;
                    end
                    3: begin // sltiu
                        ALUControl = 9; ALUSrcB = 1; ImmSrc = 0; InstructionType = SLTIU;
                    end
                    4: begin // xori
                        ALUControl = 8; ALUSrcB = 1; ImmSrc = 5; InstructionType = XORI;
                    end
                    5: begin
                        case(funct7[5])
                            0: begin // srli
                                ALUControl = 6; ALUSrcB = 3; ImmSrc = 0; InstructionType = SRLI;
                            end
                            1: begin // srai
                                ALUControl = 7; ALUSrcB = 3; ImmSrc = 0; InstructionType = SRAI;
                            end
                        endcase
                    end
                    6: begin // ori
                        ALUControl = 3; ALUSrcB = 1; ImmSrc = 5; InstructionType = ORI;
                    end
                    7: begin // andi
                        ALUControl = 2; ALUSrcB = 1; ImmSrc = 5; InstructionType = ANDI;
                    end
                endcase
            end
// ----- auipc -----
            AUIPC_OPCODE: begin // auipc
                // ALUSrcAをPCにして {upimm, 12'b0} + PC
                IntRegWrite = 1;
                ALUSrcB   = 1; // 即値を持ってくる
                ALUSrcA  = 1; // SrcAをレジスタからではなく、PCにする
                ImmSrc   = 4; // U形式では{upimm, 12'b0}を持ってくる
                InstructionType = AUIPC;
            end
// ----- sw -----
            STORE_OPCODE: begin // STORE命令
                MemWrite = 1;
                ALUSrcB   = 1;
                ImmSrc   = 1;
                MemRead = 0;
                InstructionType = SW;
            end
// ----- fsw -----
            FSW_OPCODE: begin // fsw
                MemWrite = 1;
                MemWriteIntOrFloat = 1; // 小数レジスタからメモリへ
                ALUSrcB   = 1;
                ImmSrc   = 1;
                MemRead = 0;
                InstructionType = FSW;
            end
// ----- R-type -----
            RTYPE_OPCODE: begin // R-type
                IntRegWrite = 1;
                case (f3)
                    0: begin
                        case({Opcode[5], funct7[5]})
                            2'b00, 2'b01, 2'b10: begin
                                ALUControl = 0; // add
                                ALUSrcB     = 0;
                                InstructionType = ADD;
                            end
                            2'b11: begin
                                ALUControl = 1; // sub
                                ALUSrcB     = 0;
                                InstructionType = SUB;
                            end
                        endcase
                    end
                    1: begin
                        ALUControl = 5; // sll
                        ALUSrcB     = 2;
                        InstructionType = SLL;
                    end
                    2: begin
                        ALUControl = 4; // slt
                        ALUSrcB     = 0;
                        InstructionType = SLT;
                    end
                    3: begin
                        ALUControl = 9; // sltu
                        ALUSrcB     = 0;
                        InstructionType = SLTU;
                    end
                    4: begin
                        ALUControl = 8; // xor
                        ALUSrcB     = 0;
                        InstructionType = XOR;
                    end
                    5: begin
                        case (funct7[5])
                            0: begin // srl
                                ALUControl = 6;
                                ALUSrcB     = 2;
                                InstructionType = SRL;
                            end
                            1: begin // sra
                                ALUControl = 7;
                                ALUSrcB     = 2;
                                InstructionType = SRA;
                            end
                        endcase
                    end
                    6: begin
                        ALUControl = 3; // and
                        ALUSrcB     = 0;
                        InstructionType = AND;
                    end
                    7: begin
                        ALUControl = 2; // or
                        ALUSrcB     = 0;
                        InstructionType = OR;
                    end
                endcase
            end
// ----- lui -----
            LUI_OPCODE: begin // lui
                // 演算を行わない（レジスタに即値をロード）
                // luiは、{upimm, 12'b0} を行って演算終了
                IntRegWrite  = 1; 
                ResultSrc = 3; 
                ALUSrcB    = 1; // 即値を持ってくる
                ImmSrc    = 4; // U形式
                InstructionType = LUI;
            end
// ----- FPU (basics) -----
            FLOAT_OPCODE: begin // FPU operationの基本的な命令(R形式)
                ALUSrcA = 2;
                ALUSrcB = 4;
                FloatRegWrite = (funct7 == 16); // combinational -> cpu is responsible for writing data
                IntRegWrite   = 0; // cpu is not responsible for writing result
                FPU = (funct7 != 16); // not combinational
                FToI = (funct7 == 20); // ftoi
                case (funct7) 
                    0: begin
                        ALUControl = 0; // fadd
                        InstructionType = FADD;
                    end
                    4: begin
                        ALUControl = 1; // fsub
                        InstructionType = FSUB;
                    end
                    8: begin
                        ALUControl = 2;
                        InstructionType = FMUL; // fmul
                    end
                    12: begin
                        ALUControl = 9;
                        InstructionType = FDIV; // fdiv
                    end
                    16: begin// FSGNJ
                        case (f3)
                            0: begin
                                ALUControl = 13; // fsgnj.s
                                InstructionType = FSGNJ;
                            end
                            1: begin
                                ALUControl = 14; // fsgnjn.s
                                InstructionType = FSGNJN;
                            end
                            2: begin
                                ALUControl = 15; // fsgnjx.s
                                InstructionType = FSGNJX;
                            end
                        endcase
                    end
                    17: begin
                        ALUControl = 4; // fisqrt
                        InstructionType = FISQRT;
                    end
                    18: begin
                        ALUControl = 5; // finv
                        InstructionType = FINV;
                    end
                    19: begin
                        ALUControl = 6; // floor
                        InstructionType = FLOOR;
                    end
                    20: begin
                        ALUControl = 7; // ftoi
                        InstructionType = FTOI;
                    end
                    21: begin
                        ALUSrcA = 0;
                        ALUSrcB = 0;
                        ALUControl = 8; // itof
                        InstructionType = ITOF;
                    end
                    44: begin
                        ALUControl = 3; // fsqrt
                        InstructionType = FSQRT;
                    end
                    80: begin
                        // FPU compare
                        ALUSrcA = 2;
                        ALUSrcB = 4;
                        IntRegWrite = 1;
                        FloatRegWrite = 0; // stores into Integer Reg
                        FPU = 0; // combinational = ALU
                        case (f3) 
                            0: begin // fle
                                ALUControl = 10;
                                InstructionType = FLE;
                            end
                            1: begin // flt
                                ALUControl = 11;
                                InstructionType = FLT;
                            end
                            2: begin // feq
                                ALUControl = 12;
                                InstructionType = FEQ;
                            end
                        endcase
                    end
                endcase
            end
// ----- BRANCH -----
            BRANCH_OPCODE: begin
                ALUSrcB = 0;
                ImmSrc = 2;
                case (f3)
                    0: begin // beq
                        ALUControl = 1; // subの結果がzero_flagに格納
                        Branch     = 1;
                        InstructionType = BEQ;
                    end
                    1: begin // bne
                        ALUControl = 1;
                        Branch     = 1;
                        InstructionType = BNE;
                    end
                    4: begin // blt
                        ALUControl = 4;
                        Branch     = 1; // slt=1のときzero_flag=0 -> Branch=1
                        InstructionType = BLT;
                    end
                    5: begin // bge
                        ALUControl = 4;
                        Branch     = 1;
                        InstructionType = BGE;
                    end
                    6: begin // bltu
                        ALUControl = 9;
                        Branch     = 1;
                        InstructionType = BLTU;
                    end
                    7: begin // bgeu
                        ALUControl = 9;
                        Branch     = 1;
                        InstructionType = BGEU;
                    end
                endcase
            end
// ----- jalr, jal -----
            JALR_OPCODE: begin // jalr
                ALUControl = 0;
                Jump       = 1;
                ResultSrc  = 2;
                ALUSrcB     = 0;
                ImmSrc     = 0;
                IntRegWrite   = 1;
                JumpStart  = 1;
                InstructionType = JALR;
            end

            JAL_OPCODE: begin // jal
                ALUControl = 0;
                Jump       = 1;
                ResultSrc  = 2;
                ALUSrcB     = 0;
                ImmSrc     = 3;
                IntRegWrite   = 1;
                JumpStart  = 0;
                InstructionType = JAL;
            end
// ----- ebreak -----
            EBREAK_OPCODE: begin // ebreak命令（この命令がソフトによって呼ばれた場合、HaltSignalを1）
                HaltSignal = 1;
                InstructionType = EBREAK;
            end
// ----- fmv -----
            FMV_OPCODE: begin
                ALUSrcA = 2;
                ALUSrcB = 4;
                FloatRegWrite = 0;
                IntRegWrite   = 1; // from float reg to int reg
                FPU = 0; // combinational
                ALUControl = 0; // rs2 must be 0 reg when fmv instruction is fetched -> rs1 = rs2 + rs1
                InstructionType = FMV;
            end
        endcase
    end


endmodule

`default_nettype wire
