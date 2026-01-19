"""RISC-V Simulator Types"""

from dataclasses import dataclass
from typing import Dict
import numpy as np


@dataclass
class RType:
    """R-type instruction format"""
    opcode: int
    rd: int
    funct3: int
    rs1: int
    rs2: int
    funct7: int


@dataclass
class IType:
    """I-type instruction format"""
    opcode: int
    rd: int
    funct3: int
    rs1: int
    imm: int


@dataclass
class SType:
    """S-type instruction format"""
    opcode: int
    funct3: int
    rs1: int
    rs2: int
    imm: int


@dataclass
class BType:
    """B-type instruction format"""
    opcode: int
    funct3: int
    rs1: int
    rs2: int
    imm: int


@dataclass
class UType:
    """U-type instruction format"""
    opcode: int
    rd: int
    imm: int


@dataclass
class JType:
    """J-type instruction format"""
    opcode: int
    rd: int
    imm: int


class State:
    """RISC-V Machine State"""

    def __init__(self):
        self.pc = 0                                    # Program counter
        self.regs = np.zeros(32, dtype=np.uint32)     # x0-x31 integer registers (as bit patterns)
        self.fregs = np.zeros(32, dtype=np.float32)   # f0-f31 floating-point registers
        self.memory: Dict[int, int] = {}              # DRAM (address -> byte)
        self.bram: Dict[int, int] = {}                # BRAM (address -> byte) for data section
        self.inst_mem: Dict[int, int] = {}            # 命令データ用メモリ
        self.frac_rom: Dict[int, int] = {}            # Deprecated: use bram instead
        
        self.finished = False                          # Execution finished flag
        self.cycle = 0                                 # Cycle counter
        self.get_mh = False                            # Memory history tracking flag
        self.get_mmioh = False                         # MMIO history tracking flag
        self.write_his = []                            # Write history: list of (addr, value)
        self.read_his = []                             # Read history: list of (addr, value)
        self.mmio_his = []                             # MMIO history: list of (addr, value)
        self.get_stack_trace = False                   # Stack trace tracking flag
        self.call_stack = []                           # Call stack: list of (caller_pc, target_pc, return_addr)
