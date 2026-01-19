"""Simple RISC-V Assembler"""
import re
from typing import List, Dict, Tuple
import argparse


# Register name to number mapping
REGISTERS = {
    'zero': 0, 'ra': 1, 'sp': 2, 'gp': 3, 'tp': 4,
    't0': 5, 't1': 6, 't2': 7,
    's0': 8, 'fp': 8, 's1': 9,
    'a0': 10, 'a1': 11, 'a2': 12, 'a3': 13, 'a4': 14, 'a5': 15, 'a6': 16, 'a7': 17,
    's2': 18, 's3': 19, 's4': 20, 's5': 21, 's6': 22, 's7': 23, 's8': 24, 's9': 25, 's10': 26, 's11': 27,
    't3': 28, 't4': 29, 't5': 30, 't6': 31,
}

# Also allow x0-x31 register names
for i in range(32):
    REGISTERS[f'x{i}'] = i

# Floating-point registers
# ft0-ft7: temporary
# fs0-fs11: saved
# fa0-fa7: arguments/return values
FP_REGISTERS = {
    'ft0': 0, 'ft1': 1, 'ft2': 2, 'ft3': 3, 'ft4': 4, 'ft5': 5, 'ft6': 6, 'ft7': 7,
    'fs0': 8, 'fs1': 9,
    'fa0': 10, 'fa1': 11, 'fa2': 12, 'fa3': 13, 'fa4': 14, 'fa5': 15, 'fa6': 16, 'fa7': 17,
    'fs2': 18, 'fs3': 19, 'fs4': 20, 'fs5': 21, 'fs6': 22, 'fs7': 23, 'fs8': 24, 'fs9': 25, 'fs10': 26, 'fs11': 27,
    'ft8': 28, 'ft9': 29, 'ft10': 30, 'ft11': 31,
}

# Also allow f0-f31 register names
for i in range(32):
    FP_REGISTERS[f'f{i}'] = i

def get_label_addr(label, labels, labels_with_file_num=None, file_num=None, data_labels=None):
    """ラベル解決を優先順位に従って行う: 同じファイル内 > データセクション > 全てのファイル内

    Args:
        label: 解決したいラベル名
        labels: 全てのファイルに対する ラベル名 -> address の Dict
        labels_with_file_num: (label (string), file_num (int) ) -> address の Dict (どっちでもいい)
        file_num: 解決したいラベルの属するfile_num (なくてもいい)
        data_labels: Data section に対する ラベル名 -> address のDict (なくてもいい)

    Returns:
        Label address
    """
    # Priority 1: Same file label
    if labels_with_file_num is not None and file_num is not None:
        if (label, file_num) in labels_with_file_num:
            return labels_with_file_num[(label, file_num)]

    # Priority 2: Data labels 
    if data_labels is not None and label in data_labels:
        return data_labels[label]

    # Priority 3: Global labels 
    if label in labels:
        return labels[label]

    raise ValueError(f"Undefined label: {label}")

def parse_register(reg: str) -> int:
    """Parse register name to register number (integer or floating-point)
    Args:
       reg: レジスタ名の文字列 (例: "x0", "a0", "ft0", "f0")
    Returns:       レジスタ番号 (0-31)
    """
    reg = reg.strip().lower()
    if reg in REGISTERS:
        return REGISTERS[reg]
    if reg in FP_REGISTERS:
        return FP_REGISTERS[reg]
    raise ValueError(f"Unknown register: {reg}")


def parse_immediate(imm: str) -> int:
    """Parse immediate value (decimal or hex)"""
    imm = imm.strip()
    if imm.startswith('0x'):
        return int(imm, 16)
    return int(imm)


def parse_immediate_frac(imm: str) -> int:
    """Parse floating-point immediate value and convert to 32-bit representation
    Args:
        imm: 浮動小数点数の文字列 (例: "3.14", "-2.5", "1.0e-5")
    Returns:
        IEEE 754 単精度浮動小数点形式の32ビット整数表現
    """
    import struct
    imm = imm.strip()
    # 文字列を浮動小数点数に変換
    float_val = float(imm)
    # IEEE 754 単精度形式（32ビット）にパック
    packed = struct.pack('!f', float_val)
    # バイト列を32ビット整数として解釈
    int_repr = struct.unpack('!I', packed)[0]
    return int_repr 


def sign_extend(value: int, bits: int) -> int:
    """Sign extend a value to 32 bits"""
    sign_bit = 1 << (bits - 1)
    if value & sign_bit:
        value |= (-1 << bits)
    return value & 0xFFFFFFFF


def encode_r_type(opcode: int, rd: int, funct3: int, rs1: int, rs2: int, funct7: int) -> int:
    """Encode R-type instruction"""
    return (funct7 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode


def encode_i_type(opcode: int, rd: int, funct3: int, rs1: int, imm: int) -> int:
    """Encode I-type instruction"""
    imm = imm & 0xFFF  # 12-bit immediate
    return (imm << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode


def encode_s_type(opcode: int, funct3: int, rs1: int, rs2: int, imm: int) -> int:
    """Encode S-type instruction"""
    imm = imm & 0xFFF
    imm_11_5 = (imm >> 5) & 0x7F
    imm_4_0 = imm & 0x1F
    return (imm_11_5 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (imm_4_0 << 7) | opcode


def encode_b_type(opcode: int, funct3: int, rs1: int, rs2: int, imm: int) -> int:
    """Encode B-type instruction"""
    # immが13bitを超えていたら分解
    # これだけ8バイトを返します
    if -4096 <= imm < 4096:
        imm_12 = (imm >> 12) & 1
        imm_10_5 = (imm >> 5) & 0x3F
        imm_4_1 = (imm >> 1) & 0xF
        imm_11 = (imm >> 11) & 1
        branch = (imm_12 << 31) | (imm_10_5 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (imm_4_1 << 8) | (imm_11 << 7) | opcode
        nope = encode_i_type(0b0010011, 0, 0b000, 0, 0)
        res =  (branch << 32) | nope
    elif imm < -1048576 or 1048576 <= imm:
        raise ValueError(f"exceed jmp max offset: {imm}")
    else:
        imm_ = 8
        imm_12 = (imm_ >> 12) & 1
        imm_10_5 = (imm_ >> 5) & 0x3F
        imm_4_1 = (imm_ >> 1) & 0xF
        imm_11 = (imm_ >> 11) & 1
        funct3 = funct3 ^ 1
        branch = (imm_12 << 31) | (imm_10_5 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (imm_4_1 << 8) | (imm_11 << 7) | opcode
        jump = encode_j_type(0b1101111, 0, imm - 4)
        res = (branch << 32) | jump
    return res


def encode_u_type(opcode: int, rd: int, imm: int) -> int:
    """Encode U-type instruction"""
    imm = (imm >> 12) & 0xFFFFF  # Upper 20 bits
    return (imm << 12) | (rd << 7) | opcode


def encode_j_type(opcode: int, rd: int, imm: int) -> int:
    """Encode J-type instruction"""
    if imm < -1048576 or 1048576 <= imm:
        raise ValueError(f"exceed jmp max offset: {imm}")
    imm = imm & 0x1FFFFF
    imm_20 = (imm >> 20) & 1
    imm_10_1 = (imm >> 1) & 0x3FF
    imm_11 = (imm >> 11) & 1
    imm_19_12 = (imm >> 12) & 0xFF
    # J-type format: imm[20|10:1|11|19:12] rd opcode
    return (imm_20 << 31) | (imm_10_1 << 21) | (imm_11 << 20) | (imm_19_12 << 12) | (rd << 7) | opcode

def assemble_instruction(inst: str, labels: Dict[str, int], data_labels: Dict[str, int], pc: int, labels_with_file_num: Dict = None, file_num: int = None) -> int:
    """Assemble a single instruction
    Args:
       inst: アセンブリ命令の文字列 （例: "add x1, x2, x3"）
       labels: ラベルの辞書 （ラベル名 -> アドレス）(例: {loop: 0x004000} )
       data_labels: データラベルの辞書 （ラベル名 -> アドレス）(例: {pi: 0x80000000} )
       pc: 現在のプログラムカウンタ（命令アドレス）
       labels_with_file_num: ファイル番号付きラベルの辞書（オプション）
       file_num: 現在のファイル番号（オプション）
    """
    parts = re.split(r'[,\s()]+', inst.strip())
    parts = [p for p in parts if p]  # 空語を削除

    if not parts:
        return 0

    opcode = parts[0].lower()

    # R-type instructions
    if opcode == 'add':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b000, rs1, rs2, 0b0000000)
    elif opcode == 'sub':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b000, rs1, rs2, 0b0100000)
    elif opcode == 'or':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b110, rs1, rs2, 0b0000000)
    elif opcode == 'and':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b111, rs1, rs2, 0b0000000)
    elif opcode == 'sll':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b001, rs1, rs2, 0b0000000)
    elif opcode == 'slt':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b010, rs1, rs2, 0b0000000)
    elif opcode == 'sltu':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b011, rs1, rs2, 0b0000000)
    elif opcode == 'xor':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b100, rs1, rs2, 0b0000000)
    elif opcode == 'srl':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b101, rs1, rs2, 0b0000000)
    elif opcode == 'sra':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b101, rs1, rs2, 0b0100000)

    # RV32M:  Division
    elif opcode == 'div':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b0110011, rd, 0b100, rs1, rs2, 0b0000001)

    # I-type instructions
    elif opcode == 'addi':
        rd, rs1, imm = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b000, rs1, imm)
    elif opcode == 'slti':
        rd, rs1, imm = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b010, rs1, imm)
    elif opcode == 'sltiu':
        rd, rs1, imm = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b011, rs1, imm)
    elif opcode == 'xori':
        rd, rs1, imm = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b100, rs1, imm)
    elif opcode == 'ori':
        rd, rs1, imm = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b110, rs1, imm)
    elif opcode == 'andi':
        rd, rs1, imm = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b111, rs1, imm)
    elif opcode == 'slli':
        rd, rs1, shamt = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b001, rs1, shamt)
    elif opcode == 'srli':
        rd, rs1, shamt = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b101, rs1, shamt)
    elif opcode == 'srai':
        rd, rs1, shamt = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b0010011, rd, 0b101, rs1, shamt | 0x400)

    # Load instructions
    elif opcode == 'lb':
        rd, imm, rs1 = parse_register(parts[1]), parse_immediate(parts[2]), parse_register(parts[3])
        return encode_i_type(0b0000011, rd, 0b000, rs1, imm)
    elif opcode == 'lw':
        rd, imm, rs1 = parse_register(parts[1]), parse_immediate(parts[2]), parse_register(parts[3])
        return encode_i_type(0b0000011, rd, 0b010, rs1, imm)
    elif opcode == 'flw':
        rd, imm, rs1 = parse_register(parts[1]), parse_immediate(parts[2]), parse_register(parts[3])
        return encode_i_type(0b0000111, rd, 0b010, rs1, imm)

    # Store instructions
    elif opcode == 'sb':
        rs2, imm, rs1 = parse_register(parts[1]), parse_immediate(parts[2]), parse_register(parts[3])
        return encode_s_type(0b0100011, 0b000, rs1, rs2, imm)
    elif opcode == 'sw':
        rs2, imm, rs1 = parse_register(parts[1]), parse_immediate(parts[2]), parse_register(parts[3])
        return encode_s_type(0b0100011, 0b010, rs1, rs2, imm)
    elif opcode == 'fsw':
        rs2, imm, rs1 = parse_register(parts[1]), parse_immediate(parts[2]), parse_register(parts[3])
        return encode_s_type(0b0100111, 0b010, rs1, rs2, imm)

    # Branch instructions
    elif opcode == 'beq':
        rs1, rs2, label = parse_register(parts[1]), parse_register(parts[2]), parts[3]
        label_pc = get_label_addr(label, labels, labels_with_file_num, file_num, data_labels)
        offset = label_pc - pc
        return encode_b_type(0b1100011, 0b000, rs1, rs2, offset)
    elif opcode == 'bne':
        rs1, rs2, label = parse_register(parts[1]), parse_register(parts[2]), parts[3]
        label_pc = get_label_addr(label, labels, labels_with_file_num, file_num, data_labels)
        offset = label_pc - pc
        return encode_b_type(0b1100011, 0b001, rs1, rs2, offset)
    elif opcode == 'blt':
        rs1, rs2, label = parse_register(parts[1]), parse_register(parts[2]), parts[3]
        label_pc = get_label_addr(label, labels, labels_with_file_num, file_num, data_labels)
        offset = label_pc - pc
        return encode_b_type(0b1100011, 0b100, rs1, rs2, offset)
    elif opcode == 'bge':
        rs1, rs2, label = parse_register(parts[1]), parse_register(parts[2]), parts[3]
        label_pc = get_label_addr(label, labels, labels_with_file_num, file_num, data_labels)
        offset = label_pc - pc
        return encode_b_type(0b1100011, 0b101, rs1, rs2, offset)
    elif opcode == 'bltu':
        rs1, rs2, label = parse_register(parts[1]), parse_register(parts[2]), parts[3]
        label_pc = get_label_addr(label, labels, labels_with_file_num, file_num, data_labels)
        offset = label_pc - pc
        return encode_b_type(0b1100011, 0b110, rs1, rs2, offset)
    elif opcode == 'bgeu':
        rs1, rs2, label = parse_register(parts[1]), parse_register(parts[2]), parts[3]
        label_pc = get_label_addr(label, labels, labels_with_file_num, file_num, data_labels)
        offset = label_pc - pc
        return encode_b_type(0b1100011, 0b111, rs1, rs2, offset)

    # Jump instructions
    elif opcode == 'jal':
        # jal label -> jal ra, label にしてから処理
        # jal rd, label そのまま処理
        if len(parts) == 2:
            rd = 1  # ra
            label = parts[1]
        else:
            rd = parse_register(parts[1])
            label = parts[2]
        label_pc = get_label_addr(label, labels, labels_with_file_num, file_num, data_labels)
        offset = label_pc - pc
        return encode_j_type(0b1101111, rd, offset)
    elif opcode == 'jalr':
        rd, rs1, imm = parse_register(parts[1]), parse_register(parts[2]), parse_immediate(parts[3])
        return encode_i_type(0b1100111, rd, 0b000, rs1, imm)

    # U-type instructions
    elif opcode == 'lui':
        rd, imm = parse_register(parts[1]), parse_immediate(parts[2])
        return encode_u_type(0b0110111, rd, imm)
    elif opcode == 'auipc':
        rd, imm = parse_register(parts[1]), parse_immediate(parts[2])
        return encode_u_type(0b0010111, rd, imm)
    
    # Floating-point arithmetic (single precision)
    elif opcode ==  'fadd':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b000, rs1, rs2, 0b0000000)
    elif opcode == 'fsub':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b000, rs1, rs2, 0b0000100)
    elif opcode == 'fmul':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b000, rs1, rs2, 0b0001000)
    elif opcode == 'fdiv':
        print("fdiv inst is detected !!")
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b000, rs1, rs2, 0b0001100)
    elif opcode == 'fsqrt':
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1010011, rd, 0b000, rs1, 0b00000, 0b0101100)
    
    # Floating-point move and sign manipulation
    elif opcode == 'fsgnj':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b000, rs1, rs2, 0b0010000)
    elif opcode == 'fsgnjn':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b001, rs1, rs2, 0b0010000)
    elif opcode == 'fsgnjx':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b010, rs1, rs2, 0b0010000)
    elif opcode == 'fneg':
        # fneg.s rd, rs1 -> fsgnjn.s rd, rs1, rs1 (copy sign-negated value)
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1010011, rd, 0b001, rs1, rs1, 0b0010000)
    elif opcode == 'fabs':
        # fabs.s rd, rs1 -> fsgnjx.s rd, rs1, rs1 (absolute value)
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1010011, rd, 0b010, rs1, rs1, 0b0010000)
    
    elif opcode == 'fisqrt':
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1010011, rd, 0b000, rs1, 0b00000, 0b0010001)  
    elif opcode == 'finv':
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1010011, rd, 0b000, rs1, 0b00000, 0b0010010)
    elif opcode == 'floor':
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1010011, rd, 0b000, rs1, 0b00000, 0b0010011)
    elif opcode == 'ftoi':
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1010011, rd, 0b000, rs1, 0b00000, 0b0010100)
    elif opcode == 'itof':
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1010011, rd, 0b000, rs1, 0b00000, 0b0010101)
    elif opcode == 'fmv':
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_r_type(0b1110100, rd, 0b000, rs1, 0b00000, 0b0000000) # rs2は0b0にする, funct7はなんでもいい
    # Floating-point comparison
    elif opcode == 'feq':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b010, rs1, rs2, 0b1010000)
    elif opcode == 'flt':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b001, rs1, rs2, 0b1010000)
    elif opcode == 'fle':
        rd, rs1, rs2 = parse_register(parts[1]), parse_register(parts[2]), parse_register(parts[3])
        return encode_r_type(0b1010011, rd, 0b000, rs1, rs2, 0b1010000)

    # System instructions
    elif opcode == 'ebreak':
        return encode_i_type(0b1110011, 0, 0b000, 0, 1)  # EBREAK

    # Pseudo-instructions
    elif opcode == 'nope':
        return encode_i_type(0b0010011, 0, 0b000, 0, 0)  # addi x0, x0, 0
    elif opcode == 'li':
        rd, imm = parse_register(parts[1]), parse_immediate(parts[2])
        return encode_i_type(0b0010011, rd, 0b000, 0, imm)  # addi rd, x0, imm
    elif opcode == 'mv':
        rd, rs1 = parse_register(parts[1]), parse_register(parts[2])
        return encode_i_type(0b0010011, rd, 0b000, rs1, 0)  # addi rd, rs1, 0
    elif opcode == 'j':
        label = parts[1]
        label_pc = get_label_addr(label, labels, labels_with_file_num, file_num, data_labels)
        offset = label_pc - pc
        return encode_j_type(0b1101111, 0, offset)  # jal x0, offset
    elif opcode == 'ret':
        return encode_i_type(0b1100111, 0, 0b000, 1, 0)  # jalr x0, ra, 0
    
    #special instrucion
    elif opcode == 'end_code':
        return 0b00000000000000000000000000000000 #32bitの0

    raise ValueError(f"Unknown instruction: {opcode}")

def get_file_num(line_num :int, file_change_line :List[int]) -> int :
    """line_numから,そのlineの属するfile_numを返す

    Args:
        line_num (int): 行番号
        file_change_line (List[int]): fileの変化する行番号

    Returns:
        int: line_numの属するfile番号
    """
    for i in range(len(file_change_line)-1):
        if line_num >= file_change_line[i] and line_num < file_change_line[i+1]:
            return i
    # 最後のファイルの場合
    return len(file_change_line) - 1

def first_assemble(lines: List[str], file_change_line: List[int]) :
    is_code = True
    pc = 0
    line_num = 0
    instructions = [] # (pc, inst, file_num, line_num) のタプルのリスト
    labels_with_file_num = {}
    labels = {}
    data_labels = {}
    data_memory = [] # データセクションのメモリ内容 (バイト単位)
    data_pc = 0x80000000  # BRAMの先頭アドレス
    
    for line in lines:
        # Remove comments
        if '#' in line:
            line = line[:line.index('#')]
        line = line.strip()

        if not line:
            line_num += 1  # Count even blank/comment lines
            continue
        if line == ".data":
            is_code = False
            file_num = get_file_num(line_num, file_change_line)
            instructions.append((pc, "end_code", file_num, line_num))
            pc += 4
            continue
        file_num = get_file_num(line_num, file_change_line)
        # Check for label
        if ':' in line:
            label = line[:line.index(':')].strip()
            rest = line[line.index(':') + 1:].strip()
            if is_code:
                labels_with_file_num[(label, file_num)] = pc
                labels[label] = pc
                if rest:
                    instructions.append((pc, rest, file_num, line_num))
                    rest_lower = rest.strip().lower()
                    # la命令は2命令に展開されるので8バイト分確保
                    if rest_lower.startswith('la'):
                        pc += 8
                    # fdiv疑似命令も2命令に展開されるので8バイト分確保
                    elif rest_lower.startswith('fdiv'):
                        pc += 8
                    # 分岐命令は常に8バイト使うと仮定
                    elif rest_lower.startswith('b'):
                        pc += 8
                    else:
                        pc += 4
            else:
                # .dataセクション内のラベル
                data_labels[label] = data_pc
                # ラベルの後に命令がある場合は処理
                if rest:
                    # .word や .zero などのディレクティブを処理
                    if rest.startswith('.word'):
                        value_str = rest.split(None, 1)[1].strip()
                        value = parse_immediate(value_str)
                        # 4バイトのデータを追加（リトルエンディアン）
                        data_memory.extend([
                            (value >> 0) & 0xFF,
                            (value >> 8) & 0xFF,
                            (value >> 16) & 0xFF,
                            (value >> 24) & 0xFF,
                        ])
                        data_pc += 4
                    elif rest.startswith('.zero'):
                        size_str = rest.split(None, 1)[1].strip()
                        size = parse_immediate(size_str)
                        data_memory.extend([0] * size)
                        data_pc += size
        else:
            if is_code:
                instructions.append((pc, line, file_num, line_num))
                line_lower = line.strip().lower()
                # la命令は2命令に展開されるので8バイト分確保
                if line_lower.startswith('la'):
                    pc += 8
                # fdiv疑似命令も2命令に展開されるので8バイト分確保
                elif line_lower.startswith('fdiv'):
                    pc += 8
                # 分岐命令は常に8バイト使うと仮定
                elif line_lower.startswith('b'):
                    pc += 8
                else:
                    pc += 4
            else:
                # .dataセクション内のディレクティブ
                if line.startswith('.word'):
                    value_str = line.split(None, 1)[1].strip()
                    value = parse_immediate(value_str)
                    data_memory.extend([
                        (value >> 0) & 0xFF,
                        (value >> 8) & 0xFF,
                        (value >> 16) & 0xFF,
                        (value >> 24) & 0xFF,
                    ])
                    data_pc += 4
                elif line.startswith('.zero'):
                    size_str = line.split(None, 1)[1].strip()
                    size = parse_immediate(size_str)
                    data_memory.extend([0] * size)
                    data_pc += size
        line_num += 1
    return instructions, labels, labels_with_file_num, data_labels, data_memory

def second_assemble(instructions: List, labels: Dict, labels_with_file_num: Dict, data_labels: Dict, data_memory: List) :
    """Convert instructions to machine code

    Args:
        instructions: List of (pc, inst, file_num, line_num) tuples from first_assemble
        labels: Label to address mapping
        labels_with_file_num: Label with file number to address mapping
        data_labels: Data section label to address mapping
        data_memory: Data section bytes

    Returns:
        Tuple of (binary, pc_to_source_line) where binary is list of 32-bit words
    """
    binary = []
    output_pc = 0  # バイナリ出力位置（実際のアドレス）
    pc_to_source_line = {}

    for label_pc, inst, current_file_num, source_line_num in instructions:
        # label_pc: first_assembleで計算されたPC（ラベル解決用）
        # output_pc: 実際のバイナリ出力でのPC位置

        # 擬似命令の処理
        parts = re.split(r'[,\s()]+', inst.strip())
        parts = [p for p in parts if p]  # 空文字を削除
        if not parts:
            continue
        opcode = parts[0].lower()

        # la疑似命令を展開（lui + addi）
        if opcode == 'la':
            label = parts[2]
            addr = get_label_addr(label, labels, labels_with_file_num, current_file_num, data_labels)

            upper_20 = (addr + 0x800) >> 12  # 上位20ビット
            lower_12 = sign_extend(addr & 0xFFF, 12)

            # lui命令（label_pcを使ってラベル解決）
            lui_inst = f"lui {parts[1]}, {upper_20 << 12}"
            binary.append(assemble_instruction(lui_inst, labels, data_labels, label_pc, labels_with_file_num, current_file_num))
            pc_to_source_line[output_pc] = source_line_num + 1  # +1 for 1-indexed
            output_pc += 4

            # addi命令
            addi_inst = f"addi {parts[1]}, {parts[1]}, {lower_12}"
            binary.append(assemble_instruction(addi_inst, labels, data_labels, label_pc + 4, labels_with_file_num, current_file_num))
            pc_to_source_line[output_pc] = source_line_num + 1
            output_pc += 4
            continue
        # fdiv疑似命令を展開する場合
        if opcode == 'fdiv':
            # finv命令
            finv_inst = f"finv fs11, {parts[3]}"
            binary.append(assemble_instruction(finv_inst, labels, data_labels, label_pc, labels_with_file_num, current_file_num))
            pc_to_source_line[output_pc] = source_line_num + 1
            output_pc += 4
        
            # fmul命令
            fmul_inst = f"fmul {parts[1]}, {parts[2]}, fs11"
            binary.append(assemble_instruction(fmul_inst, labels, data_labels, label_pc + 4, labels_with_file_num, current_file_num))
            pc_to_source_line[output_pc] = source_line_num + 1
            output_pc += 4
            continue

        # 通常の命令の処理
        try:
            code = assemble_instruction(inst, labels, data_labels, label_pc, labels_with_file_num, current_file_num)

            # 64ビットコード（2命令に展開される場合）
            if code >= (1 << 32):
                inst1 = code >> 32
                inst2 = code & ((1 << 32) - 1)
                binary.append(inst1)
                binary.append(inst2)
                pc_to_source_line[output_pc] = source_line_num + 1
                output_pc += 4
                pc_to_source_line[output_pc] = source_line_num + 1
                output_pc += 4
            else:
                # 通常の32ビット命令
                binary.append(code)
                pc_to_source_line[output_pc] = source_line_num + 1
                output_pc += 4
        except Exception as e:
            print(f"Error assembling instruction at PC={label_pc}: {inst}")
            print(f"  {e}")
            raise

    # データメモリを4バイト単位に変換してバイナリに追加
    data_words = []
    for i in range(0, len(data_memory), 4):
        if i + 3 < len(data_memory):
            word = (data_memory[i] |
                   (data_memory[i+1] << 8) |
                   (data_memory[i+2] << 16) |
                   (data_memory[i+3] << 24))
            data_words.append(word)
        else:
            # 4バイト未満の場合は0でパディング
            bytes_left = [0, 0, 0, 0]
            for j in range(len(data_memory) - i):
                bytes_left[j] = data_memory[i + j]
            word = (bytes_left[0] |
                   (bytes_left[1] << 8) |
                   (bytes_left[2] << 16) |
                   (bytes_left[3] << 24))
            data_words.append(word)
    # data sectionを命令列末尾に追加
    if data_words:
        binary.extend(data_words)
    return binary, pc_to_source_line

def assemble(source: str, file_change_line: List[int] = None, return_line_mapping: bool = False) -> List[List[int]]:
    """Assemble R assembly source code
    Args:
       source: アセンブリソースコードの文字列
       file_change_line: ファイル変更位置のリスト（オプション）
       return_line_mapping: True の場合、PC-行番号マッピングも返す（デバッガー用）
    Returns:
       return_line_mapping=False: 機械語のリスト（命令 + データ）
       return_line_mapping=True: (機械語のリスト, データ, pc_to_line_mapping)
    """
    if file_change_line is None:
        file_change_line = [0]  # デフォルト値

    lines = source.split('\n')

    #First: find コメント、ラベル、データラベル、その境目
    instructions, labels, labels_with_file_num, data_labels, data_memory = first_assemble(lines, file_change_line)

    # Second  機械語に変換
    binary, pc_to_source_line = second_assemble(instructions, labels, labels_with_file_num, data_labels, data_memory)
    
    if return_line_mapping:
        return binary, pc_to_source_line
    else:
        return binary


def assemble_file(input_file: str, output_file: str = None, output_format: str = "hex", data_output_file: str = None) -> List[int]:
    """Assemble a RISC-V assembly file
    Args:
       input_file: アセンブリファイルのパス
       output_file: 出力ファイルのパス（省略可能）
       output_format: 出力形式 ("hex" or "binary")
       data_output_file: データセクション出力ファイル（simulatorモードで使用）
    Returns:       機械語のリスト
    """
    with open(input_file, 'r', encoding='utf-8') as f:
        source = f.read()

    binary = assemble(source)

    if output_file:
        if output_format == 'binary':
            with open(output_file, 'wb') as f:
                for code in binary:
                    f.write(code.to_bytes(4, byteorder='little'))
        else:
            with open(output_file, 'w', encoding='utf-8') as f:
                for code in binary:
                    f.write(f"0x{code:08x}\n")
    return binary


def link_files(input_files, output=None, format='hex', assemble_output=None, pc_mapping_output=None):
    """Link multiple assembly files by merging source code

    Args:
        input_files: List of input assembly file paths
        output: Output file path (optional)
        format: Output format ('hex' or 'binary')
        data_output: Output file for data section (simulator mode)
        assemble_output: Output file for assembele code
        pc_mapping_output: Output file for PC to line mapping (for debugger)

    Returns:
        Combined binary list
    """

    # エラーハンドリング len(input_files) -> .s, .riscv, or .bin  
    #                                  -> .s or .riscv,
    ext_fst = input_files[0].split('.')[-1]
    if len(input_files) > 1:
        for file in input_files:
            ext = file.split('.')[-1]
            if (ext_fst != ext):
                raise ValueError(f"入力ファイルの拡張子が{ext_fst}と{ext}で異なります")
        if (ext_fst not in ["s", "riscv"]):
            raise ValueError(f"入力ファイルの拡張子: {ext_fst}は .s, .bin, .riscv を満たしません")
    else: 
        if (ext_fst not in ["s", "bin", "riscv"]):
            raise ValueError(f"入力ファイルの拡張子: {ext_fst}は .s, .bin, .riscv を満たしません")
            
    # 全てのアセンブリファイルをコンカットしてからassembleする
    print(f"Linking {len(input_files)} files...")

    # Read all source files
    file_change_line = [0]
    line_now = 0
    merged_code_sections = []
    merged_data_sections = []

    for file_path in input_files:
        print(f"  Reading {file_path}...")

        with open(file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()

        # code sectionと data sectionに分ける
        code_lines = []
        data_lines = []
        in_data_section = False

        for line in lines:
            stripped = line.strip()
            if stripped.startswith('.data'):
                in_data_section = True
            elif in_data_section:
                data_lines.append(line)
            else:
                code_lines.append(line)

        # ファイルの分かれ目にコメントをつける
        merged_code_sections.append(f"# --- File: {file_path} ---\n")
        if code_lines:
            merged_code_sections.extend(code_lines)
            if not code_lines[-1].endswith('\n'):
                merged_code_sections.append('\n')

            file_change_line.append(line_now + len(code_lines) + 1)
            line_now += len(code_lines) + 1
        else:
            # Data-only file: just add the marker
            file_change_line.append(line_now + 1)
            line_now += 1

        if data_lines:
            merged_data_sections.append(f"\n# --- Data from: {file_path} ---\n")
            merged_data_sections.extend(data_lines)

    # code sectionをコンカットした後に data sectionをコンカットする
    merged_source = ''.join(merged_code_sections)
    if merged_data_sections:
        merged_source += '\n.data\n'
        merged_source += ''.join(merged_data_sections)

    print(f"  Merged source: {len(merged_source)} characters")
    if assemble_output:
        with open(assemble_output, 'w', encoding='utf-8') as f:
                f.write(merged_source)
    if format=='assemble':
        return (merged_source, file_change_line)

    # Assemble the merged source
    print(f"  Assembling merged code...")
    binary, pc_to_line = assemble(merged_source, file_change_line, return_line_mapping=True)

    print(f"\nLinked {len(binary)} total instructions")

    # Write PC to line mapping if specified
    if pc_mapping_output:
        with open(pc_mapping_output, 'w', encoding='utf-8') as f:
            for pc in sorted(pc_to_line.keys()):
                f.write(f"{pc} {pc_to_line[pc]}\n")
        print(f"  Written PC mapping to {pc_mapping_output}")

    # Write output if specified
    if output:
        if format == 'hex':
            with open(output, 'w', encoding='utf-8') as f:
                for code in binary:
                    f.write(f"{code:08x}\n")
        else:  # binary
            with open(output, 'wb') as f:
                for code in binary:
                    f.write(code.to_bytes(4, byteorder='little'))
    return binary


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='RISC-V Assembler and Linker')
    parser.add_argument('input', nargs='+', help='Input assembly file(s) (.s) - multiple files will be linked')
    parser.add_argument('-o', '--output', help='Output file for instructions')
    parser.add_argument('-f', '--format', choices=['hex', 'binary'], default='hex',
                        help='Output format: hex (default) or binary')
    parser.add_argument('--assemble-output', help='アセンブリコードを返す, 複数ファイルが引数の時に使うと確認できる, 現状は正しいアセンブリではない')
    parser.add_argument('--pc-mapping', help='PC to source line mapping output file (for debugger)')

    args = parser.parse_args()
    binary = link_files(args.input, args.output, args.format, args.assemble_output, args.pc_mapping)
