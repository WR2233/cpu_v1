"""RISC-V Instruction Decoder"""

from .data_types import RType, IType, SType, BType, UType, JType
import numpy as np


def sign_extend(bits: int, value: int) -> int:
    """Sign extend a value to 32 bits"""
    sign_bit = 1 << (bits - 1)
    if value & sign_bit:
        return value | ((-1) << bits)
    return value


def get_opcode(inst: int) -> int:
    return inst & 0x7F


def get_rd(inst: int) -> int:
    return (inst >> 7) & 0x1F


def get_funct3(inst: int) -> int:
    return (inst >> 12) & 0x7


def get_rs1(inst: int) -> int:
    return (inst >> 15) & 0x1F


def get_rs2(inst: int) -> int:
    return (inst >> 20) & 0x1F


def get_funct7(inst: int) -> int:
    return (inst >> 25) & 0x7F


def decode_i_imm(inst: int) -> int:
    """Decode I-type immediate"""
    imm = (inst >> 20) & 0xFFF
    return sign_extend(12, imm)


def decode_s_imm(inst: int) -> int:
    """Decode S-type immediate"""
    imm11_5 = (inst >> 25) & 0x7F
    imm4_0 = (inst >> 7) & 0x1F
    imm = (imm11_5 << 5) | imm4_0
    return sign_extend(12, imm)


def decode_b_imm(inst: int) -> int:
    """Decode B-type immediate"""
    imm12 = (inst >> 31) & 0x1
    imm10_5 = (inst >> 25) & 0x3F
    imm4_1 = (inst >> 8) & 0xF
    imm11 = (inst >> 7) & 0x1
    imm = (imm12 << 12) | (imm11 << 11) | (imm10_5 << 5) | (imm4_1 << 1)
    return sign_extend(13, imm)


def decode_u_imm(inst: int) -> int:
    """Decode U-type immediate"""
    return inst & 0xFFFFF000


def decode_j_imm(inst: int) -> int:
    """Decode J-type immediate"""
    imm20 = (inst >> 31) & 0x1
    imm10_1 = (inst >> 21) & 0x3FF
    imm11 = (inst >> 20) & 0x1
    imm19_12 = (inst >> 12) & 0xFF
    imm = (imm20 << 20) | (imm19_12 << 12) | (imm11 << 11) | (imm10_1 << 1)
    return sign_extend(21, imm)


def decode(inst: int):
    """Decode a RISC-V instruction"""
    opcode = get_opcode(inst)

    # R-type: ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND, MUL, FMV, etc.
    if opcode in [0x33, 0x3B, 0x53, 0x74]:
        return RType(
            opcode=opcode,
            rd=get_rd(inst),
            funct3=get_funct3(inst),
            rs1=get_rs1(inst),
            rs2=get_rs2(inst),
            funct7=get_funct7(inst)
        )

    # I-type: ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI, LW, LD, FLW, etc.
    elif opcode in [0x13, 0x1B, 0x03, 0x67, 0x73, 0x07]:
        return IType(
            opcode=opcode,
            rd=get_rd(inst),
            funct3=get_funct3(inst),
            rs1=get_rs1(inst),
            imm=decode_i_imm(inst)
        )

    # S-type: SB, SW, SD, FSW, FSD
    elif opcode in [0x23, 0x27]:
        return SType(
            opcode=opcode,
            funct3=get_funct3(inst),
            rs1=get_rs1(inst),
            rs2=get_rs2(inst),
            imm=decode_s_imm(inst)
        )

    # B-type: BEQ, BNE, BLT, BGE, BLTU, BGEU
    elif opcode == 0x63:
        return BType(
            opcode=opcode,
            funct3=get_funct3(inst),
            rs1=get_rs1(inst),
            rs2=get_rs2(inst),
            imm=decode_b_imm(inst)
        )

    # U-type: LUI, AUIPC
    elif opcode in [0x37, 0x17]:
        return UType(
            opcode=opcode,
            rd=get_rd(inst),
            imm=decode_u_imm(inst)
        )

    # J-type: JAL
    elif opcode == 0x6F:
        return JType(
            opcode=opcode,
            rd=get_rd(inst),
            imm=decode_j_imm(inst)
        )

    else:
        raise ValueError(f"Unknown opcode: 0x{opcode:x}")
