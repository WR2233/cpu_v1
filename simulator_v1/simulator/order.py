"""RISC-V Machine State Management"""

from .data_types import State
import numpy as np
from typing import List, Optional
import sys
import os

# Path to configuration for initial register values
CONFIG_PATH = os.path.join(os.path.dirname(__file__), "config.yaml")


def _load_initial_registers(config_path: str = CONFIG_PATH) -> dict:
    """Load initial register values from config.yaml (simple YAML parser).

    The expected format is:
    x2: 0x100000
    x3: 0xffff0000
    ...
    """
    if not os.path.exists(config_path):
        return {}

    registers = {}

    try:
        with open(config_path, "r", encoding="utf-8") as f:
            for line in f:
                stripped = line.strip()
                if not stripped or stripped.startswith("#"):
                    continue

                # Remove inline comments
                if "#" in stripped:
                    stripped = stripped.split("#", 1)[0].strip()

                if ":" not in stripped:
                    continue

                key, value_str = stripped.split(":", 1)
                key = key.strip()
                value_str = value_str.strip()

                # Only support integer registers (xN) for now
                if not key.startswith("x"):
                    continue

                try:
                    reg_idx = int(key[1:])
                except ValueError:
                    continue

                if not (0 <= reg_idx < 32):
                    continue

                try:
                    value = int(value_str, 0)
                except ValueError:
                    continue

                registers[reg_idx] = value
    except OSError:
        # If the config cannot be read, fall back to defaults silently.
        return {}

    return registers


_INITIAL_REG_DEFAULTS = _load_initial_registers()


def create_state() -> State:
    """Initialize machine state"""
    state = State()
    # Override with values from config.yaml if provided
    for reg_idx, value in _INITIAL_REG_DEFAULTS.items():
        if reg_idx == 0:
            continue  # x0 is hardwired to zero
        state.regs[reg_idx] = np.uint32(value)

    return state


def get_reg(state: State, r: int) -> int:
    """Get register value - x0 is hardwired to 0"""
    if r == 0:
        return 0
    return int(state.regs[r])


def set_reg(state: State, r: int, value: int):
    """Set register value - x0 and gp(x3) are read-only"""
    if r != 0 and r != 3:  # x0とgp(x3)は書き込み禁止
        state.regs[r] = np.int32(value)


def get_freg(state: State, r: int) -> np.float32:
    """Get floating-point register value"""
    return state.fregs[r]


def set_freg(state: State, r: int, value: float):
    """Set floating-point register value"""
    state.fregs[r] = np.float32(value)


def get_byte(state: State, addr: int, record_history: bool = False) -> int:
    """Get byte from memory (DRAM or BRAM)

    Args:
        state: CPU state
        addr: Memory address
        record_history: If True, record this read in memory history
    """
    addr = addr & 0xFFFFFFFF  # 32-bit address
    # BRAM: 0x80000000 ~ 0xFFFF0000 (excluding MMIO)
    if addr >= 0x80000000 and addr < 0xFFFF0000:
        value = state.bram.get(addr, 0)
    # DRAM: 0x00000000 ~ 0x7FFFFFFF
    else:
        value = state.memory.get(addr, 0)

    # Record memory read history if tracking is enabled and requested
    if record_history and state.get_mh:
        state.read_his.append((addr, value))

    return value


def set_byte(state: State, addr: int, value: int):
    """Set byte in memory - MMIO at 0xffff0000 (stderr), BRAM at 0x80000000~"""
    addr = addr & 0xFFFFFFFF  # 32-bit address

    # MMIO: 0xffff0000へのストアで文字を標準エラー出力
    if addr == 0xffff0000:
        byte = value & 0xFF
        char = chr(byte)
        if state.get_mmioh:
            state.mmio_his.append((addr, byte))
        print(char, end='', flush=True, file=sys.stderr)
    # BRAM: 0x80000000 ~ 0xFFFF0000 (excluding MMIO)
    elif addr >= 0x80000000 and addr < 0xFFFF0000:
        state.bram[addr] = value & 0xFF
    # DRAM: 0x00000000 ~ 0x7FFFFFFF
    else:
        state.memory[addr] = value & 0xFF


def load_word(state: State, addr: int) -> int:
    """Load word (32-bit, little-endian) from memory"""
    b0 = get_byte(state, addr)
    b1 = get_byte(state, addr + 1)
    b2 = get_byte(state, addr + 2)
    b3 = get_byte(state, addr + 3)
    value = b0 | (b1 << 8) | (b2 << 16) | (b3 << 24)
    # Convert to signed 32-bit
    if value & 0x80000000:
        value -= 0x100000000

    # Record memory read history if tracking is enabled
    if state.get_mh:
        state.read_his.append((addr, value))

    return value


def store_word(state: State, addr: int, value: int, not_mh: Optional[bool] = None):
    """Store word (32-bit, little-endian) to memory"""
    value = value & 0xFFFFFFFF
    set_byte(state, addr, value & 0xFF)
    set_byte(state, addr + 1, (value >> 8) & 0xFF)
    set_byte(state, addr + 2, (value >> 16) & 0xFF)
    set_byte(state, addr + 3, (value >> 24) & 0xFF)

    # Record memory write history if tracking is enabled
    # Exclude MMIO writes (0xffff0000) from history
    if not_mh is None:
        not_mh = False
    if state.get_mh and (addr & 0xFFFFFFFF) != 0xffff0000 and (not not_mh):
        state.write_his.append((addr, value))        
        
def set_inst_byte(state: State, addr: int, value: int):
    addr = addr & 0xFFFFFFFF  # 32-bit address
    state.inst_mem[addr] = value & 0xFF

def store_inst(state: State, addr: int, value: int):
    value = value & 0xFFFFFFFF
    set_inst_byte(state, addr, value & 0xFF)
    set_inst_byte(state, addr + 1, (value >> 8) & 0xFF)
    set_inst_byte(state, addr + 2, (value >> 16) & 0xFF)
    set_inst_byte(state, addr + 3, (value >> 24) & 0xFF)

def get_inst_byte(state: State, addr: int):
    addr = addr & 0xFFFFFFFF  # 32-bit address
    return state.inst_mem.get(addr, 0)
    
def load_inst(state: State, addr: int):
    b0 = get_inst_byte(state, addr)
    b1 = get_inst_byte(state, addr + 1)
    b2 = get_inst_byte(state, addr + 2)
    b3 = get_inst_byte(state, addr + 3)
    value = b0 | (b1 << 8) | (b2 << 16) | (b3 << 24)
    # Convert to signed 32-bit
    if value & 0x80000000:
        value -= 0x100000000

    return value

def fetch(state: State) -> int:
    """Fetch instruction from memory at PC"""
    return load_inst(state, state.pc)


def load_program(state: State, program: List[int], start_addr: int = 0):
    """Load program into memory

    Program format:
    - Code instructions
    - 0x00000000 marker (end_code)
    - Data section (loaded into BRAM at 0x80000000~)
    """
    addr = start_addr
    bram_addr = 0x80000000  # BRAM starts at 0x80000000
    loading_code = True

    for inst in program:
        if loading_code:
            if inst == 0x00000000:
                # Found end_code marker, switch to loading data section
                loading_code = False
            else:
                # Load code instruction into instruction memory
                store_inst(state, addr, inst)
                addr += 4
        else:
            # Load data section into BRAM
            store_word(state, bram_addr, inst, True)
            bram_addr += 4

    state.pc = start_addr

def load_sld_file(state: State, filepath: str, start_addr: int = 0x0, end_addr: int = 0x1000):
    with open(filepath, 'rb') as f:
        for addr in range(start_addr, end_addr):
            c = f.read1(1)
            if len(c) == 0:
                break
            set_byte(state, addr, ord(c))


def print_state(state: State):
    """Print state for debugging"""
    print(f"PC: 0x{state.pc:08x}")
    print("Registers:")
    for i in range(32):
        if i % 4 == 0:
            print()
        print(f"  x{i:2d}: 0x{state.regs[i]:08x}", end="")
    print()
