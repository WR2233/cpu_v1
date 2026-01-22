#include "instruction.h"
#include <sstream>
#include <iomanip>
#include <iostream>

// 符号拡張ヘルパー関数
int32_t Instruction::signExtend(uint32_t value, int bits) const
{
    uint32_t sign_bit = 1U << (bits - 1);
    if (value & sign_bit)
    {
        // 負の数: 上位ビットを1で埋める
        uint32_t mask = (~0U) << bits;
        return static_cast<int32_t>(value | mask);
    }
    else
    {
        // 正の数: そのまま
        return static_cast<int32_t>(value);
    }
}

void Instruction::decode(uint32_t instruction)
{
    raw = instruction;

    // RISC-Vオペコードは下位7ビット
    uint8_t opcode_field = instruction & 0x7F;

    // 共通フィールドの抽出
    rd = (instruction >> 7) & 0x1F;
    funct3 = (instruction >> 12) & 0x07;
    rs1 = (instruction >> 15) & 0x1F;
    rs2 = (instruction >> 20) & 0x1F;
    funct7 = (instruction >> 25) & 0x7F;

    switch (opcode_field)
    {
    case 0b0110011: // R-Type: 整数演算
        type = InstructionType::R_TYPE;
        decodeRType();
        break;

    case 0b0010011: // I-Type: 即値演算
        type = InstructionType::I_TYPE;
        decodeIType();
        break;

    case 0b0000011: // I-Type: ロード命令
        type = InstructionType::I_TYPE;
        decodeLoadType();
        break;

    case 0b0100011: // S-Type: ストア命令
        type = InstructionType::S_TYPE;
        decodeSType();
        break;

    case 0b1100011: // B-Type: 分岐命令
        type = InstructionType::B_TYPE;
        decodeBType();
        break;

    case 0b1101111: // J-Type: JAL
        type = InstructionType::J_TYPE;
        decodeJAL();
        break;

    case 0b1100111: // I-Type: JALR
        type = InstructionType::I_TYPE;
        opcode = Opcode::JALR;
        immediate = signExtend((raw >> 20) & 0xFFF, 12);
        break;

    case 0b0110111: // U-Type: LUI
        type = InstructionType::U_TYPE;
        opcode = Opcode::LUI;
        immediate = static_cast<int32_t>(raw & 0xFFFFF000);
        break;

    case 0b0010111: // U-Type: AUIPC
        type = InstructionType::U_TYPE;
        opcode = Opcode::AUIPC;
        immediate = static_cast<int32_t>(raw & 0xFFFFF000);
        break;

    case 0b1010011: // F-Type: 浮動小数点演算
        type = InstructionType::F_TYPE;
        decodeFType();
        break;

    case 0b1110100:
        type = InstructionType::F_TYPE;
        opcode = Opcode::FMV;
        break;

    case 0b0000111: // I-Type: 浮動小数点ロード (FLW)
        type = InstructionType::I_TYPE;
        opcode = Opcode::FLW;
        immediate = signExtend((raw >> 20) & 0xFFF, 12);
        break;

    case 0b0100111: // S-Type: 浮動小数点ストア (FSW)
        type = InstructionType::S_TYPE;
        opcode = Opcode::FSW;
        {
            uint32_t imm_11_5 = (raw >> 25) & 0x7F;
            uint32_t imm_4_0 = (raw >> 7) & 0x1F;
            uint32_t imm = (imm_11_5 << 5) | imm_4_0;
            immediate = signExtend(imm, 12);
            rd = 0; // S-Typeではrdは使用されない
        }
        break;
    case 0b1110011:
        type = InstructionType::EBREAK;
        opcode = Opcode::EBREAK_CODE;
        break;
    default:
        type = InstructionType::NOP;
        opcode = Opcode::NOP_CODE;
    }
    getRegType();
}

// R-Type デコード
void Instruction::decodeRType()
{
    // funct3 と funct7 の組み合わせで命令を判定
    uint16_t combined = (funct7 << 3) | funct3;

    switch (combined)
    {
    case 0b0000000000:
        opcode = Opcode::ADD;
        break; // funct7=0x00, funct3=0x0
    case 0b0100000000:
        opcode = Opcode::SUB;
        break; // funct7=0x20, funct3=0x0
    case 0b0000000110:
        opcode = Opcode::OR;
        break; // funct7=0x00, funct3=0x6
    case 0b0000000111:
        opcode = Opcode::AND;
        break; // funct7=0x00, funct3=0x7
    case 0b0000000001:
        opcode = Opcode::SLL;
        break; // funct7=0x00, funct3=0x1
    case 0b0000000010:
        opcode = Opcode::SLT;
        break; // funct7=0x00, funct3=0x2
    case 0b0000000011:
        opcode = Opcode::SLTU;
        break; // funct7=0x00, funct3=0x3
    case 0b0000000100:
        opcode = Opcode::XOR;
        break; // funct7=0x00, funct3=0x4
    case 0b0000000101:
        opcode = Opcode::SRL;
        break; // funct7=0x00, funct3=0x5
    case 0b0100000101:
        opcode = Opcode::SRA;
        break; // funct7=0x20, funct3=0x5
    case 0b0000001100:
        opcode = Opcode::DIV;
        break; // funct7=0x01, funct3=0x4
    default:
        opcode = Opcode::NOP_CODE;
        type = InstructionType::NOP;
    }
}

// I-Type 即値演算デコード
void Instruction::decodeIType()
{
    immediate = signExtend((raw >> 20) & 0xFFF, 12);

    switch (funct3)
    {
    case 0b000:
        opcode = Opcode::ADDI;
        break;
    case 0b010:
        opcode = Opcode::SLTI;
        break;
    case 0b011:
        opcode = Opcode::SLTIU;
        break;
    case 0b100:
        opcode = Opcode::XORI;
        break;
    case 0b110:
        opcode = Opcode::ORI;
        break;
    case 0b111:
        opcode = Opcode::ANDI;
        break;
    case 0b001: // SLLI
        opcode = Opcode::SLLI;
        immediate = (raw >> 20) & 0x1F; // シフト量は5ビット
        break;
    case 0b101:                         // SRLI or SRAI
        immediate = (raw >> 20) & 0x1F; // シフト量は5ビット
        if (funct7 == 0b0000000)
        {
            opcode = Opcode::SRLI;
        }
        else if (funct7 == 0b0100000)
        {
            opcode = Opcode::SRAI;
        }
        else
        {
            opcode = Opcode::NOP_CODE;
            type = InstructionType::NOP;
        }
        break;
    default:
        opcode = Opcode::NOP_CODE;
        type = InstructionType::NOP;
    }
}

// I-Type ロード命令デコード
void Instruction::decodeLoadType()
{
    immediate = signExtend((raw >> 20) & 0xFFF, 12);

    switch (funct3)
    {
    case 0b000:
        opcode = Opcode::LB;
        break;
    case 0b010:
        opcode = Opcode::LW;
        break;
    default:
        opcode = Opcode::NOP_CODE;
        type = InstructionType::NOP;
    }
}

// S-Type ストア命令デコード
void Instruction::decodeSType()
{
    // S-Typeの即値: imm[11:5] = inst[31:25], imm[4:0] = inst[11:7]
    uint32_t imm_11_5 = (raw >> 25) & 0x7F;
    uint32_t imm_4_0 = (raw >> 7) & 0x1F;
    uint32_t imm = (imm_11_5 << 5) | imm_4_0;
    immediate = signExtend(imm, 12);

    switch (funct3)
    {
    case 0b000:
        opcode = Opcode::SB;
        break;
    case 0b010:
        opcode = Opcode::SW;
        break;
    default:
        opcode = Opcode::NOP_CODE;
        type = InstructionType::NOP;
        break;
    }

    // S-Typeではrdは使用されない
    rd = 0;
}

// B-Type 分岐命令デコード
void Instruction::decodeBType()
{
    // B-Typeの即値: imm[12|10:5|4:1|11]
    uint32_t imm_12 = (raw >> 31) & 0x1;
    uint32_t imm_11 = (raw >> 7) & 0x1;
    uint32_t imm_10_5 = (raw >> 25) & 0x3F;
    uint32_t imm_4_1 = (raw >> 8) & 0xF;
    uint32_t imm = (imm_12 << 12) | (imm_11 << 11) | (imm_10_5 << 5) | (imm_4_1 << 1);
    immediate = signExtend(imm, 13);

    switch (funct3)
    {
    case 0b000:
        opcode = Opcode::BEQ;
        break;
    case 0b001:
        opcode = Opcode::BNE;
        break;
    case 0b100:
        opcode = Opcode::BLT;
        break;
    case 0b101:
        opcode = Opcode::BGE;
        break;
    case 0b110:
        opcode = Opcode::BLTU;
        break;
    case 0b111:
        opcode = Opcode::BGEU;
        break;
    default:
        opcode = Opcode::NOP_CODE;
        type = InstructionType::NOP;
    }

    // B-Typeではrdは使用されない
    rd = 0;
}

// J-Type JAL命令デコード
void Instruction::decodeJAL()
{
    opcode = Opcode::JAL;

    // J-Typeの即値: imm[20|10:1|11|19:12]
    uint32_t imm_20 = (raw >> 31) & 0x1;
    uint32_t imm_19_12 = (raw >> 12) & 0xFF;
    uint32_t imm_11 = (raw >> 20) & 0x1;
    uint32_t imm_10_1 = (raw >> 21) & 0x3FF;
    uint32_t imm = (imm_20 << 20) | (imm_19_12 << 12) | (imm_11 << 11) | (imm_10_1 << 1);
    immediate = signExtend(imm, 21);
}

// F-Type 浮動小数点演算デコード
void Instruction::decodeFType()
{
    // funct3 と funct7 の組み合わせで命令を判定
    uint16_t combined = (funct7 << 3) | funct3;
    rm = (raw >> 12) & 0x07;

    switch (combined)
    {
    case 0b000000000:
        opcode = Opcode::FADD;
        break;
    case 0b0000100000:
        opcode = Opcode::FSUB;
        break;
    case 0b0001000000:
        opcode = Opcode::FMUL;
        break;
    case 0b0001100000:
        opcode = Opcode::FDIV;
        break;
    case 0b0101100000: // FSQRT
        opcode = Opcode::FSQRT;
        rs2 = 0; // FSQRTはrs2を使用しない
        break;
    case 0b0010000000:
        opcode = Opcode::FSGNJ;
        break;
    case 0b0010000001:
        opcode = Opcode::FSGNJN;
        break;
    case 0b0010000010:
        opcode = Opcode::FSGNJX;
        break;
    case 0b1010000000: // FLE
        opcode = Opcode::FLE;
        break;
    case 0b1010000001: // FLT
        opcode = Opcode::FLT;
        break;
    case 0b1010000010: // FEQ
        opcode = Opcode::FEQ;
        break;
    case 0b0010001000:
        opcode = Opcode::FISQRT;
        rs2 = 0; // FISQRTはrs2を使用しない
        break;
    case 0b0010010000:
        opcode = Opcode::FINV;
        rs2 = 0; // FINVはrs2を使用しない
        break;
    case 0b0010011000:
        opcode = Opcode::FLOOR;
        rs2 = 0; // FTOIはrs2を使用しない
        break;
    case 0b0010100000:
        opcode = Opcode::FTOI;
        rs2 = 0; // FTOIはrs2を使用しない
        break;
    case 0b0010101000:
        opcode = Opcode::ITOF;
        rs2 = 0; // ITOFはrs2を使用しない
        break;
    default:
        opcode = Opcode::NOP_CODE;
        type = InstructionType::NOP;
    }
}

std::string Instruction::toString() const
{
    std::ostringstream oss;
    oss << "0x" << std::hex << std::setw(8) << std::setfill('0') << raw << " : ";

    switch (type)
    {
    case InstructionType::R_TYPE:
        switch (opcode)
        {
        case Opcode::ADD:
            oss << "ADD";
            break;
        case Opcode::SUB:
            oss << "SUB";
            break;
        case Opcode::AND:
            oss << "AND";
            break;
        case Opcode::OR:
            oss << "OR";
            break;
        case Opcode::XOR:
            oss << "XOR";
            break;
        case Opcode::SLL:
            oss << "SLL";
            break;
        case Opcode::SRL:
            oss << "SRL";
            break;
        case Opcode::SRA:
            oss << "SRA";
            break;
        case Opcode::SLT:
            oss << "SLT";
            break;
        case Opcode::SLTU:
            oss << "SLTU";
            break;
        case Opcode::DIV:
            oss << "DIV";
            break;
        default:
            oss << "UNKNOWN";
            break;
        }
        oss << " x" << (int)rd << ", x" << (int)rs1 << ", x" << (int)rs2;
        break;

    case InstructionType::I_TYPE:
        switch (opcode)
        {
        case Opcode::ADDI:
            oss << "ADDI x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::SLTI:
            oss << "SLTI x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::SLTIU:
            oss << "SLTIU x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::XORI:
            oss << "XORI x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::ORI:
            oss << "ORI x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::ANDI:
            oss << "ANDI x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::SLLI:
            oss << "SLLI x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::SRLI:
            oss << "SRLI x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::SRAI:
            oss << "SRAI x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::LB:
            oss << "LB x" << (int)rd << ", " << std::dec << immediate << "(x" << (int)rs1 << ")";
            break;
        case Opcode::LW:
            oss << "LW x" << (int)rd << ", " << std::dec << immediate << "(x" << (int)rs1 << ")";
            break;
        case Opcode::JALR:
            oss << "JALR x" << (int)rd << ", x" << (int)rs1 << ", " << std::dec << immediate;
            break;
        case Opcode::FLW:
            oss << "FLW f" << (int)rd << ", " << std::dec << immediate << "(x" << (int)rs1 << ")";
            break;
        default:
            oss << "UNKNOWN";
            break;
        }
        break;

    case InstructionType::S_TYPE:
        switch (opcode)
        {
        case Opcode::SB:
            oss << "SB x" << (int)rs2 << ", " << std::dec << immediate << "(x" << (int)rs1 << ")";
            break;
        case Opcode::SW:
            oss << "SW x" << (int)rs2 << ", " << std::dec << immediate << "(x" << (int)rs1 << ")";
            break;
        case Opcode::FSW:
            oss << "FSW f" << (int)rs2 << ", " << std::dec << immediate << "(x" << (int)rs1 << ")";
            break;
        default:
            oss << "UNKNOWN";
            break;
        }
        break;

    case InstructionType::B_TYPE:
        switch (opcode)
        {
        case Opcode::BEQ:
            oss << "BEQ x" << (int)rs1 << ", x" << (int)rs2 << ", " << std::dec << immediate;
            break;
        case Opcode::BNE:
            oss << "BNE x" << (int)rs1 << ", x" << (int)rs2 << ", " << std::dec << immediate;
            break;
        case Opcode::BLT:
            oss << "BLT x" << (int)rs1 << ", x" << (int)rs2 << ", " << std::dec << immediate;
            break;
        case Opcode::BGE:
            oss << "BGE x" << (int)rs1 << ", x" << (int)rs2 << ", " << std::dec << immediate;
            break;
        case Opcode::BLTU:
            oss << "BLTU x" << (int)rs1 << ", x" << (int)rs2 << ", " << std::dec << immediate;
            break;
        case Opcode::BGEU:
            oss << "BGEU x" << (int)rs1 << ", x" << (int)rs2 << ", " << std::dec << immediate;
            break;
        default:
            oss << "UNKNOWN";
            break;
        }
        break;

    case InstructionType::U_TYPE:
        if (opcode == Opcode::LUI)
        {
            oss << "LUI x" << (int)rd << ", 0x" << std::hex << (immediate >> 12);
        }
        else if (opcode == Opcode::AUIPC)
        {
            oss << "AUIPC x" << (int)rd << ", 0x" << std::hex << (immediate >> 12);
        }
        else
        {
            oss << "UNKNOWN";
        }
        break;

    case InstructionType::J_TYPE:
        oss << "JAL x" << (int)rd << ", " << std::dec << immediate;
        break;

    case InstructionType::F_TYPE:
        switch (opcode)
        {
        case Opcode::FADD:
            oss << "FADD f" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FSUB:
            oss << "FSUB f" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FMUL:
            oss << "FMUL f" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FDIV:
            oss << "FDIV f" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FSQRT:
            oss << "FSQRT f" << (int)rd << ", f" << (int)rs1;
            break;
        case Opcode::FSGNJ:
            oss << "FSGNJ f" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FSGNJN:
            oss << "FSGNJN f" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FSGNJX:
            oss << "FSGNJX f" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FEQ:
            oss << "FEQ x" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FLT:
            oss << "FLT x" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FLE:
            oss << "FLE x" << (int)rd << ", f" << (int)rs1 << ", f" << (int)rs2;
            break;
        case Opcode::FISQRT:
            oss << "FISQRT f" << (int)rd << ", f" << (int)rs1;
            break;
        case Opcode::FINV:
            oss << "FINV f" << (int)rd << ", f" << (int)rs1;
            break;
        case Opcode::FLOOR:
            oss << "FLOOR f" << (int)rd << ", f" << (int)rs1;
            break;
        case Opcode::FTOI:
            oss << "FTOI x" << (int)rd << ", f" << (int)rs1;
            break;
        case Opcode::ITOF:
            oss << "ITOF f" << (int)rd << ", x" << (int)rs1;
            break;
        case Opcode::FMV:
            oss << "FMV f" << (int)rd << ", x" << (int)rs1;
            break;
        default:
            oss << "UNKNOWN";
            break;
        }
        break;

    case InstructionType::EBREAK:
        oss << "EBREAK";
        break;

    case InstructionType::NOP:
        oss << "NOP";
        break;
    }

    return oss.str();
}

// レジスタファイル種別判定
void Instruction::getRegType()
{
    switch (type)
    {
    case InstructionType::R_TYPE:
        rs1Type = RegType::Int;
        rs2Type = RegType::Int;
        rdType = RegType::Int;
        break;
    case InstructionType::I_TYPE:
        rs1Type = RegType::Int;
        rs2Type = RegType::None;
        switch (opcode)
        {
        case Opcode::ADDI:
        case Opcode::SLTI:
        case Opcode::SLTIU:
        case Opcode::XORI:
        case Opcode::ORI:
        case Opcode::ANDI:
        case Opcode::SLLI:
        case Opcode::SRLI:
        case Opcode::SRAI:
        case Opcode::LB:
        case Opcode::LW:
        case Opcode::JALR:
            rdType = RegType::Int;
            break;
        case Opcode::FLW:
            rdType = RegType::Fp;
            break;
        default:
            std::cerr << "getRegType error\n"
                      << "  opcode = " << static_cast<int>(opcode) << "\n";
            std::abort();
            break;
        }
        break;
    case InstructionType::S_TYPE:
        rdType = RegType::None;
        rs1Type = RegType::Int;
        switch (opcode)
        {
        case Opcode::SB:
        case Opcode::SW:
            rs2Type = RegType::Int;
            break;
        case Opcode::FSW:
            rs2Type = RegType::Fp;
            break;
        default:
            std::cerr << "getRegType error\n"
                      << "  opcode = " << static_cast<int>(opcode) << "\n";
            std::abort();
            break;
        }
        break;
    case InstructionType::B_TYPE:
        rs1Type = RegType::Int;
        rs2Type = RegType::Int;
        rdType = RegType::None;
        break;
    case InstructionType::U_TYPE:
        rs1Type = RegType::None;
        rs2Type = RegType::None;
        rdType = RegType::Int;
        break;
    case InstructionType::J_TYPE:
        rs1Type = RegType::None;
        rs2Type = RegType::None;
        rdType = RegType::Int;
        break;
    case InstructionType::F_TYPE:
        switch (opcode)
        {
        case Opcode::FADD:
        case Opcode::FSUB:
        case Opcode::FMUL:
        case Opcode::FDIV:
        case Opcode::FSGNJ:
        case Opcode::FSGNJN:
        case Opcode::FSGNJX:
            rs1Type = RegType::Fp;
            rs2Type = RegType::Fp;
            rdType = RegType::Fp;
            break;
        case Opcode::FSQRT:
        case Opcode::FISQRT:
        case Opcode::FINV:
        case Opcode::FLOOR:
            rs1Type = RegType::Fp;
            rs2Type = RegType::None;
            rdType = RegType::Fp;
            break;
        case Opcode::FMV:
            rs1Type = RegType::Int;
            rs2Type = RegType::None;
            rdType = RegType::Fp;
            break;
        case Opcode::FEQ:
        case Opcode::FLT:
        case Opcode::FLE:
            rs1Type = RegType::Fp;
            rs2Type = RegType::Fp;
            rdType = RegType::Int;
            break;
        case Opcode::FTOI:
            rs1Type = RegType::Fp;
            rs2Type = RegType::None;
            rdType = RegType::Int;
            break;
        case Opcode::ITOF:
            rs1Type = RegType::Int;
            rs2Type = RegType::None;
            rdType = RegType::Fp;
            break;
        default:
            std::cerr << "getRegType error\n"
                      << "  opcode = " << static_cast<int>(opcode) << "\n";
            std::abort();
            break;
        }
        break;
    case InstructionType::EBREAK:
        rs1Type = RegType::None;
        rs2Type = RegType::None;
        rdType = RegType::None;
        break;
    case InstructionType::NOP:
        rs1Type = RegType::None;
        rs2Type = RegType::None;
        rdType = RegType::None;
        break;
    default:
        std::cerr << "getRegType error\n"
                  << "  opcode = " << static_cast<int>(opcode) << "\n";
        std::abort();
        break;
    }
}

std::string opcodeToString(Opcode opcode)
{
    switch (opcode)
    {
    case Opcode::ADD:
        return "ADD";
    case Opcode::SUB:
        return "SUB";
    case Opcode::AND:
        return "AND";
    case Opcode::OR:
        return "OR";
    case Opcode::XOR:
        return "XOR";
    case Opcode::SLL:
        return "SLL";
    case Opcode::SRL:
        return "SRL";
    case Opcode::SRA:
        return "SRA";
    case Opcode::SLT:
        return "SLT";
    case Opcode::SLTU:
        return "SLTU";
    case Opcode::DIV:
        return "DIV";
    case Opcode::ADDI:
        return "ADDI";
    case Opcode::SLTI:
        return "SLTI";
    case Opcode::SLTIU:
        return "SLTIU";
    case Opcode::XORI:
        return "XORI";
    case Opcode::ORI:
        return "ORI";
    case Opcode::ANDI:
        return "ANDI";
    case Opcode::SLLI:
        return "SLLI";
    case Opcode::SRLI:
        return "SRLI";
    case Opcode::SRAI:
        return "SRAI";
    case Opcode::LB:
        return "LB";
    case Opcode::LW:
        return "LW";
    case Opcode::JALR:
        return "JALR";
    case Opcode::SB:
        return "SB";
    case Opcode::SW:
        return "SW";
    case Opcode::BEQ:
        return "BEQ";
    case Opcode::BNE:
        return "BNE";
    case Opcode::BLT:
        return "BLT";
    case Opcode::BGE:
        return "BGE";
    case Opcode::BLTU:
        return "BLTU";
    case Opcode::BGEU:
        return "BGEU";
    case Opcode::LUI:
        return "LUI";
    case Opcode::AUIPC:
        return "AUIPC";
    case Opcode::JAL:
        return "JAL";
    case Opcode::FADD:
        return "FADD";
    case Opcode::FSUB:
        return "FSUB";
    case Opcode::FMUL:
        return "FMUL";
    case Opcode::FDIV:
        return "FDIV";
    case Opcode::FSQRT:
        return "FSQRT";
    case Opcode::FSGNJ:
        return "FSGNJ";
    case Opcode::FSGNJN:
        return "FSGNJN";
    case Opcode::FSGNJX:
        return "FSGNJX";
    case Opcode::FEQ:
        return "FEQ";
    case Opcode::FLT:
        return "FLT";
    case Opcode::FLE:
        return "FLE";
    case Opcode::FISQRT:
        return "FISQRT";
    case Opcode::FINV:
        return "FINV";
    case Opcode::FLOOR:
        return "FLOOR";
    case Opcode::FTOI:
        return "FTOI";
    case Opcode::ITOF:
        return "ITOF";
    case Opcode::FMV:
        return "FMV";
    case Opcode::FLW:
        return "FLW";
    case Opcode::FSW:
        return "FSW";
    case Opcode::EBREAK_CODE:
        return "EBREAK";
    case Opcode::NOP_CODE:
        return "NOP";
    default:
        return "UNKNOWN";
    }
}