"""RISC-V Instruction Executor"""

from .data_types import State, RType, IType, SType, BType, UType, JType
from .order import get_reg, set_reg, get_freg, set_freg
from .order import load_word, store_word, set_byte, get_byte
import numpy as np


def execute_r_type(state: State, inst: RType):
    """Execute R-type instruction"""
    rs1_val = get_reg(state, inst.rs1)
    rs2_val = get_reg(state, inst.rs2)
    result = 0

    if inst.opcode == 0x33:  # Integer R-type
        if inst.funct3 == 0x0:
            if inst.funct7 == 0x00:  # ADD 
                result = np.int32(rs1_val) + np.int32(rs2_val)
            elif inst.funct7 == 0x20:  # SUB 
                result = np.int32(rs1_val) - np.int32(rs2_val)
            elif inst.funct7 == 0x01:  # MUL 
                result = np.int32(rs1_val) * np.int32(rs2_val)
        elif inst.funct3 == 0x1:  # SLL
            result = rs1_val << (rs2_val & 0x1F)
        elif inst.funct3 == 0x2:  # SLT
            result = 1 if np.int32(rs1_val) < np.int32(rs2_val) else 0
        elif inst.funct3 == 0x3:  # SLTU
            result = 1 if (rs1_val & 0xFFFFFFFF) < (rs2_val & 0xFFFFFFFF) else 0
        elif inst.funct3 == 0x4:
            if inst.funct7 == 0x01:  # DIV 
                if rs2_val == 0:
                    result = 0xFFFFFFFF  # -1 in two's complement
                else:
                    result = np.int32(rs1_val) // np.int32(rs2_val)
            else: # XOR
                result = rs1_val ^ rs2_val
            
        elif inst.funct3 == 0x5:
            if inst.funct7 == 0x00:  # SRL 
                result = (rs1_val & 0xFFFFFFFF) >> (rs2_val & 0x1F)
            elif inst.funct7 == 0x20:  # SRA 
                result = np.int32(rs1_val) >> (rs2_val & 0x1F)
        elif inst.funct3 == 0x6:  # OR
            result = rs1_val | rs2_val
        elif inst.funct3 == 0x7:  # AND
            result = rs1_val & rs2_val

        set_reg(state, inst.rd, result)

    elif inst.opcode == 0x53:  # Floating-point R-type
        frs1_val = get_freg(state, inst.rs1)
        frs2_val = get_freg(state, inst.rs2)

        if inst.funct7 == 0x00:  # FADD
            fresult = frs1_val + frs2_val
        elif inst.funct7 == 0x04:  # FSUB
            fresult = frs1_val - frs2_val
        elif inst.funct7 == 0x08:  # FMUL
            fresult = frs1_val * frs2_val
        elif inst.funct7 == 0x0C:  # FDIV
            fresult = frs1_val / frs2_val
        elif inst.funct7 == 0x10:  # FSGNJ 系統
            if inst.funct3 == 0x0:  # FSGNJ
                # Copy sign of fs2 to magnitude of fs1
                fresult = np.copysign(frs1_val, frs2_val)
            elif inst.funct3 == 0x1:  # FSGNJN
                # Copy negated sign of fs2 to magnitude of fs1
                if inst.rs1 == inst.rs2:
                    # FNEG pseudo-instruction: fsgnjn rd, rs1, rs1
                    fresult = -frs1_val
                else:
                    # General case: magnitude of fs1 with negated sign of fs2
                    fresult = np.copysign(frs1_val, -frs2_val)
            elif inst.funct3 == 0x2:  # FSGNJX
                # XOR signs of fs1 and fs2
                if inst.rs1 == inst.rs2:
                    # FABS pseudo-instruction: fsgnjx rd, rs1, rs1
                    fresult = np.abs(frs1_val)
                else:
                    # General case: XOR signs
                    sign1 = np.signbit(frs1_val)
                    sign2 = np.signbit(frs2_val)
                    result_sign = sign1 ^ sign2
                    fresult = np.copysign(np.abs(frs1_val), -1.0 if result_sign else 1.0)
        elif inst.funct7 == 0x11:  # FISQRT (1/sqrt(x))
            fresult = np.float32(1.0) / np.sqrt(frs1_val)
        elif inst.funct7 == 0x12:  # FINV (1/x)
            fresult = np.float32(1.0) / frs1_val
        elif inst.funct7 == 0x13:  # FLOOR (float to int, floor)
            # 床関数: 小数レジスタに書き込む
            fresult = np.floor(frs1_val)
        elif inst.funct7 == 0x14:  # FTOI (float to int conversion)
            # 浮動小数点を整数に変換（四捨五入）
            int_result = round(frs1_val)
            set_reg(state, inst.rd, int_result)
            state.pc += 4
            return
        elif inst.funct7 == 0x15:  # ITOF (int to float conversion)
            # 整数を浮動小数点に変換 
            int_val = np.int32(get_reg(state, inst.rs1))
            fresult = np.float32(int_val)
        elif inst.funct7 == 0x2C:  # FSQRT
            fresult = np.sqrt(frs1_val)
        elif inst.funct7 == 0x50:  # FLE/FLT/FEQ
            if inst.funct3 == 0x0:  # FLE
                set_reg(state, inst.rd, 1 if frs1_val <= frs2_val else 0)
            elif inst.funct3 == 0x1:  # FLT
                set_reg(state, inst.rd, 1 if frs1_val < frs2_val else 0)
            elif inst.funct3 == 0x2:  # FEQ
                set_reg(state, inst.rd, 1 if frs1_val == frs2_val else 0)
            state.pc += 4
            return
        else:
            fresult = np.float32(0.0)
        set_freg(state, inst.rd, fresult)

    elif inst.opcode == 0x74:  # FMV (fmv xD, fS)
        # Move float register to integer register (as raw bits)
        frs1_val = get_freg(state, inst.rs1)
        int_bits = frs1_val.view(np.int32)
        set_reg(state, inst.rd, int(int_bits))

    state.pc += 4


def execute_i_type(state: State, inst: IType):
    """Execute I-type instruction"""
    rs1_val = get_reg(state, inst.rs1)
    imm = inst.imm

    if inst.opcode == 0x13:  # Integer I-type
        if inst.funct3 == 0x0:  # ADDI 
            result = np.int32(rs1_val) + np.int32(imm)
        elif inst.funct3 == 0x2:  # SLTI 
            result = 1 if np.int32(rs1_val) < np.int32(imm) else 0
        elif inst.funct3 == 0x3:  # SLTIU
            result = 1 if (rs1_val & 0xFFFFFFFF) < (imm & 0xFFFFFFFF) else 0
        elif inst.funct3 == 0x4:  # XORI
            result = rs1_val ^ imm
        elif inst.funct3 == 0x6:  # ORI
            result = rs1_val | imm
        elif inst.funct3 == 0x7:  # ANDI
            result = rs1_val & imm
        elif inst.funct3 == 0x1:  # SLLI
            shamt = imm & 0x1F
            result = rs1_val << shamt
        elif inst.funct3 == 0x5:
            shamt = imm & 0x1F
            if (imm >> 10) & 0x1:  # SRAI 
                result = np.int32(rs1_val) >> shamt
            else:  # SRLI 
                result = (rs1_val & 0xFFFFFFFF) >> shamt
        else:
            result = 0

        set_reg(state, inst.rd, result)
        state.pc += 4

    elif inst.opcode == 0x03:  # Load
        addr = rs1_val + imm
        if inst.funct3 == 0x0:  # LB - Load Byte (sign-extended)
            byte_val = get_byte(state, addr, record_history=True)
            # Sign extend from 8 bits to 32 bits using numpy
            signed_val = int(np.int8(np.uint8(byte_val)))
            set_reg(state, inst.rd, signed_val)
        elif inst.funct3 == 0x2:  # LW
            set_reg(state, inst.rd, load_word(state, addr))
        state.pc += 4

    elif inst.opcode == 0x07:  # FLW
        addr = rs1_val + imm
        value = load_word(state, addr)
        set_freg(state, inst.rd, np.int32(value).view(np.float32))
        state.pc += 4

    elif inst.opcode == 0x67:  # JALR
        target = (rs1_val + imm) & ~1
        return_addr = state.pc + 4

        # Record call stack if tracking is enabled and rd != 0 (function call)
        if state.get_stack_trace and inst.rd != 0:
            state.call_stack.append((state.pc, target, return_addr))

        set_reg(state, inst.rd, return_addr)
        state.pc = target

    elif inst.opcode == 0x73:  # System instructions
        if inst.funct3 == 0x0 and imm == 1:  # EBREAK
            # ブレークポイント - プログラムを停止
            print(f"\nEBREAK instruction at PC=0x{state.pc:08x}")
            state.finished = True
            return
        else:
            # 他のシステム命令（未実装）
            state.pc += 4

    else:
        state.pc += 4


def execute_s_type(state: State, inst: SType):
    """Execute S-type instruction"""
    rs1_val = get_reg(state, inst.rs1)
    rs2_val = get_reg(state, inst.rs2)
    addr = rs1_val + inst.imm

    if inst.opcode == 0x23:  # Integer store
        if inst.funct3 == 0x0:  # SB
            set_byte(state, addr, rs2_val)
        elif inst.funct3 == 0x2:  # SW
            store_word(state, addr, rs2_val)
    elif inst.opcode == 0x27:  # FSW
        frs2_val = get_freg(state, inst.rs2)
        store_word(state, addr, frs2_val.view(np.int32))

    state.pc += 4


def execute_b_type(state: State, inst: BType):
    """Execute B-type instruction"""
    rs1_val = get_reg(state, inst.rs1)
    rs2_val = get_reg(state, inst.rs2)
    taken = False

    if inst.funct3 == 0x0:  # BEQ
        taken = rs1_val == rs2_val
    elif inst.funct3 == 0x1:  # BNE
        taken = rs1_val != rs2_val
    elif inst.funct3 == 0x4:  # BLT 
        taken = np.int32(rs1_val) < np.int32(rs2_val)
    elif inst.funct3 == 0x5:  # BGE 
        taken = np.int32(rs1_val) >= np.int32(rs2_val)
    elif inst.funct3 == 0x6:  # BLTU
        taken = (rs1_val & 0xFFFFFFFF) < (rs2_val & 0xFFFFFFFF)
    elif inst.funct3 == 0x7:  # BGEU
        taken = (rs1_val & 0xFFFFFFFF) >= (rs2_val & 0xFFFFFFFF)

    if taken:
        state.pc += inst.imm
    else:
        state.pc += 4


def execute_u_type(state: State, inst: UType):
    """Execute U-type instruction"""
    if inst.opcode == 0x37:  # LUI
        set_reg(state, inst.rd, inst.imm)
    elif inst.opcode == 0x17:  # AUIPC
        set_reg(state, inst.rd, state.pc + inst.imm)

    state.pc += 4


def execute_j_type(state: State, inst: JType):
    """Execute J-type instruction"""
    if inst.opcode == 0x6F:  # JAL
        target = state.pc + inst.imm
        return_addr = state.pc + 4

        # Record call stack if tracking is enabled and rd != 0 (function call)
        if state.get_stack_trace and inst.rd != 0:
            state.call_stack.append((state.pc, target, return_addr))

        set_reg(state, inst.rd, return_addr)
        state.pc = target


def execute(state: State, inst):
    """Execute a decoded instruction"""
    if isinstance(inst, RType):
        execute_r_type(state, inst)
    elif isinstance(inst, IType):
        execute_i_type(state, inst)
    elif isinstance(inst, SType):
        execute_s_type(state, inst)
    elif isinstance(inst, BType):
        execute_b_type(state, inst)
    elif isinstance(inst, UType):
        execute_u_type(state, inst)
    elif isinstance(inst, JType):
        execute_j_type(state, inst)
    else:
        raise ValueError(f"Unknown instruction type: {type(inst)}")
