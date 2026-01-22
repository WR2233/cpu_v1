#ifndef INSTRUCTION_H
#define INSTRUCTION_H

#include <cstdint>
#include <string>

// 命令タイプ
enum class InstructionType
{
    R_TYPE, // レジスタ型 (add, sub, and, or等)
    I_TYPE, // 即値型 (addi, lw等)
    S_TYPE, // ストア型 (sw, sb, sh)
    B_TYPE, // 分岐型 (beq, bne, blt等)
    U_TYPE, // 上位即値型 (lui, auipc)
    J_TYPE, // ジャンプ型 (jal)
    F_TYPE, // 浮動小数点R型 (fadd, fsub等)
    EBREAK, // 実行終了 (ebreak)
    NOP     // No Operation
};

// オペコード (RISC-V RV32I + F拡張)
enum class Opcode
{
    // R-Type 整数演算 (opcode = 0b0110011 = 0x33)
    ADD = 0x00,
    SUB = 0x01,
    SLL = 0x02,
    SLT = 0x03,
    SLTU = 0x04,
    XOR = 0x05,
    SRL = 0x06,
    SRA = 0x07,
    OR = 0x08,
    AND = 0x09,

    DIV = 0x0B,

    // I-Type 即値演算 (opcode = 0b0010011 = 0x13)
    ADDI = 0x10,
    SLTI = 0x11,
    SLTIU = 0x12,
    XORI = 0x13,
    ORI = 0x14,
    ANDI = 0x15,
    SLLI = 0x16,
    SRLI = 0x17,
    SRAI = 0x18,

    // I-Type ロード命令 (opcode = 0b0000011 = 0x03)
    LB = 0x20,
    LW = 0x22,

    // I-Type 浮動小数点ロード (opcode = 0b0000111 = 0x07)
    FLW = 0x25,

    // S-Type ストア命令 (opcode = 0b0100011 = 0x23)
    SB = 0x30,
    SW = 0x32,

    // S-Type 浮動小数点ストア (opcode = 0b0100111 = 0x27)
    FSW = 0x33,

    // B-Type 分岐命令 (opcode = 0b1100011 = 0x63)
    BEQ = 0x40,
    BNE = 0x41,
    BLT = 0x42,
    BGE = 0x43,
    BLTU = 0x44,
    BGEU = 0x45,

    // J-Type ジャンプ命令
    JAL = 0x50,  // opcode = 0b1101111 = 0x6F
    JALR = 0x51, // opcode = 0b1100111 = 0x67 (I-Type形式)

    // U-Type 上位即値命令
    LUI = 0x60,   // opcode = 0b0110111 = 0x37
    AUIPC = 0x61, // opcode = 0b0010111 = 0x17

    // F-Type 浮動小数点演算 (opcode = 0b1010011 = 0x53)
    FADD = 0x70,
    FSUB = 0x71,
    FMUL = 0x72,
    FDIV = 0x73,
    FSQRT = 0x74,
    FSGNJ = 0x75,
    FSGNJN = 0x76,
    FSGNJX = 0x77,
    FEQ = 0x7A,
    FLT = 0x7B,
    FLE = 0x7C,

    FISQRT = 0x7D,
    FINV = 0x7E,
    FLOOR = 0x7F,
    FTOI = 0x80,
    ITOF = 0x81,
    FMV = 0x82,

    EBREAK_CODE = 0XFE,
    NOP_CODE = 0xFF
};

// レジスタファイル種別
enum class RegType
{
    Int,
    Fp,
    None
};

std::string opcodeToString(Opcode opcode);

// 命令構造体
struct Instruction
{
    uint32_t raw; // 生の32ビット命令
    InstructionType type;
    Opcode opcode;

    // 共通フィールド
    uint8_t rs1;    // ソースレジスタ1 (RISC-V: rs1)
    uint8_t rs2;    // ソースレジスタ2 (RISC-V: rs2)
    uint8_t rd;     // デスティネーションレジスタ
    uint8_t funct3; // 機能コード3ビット
    uint8_t funct7; // 機能コード7ビット (R-Type)

    RegType rs1Type;
    RegType rs2Type;
    RegType rdType;

    // 即値フィールド
    int32_t immediate; // 符号拡張済み即値 (I/S/B/U/J型で使用)

    // 浮動小数点用 (FType)
    uint8_t funct5; // 5ビット機能コード
    uint8_t fmt;    // フォーマット (00=S, 01=D)
    uint8_t rm;     // 丸めモード

    Instruction() : raw(0), type(InstructionType::NOP), opcode(Opcode::NOP_CODE),
                    rs1(0), rs2(0), rd(0), funct3(0), funct7(0),
                    rs1Type(RegType::None), rs2Type(RegType::None), rdType(RegType::None),
                    immediate(0), funct5(0), fmt(0), rm(0) {}

    // 32ビット機械語からデコード
    void decode(uint32_t instruction);

    // 命令を文字列で表示
    std::string toString() const;

private:
    // 符号拡張ヘルパー
    int32_t signExtend(uint32_t value, int bits) const;

    // 各命令タイプのデコードヘルパー
    void decodeRType();
    void decodeIType();
    void decodeLoadType();
    void decodeSType();
    void decodeBType();
    void decodeJAL();
    void decodeFType();
    void getRegType();
};

#endif // INSTRUCTION_H
