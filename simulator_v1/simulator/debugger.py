"""RISC-V Simulator Debugger

This module provides interactive debugging capabilities for the RISC-V simulator.
"""

from .simulator import Simulator
from .decoder import decode
from .order import fetch
from typing import Set, List
import numpy as np


class Debugger:
    """Interactive debugger for RISC-V simulator"""

    # RISC-V ABI register names
    INT_REG_ABI_NAMES = [
        "zero (x0)", "ra (x1)", "sp (x2)", "gp (x3)", "tp (x4)", "t0 (x5)", "t1 (x6)", "t2 (x7)",
        "s0 (x8)", "s1 (x9)", "a0 (x10)", "a1 (x11)", "a2 (x12)", "a3 (x13)", "a4 (x14)", "a5 (x15)",
        "a6 (x16)", "a7 (x17)", "s2 (x18)", "s3 (x19)", "s4 (x20)", "s5 (x21)", "s6 (x22)", "s7 (x23)",
        "s8 (x24)", "s9 (x25)", "s10 (x26)", "s11 (x27)", "t3 (x28)", "t4 (x29)", "t5 (x30)", "t6 (x31)"
    ]

    FLOAT_REG_ABI_NAMES = [
        "ft0 (f0)", "ft1 (f1)", "ft2 (f2)", "ft3 (f3)", "ft4 (f4)", "ft5 (f5)", "ft6 (f6)", "ft7 (f7)",
        "fs0 (f8)", "fs1 (f9)", "fa0 (f10)", "fa1 (f11)", "fa2 (f12)", "fa3 (f13)", "fa4 (f14)", "fa5 (f15)",
        "fa6 (f16)", "fa7 (f17)", "fs2 (f18)", "fs3 (f19)", "fs4 (f20)", "fs5 (f21)", "fs6 (f22)", "fs7 (f23)",
        "fs8 (f24)", "fs9 (f25)", "fs10 (f26)", "fs11 (f27)", "ft8 (f28)", "ft9 (f29)", "ft10 (f30)", "ft11 (f31)"
    ]

    def __init__(self, simulator: Simulator, source_lines: List[str] = None):
        """Initialize debugger

        Args:
            simulator: RISC-V simulator instance
            source_lines: Optional list of source code lines for display
        """
        self.sim = simulator
        self.source_lines = source_lines or []
        self.breakpoints: Set[int] = set()  # Set of PC addresses
        self.line_to_pc = {}  # Map line numbers to PC addresses
        self.pc_to_line = {}  # Map PC addresses to line numbers
        self.running = False
        self.show_regs_in_step = False  # Toggle for register display in step mode
        self.show_fregs_in_step = False  # Toggle for float register display in step mode
        self.show_stack_on_step = True  # Toggle for stack display in step mode (ON by default)
        self.show_changes_flag = True  # Toggle for showing register/memory changes (ON by default)
        self.prev_regs = {}  # Store previous register values
        self.prev_fregs = {}  # Store previous floating-point register values
        self.prev_memory = {}  # Store previous memory values (for recently accessed addresses)

    def set_line_mapping(self, line_to_pc: dict):
        """Set mapping between source line numbers and PC addresses

        Args:
            line_to_pc: Dictionary mapping line number to PC address
        """
        self.line_to_pc = line_to_pc
        self.pc_to_line = {v: k for k, v in line_to_pc.items()}

    def add_breakpoint(self, line_number: int) -> bool:
        """Add breakpoint at source line number

        Args:
            line_number: Source line number (1-indexed)

        Returns:
            True if breakpoint was added, False if line has no corresponding PC
        """
        if line_number in self.line_to_pc:
            pc = self.line_to_pc[line_number]
            self.breakpoints.add(pc)
            print(f"Breakpoint set at line {line_number} (PC: 0x{pc:08x})")
            return True
        else:
            print(f"Error: Line {line_number} has no executable code")
            return False

    def add_breakpoint_at_pc(self, pc: int):
        """Add breakpoint at PC address

        Args:
            pc: Program counter address
        """
        self.breakpoints.add(pc)
        line = self.pc_to_line.get(pc, "?")
        print(f"Breakpoint set at PC: 0x{pc:08x} (line {line})")

    def remove_breakpoint(self, line_number: int) -> bool:
        """Remove breakpoint at source line number

        Args:
            line_number: Source line number (1-indexed)

        Returns:
            True if breakpoint was removed, False otherwise
        """
        if line_number in self.line_to_pc:
            pc = self.line_to_pc[line_number]
            if pc in self.breakpoints:
                self.breakpoints.remove(pc)
                print(f"Breakpoint removed at line {line_number} (PC: 0x{pc:08x})")
                return True
        print(f"No breakpoint at line {line_number}")
        return False

    def list_breakpoints(self):
        """List all breakpoints"""
        if not self.breakpoints:
            print("No breakpoints set")
            return

        print("Breakpoints:")
        for pc in sorted(self.breakpoints):
            line = self.pc_to_line.get(pc, "?")
            print(f"  Line {line}: PC 0x{pc:08x}")

    def show_context(self, lines_before: int = 5, lines_after: int = 5):
        """Show source code context around current PC

        Args:
            lines_before: Number of lines to show before current line
            lines_after: Number of lines to show after current line
        """
        current_line = self.pc_to_line.get(self.sim.state.pc)

        if current_line is None:
            print(f"Current PC: 0x{self.sim.state.pc:08x} (no source mapping)")
            return

        print(f"\nCurrent location: Line {current_line}, PC: 0x{self.sim.state.pc:08x}")

        if not self.source_lines:
            return

        start = max(0, current_line - lines_before - 1)
        end = min(len(self.source_lines), current_line + lines_after)

        print("\nSource code:")
        for i in range(start, end):
            line_num = i + 1
            prefix = "=> " if line_num == current_line else "   "
            bp_marker = "* " if self.line_to_pc.get(line_num) in self.breakpoints else "  "
            print(f"{bp_marker}{prefix}{line_num:4d}: {self.source_lines[i].rstrip()}")
            
    def show_float_registers(self):
        """Show floating-point register values"""
        print("\nFloating-Point Registers:")
        for i in range(32):
            if i % 4 == 0:
                print()
            fvalue = self.sim.state.fregs[i]
            # Show as both hex (bit pattern) and float value
            hex_val = np.float32(fvalue).view(np.uint32)
            abi_name = self.FLOAT_REG_ABI_NAMES[i]
            print(f"  {abi_name:11s}: 0x{hex_val:08x} ({fvalue:14.6f})", end="")
        print("\n")
        
    def show_registers(self, show_float: bool = False):
        """Show current register values

        Args:
            show_float: If True, also show floating-point registers
        """
        print("\nInteger Registers:")
        for i in range(32):
            if i % 4 == 0:
                print()
            value = self.sim.get_reg(i)
            abi_name = self.INT_REG_ABI_NAMES[i]
            print(f"  {abi_name:11s}: 0x{value & 0xFFFFFFFF:08x} ({value:11d})", end="")
        print("\n")

        if show_float:
            self.show_float_registers()

    def show_stack(self, count: int = 10):
        """Show stack memory around SP

        Args:
            count: Number of words to display from SP
        """
        sp = self.sim.get_reg(2)  # sp is x2
        print(f"\nStack (SP = 0x{sp:08x}):")
        print("  Address      Value (hex)  Value (dec)")
        print("  " + "-" * 42)

        for i in range(count):
            addr = sp + (i * 4)
            try:
                value = self.sim.get_memory(addr, size=4)
                # Convert to signed 32-bit for display
                signed_value = value if value < 0x80000000 else value - 0x100000000
                marker = "SP-> " if i == 0 else "     "
                print(f"  {marker} 0x{addr:08x}: 0x{value & 0xFFFFFFFF:08x}  {signed_value:11d}")
            except Exception as e:
                print(f"       0x{addr:08x}: <error: {e}>")

    def show_call_stack_trace(self, count: int = 10):
        """Show call stack trace (function call history)

        Args:
            count: Number of most recent calls to display (default: 10)
        """
        call_stack = self.sim.dump_stack_trace()

        if not call_stack:
            print("\nNo function calls recorded.")
            return

        # Show most recent calls (last 'count' entries)
        recent_calls = call_stack[-count:]
        total_calls = len(call_stack)

        print(f"\nCall Stack Trace (showing {len(recent_calls)} most recent of {total_calls} total calls):")
        print("  #    Caller PC    Target PC    Return Addr")
        print("  " + "-" * 50)

        start_index = max(0, total_calls - count)
        for idx, (caller_pc, target_pc, return_addr) in enumerate(recent_calls, start=start_index):
            print(f"  {idx:3d}  0x{caller_pc:08x}  0x{target_pc:08x}  0x{return_addr:08x}")
        print()

    def show_recent_memory_access(self, range_size: int = 5):
        """Show memory around most recently read and written addresses

        Args:
            range_size: Number of words to show before and after the recent address (default: 10)
        """
        write_his, read_his = self.sim.dump_mh()

        if not write_his and not read_his:
            print("\nNo memory accesses recorded.")
            print("Note: Memory access tracking must be enabled.")
            return

        # ANSI color codes
        YELLOW = '\033[93m'  # Yellow for most recent
        BLUE = '\033[94m'    # Blue for write-specific highlighting
        RESET = '\033[0m'

        # Show most recent WRITE if exists
        if write_his:
            recent_write_addr = write_his[-1][0]

            print(f"\n{BLUE}Most Recent WRITE:{RESET} 0x{recent_write_addr:08x}")
            print(f"Showing ±{range_size} words")
            print("  Address      Value (hex)  Value (dec)    Status")
            print("  " + "-" * 60)

            for i in range(-range_size, range_size + 1):
                addr = (recent_write_addr + i * 4) & 0xFFFFFFFF
                try:
                    value = self.sim.get_memory(addr, size=4)
                    signed_value = value if value < 0x80000000 else value - 0x100000000

                    # Determine color and marker
                    if addr == recent_write_addr:
                        color = YELLOW
                        marker = "← Most Recent WRITE"
                    else:
                        color = ""
                        marker = ""

                    reset = RESET if color else ""
                    print(f"{color}  0x{addr:08x}: 0x{value & 0xFFFFFFFF:08x}  {signed_value:11d}  {marker}{reset}")
                except Exception as e:
                    print(f"  0x{addr:08x}: <error: {e}>")

        # Show most recent READ if exists
        if read_his:
            recent_read_addr = read_his[-1][0]

            print(f"\n{BLUE}Most Recent READ:{RESET} 0x{recent_read_addr:08x}")
            print(f"Showing ±{range_size} words")
            print("  Address      Value (hex)  Value (dec)    Status")
            print("  " + "-" * 60)

            for i in range(-range_size, range_size + 1):
                addr = (recent_read_addr + i * 4) & 0xFFFFFFFF
                try:
                    value = self.sim.get_memory(addr, size=4)
                    signed_value = value if value < 0x80000000 else value - 0x100000000

                    # Determine color and marker
                    if addr == recent_read_addr:
                        color = YELLOW
                        marker = "← Most Recent READ"
                    else:
                        color = ""
                        marker = ""

                    reset = RESET if color else ""
                    print(f"{color}  0x{addr:08x}: 0x{value & 0xFFFFFFFF:08x}  {signed_value:11d}  {marker}{reset}")
                except Exception as e:
                    print(f"  0x{addr:08x}: <error: {e}>")

        print()

    def show_instruction(self):
        """Show current instruction"""
        if self.sim.state.finished:
            print("Program finished")
            return

        try:
            inst_bits = fetch(self.sim.state)
            # Ensure unsigned 32-bit representation
            inst_bits = inst_bits & 0xFFFFFFFF

            if inst_bits == 0:
                print("End of program (instruction = 0x00000000)")
                return

            inst = decode(inst_bits)
            print(f"\nPC: 0x{self.sim.state.pc:08x}")
            print(f"Instruction: 0x{inst_bits:08x}")
        except Exception as e:
            print(f"Error decoding instruction: {e}")

    def capture_state(self):
        """Capture current register and memory state for change detection"""
        # Capture integer registers
        self.prev_regs = {}
        for i in range(32):
            self.prev_regs[i] = self.sim.get_reg(i)

        # Capture floating-point registers
        self.prev_fregs = {}
        for i in range(32):
            self.prev_fregs[i] = self.sim.state.fregs[i]

        # Capture recently accessed memory (from memory history)
        self.prev_memory = {}
        if self.sim.get_mh:
            write_his, read_his = self.sim.dump_mh()
            # Get last 10 unique addresses from both read and write history
            addresses = set()
            if write_his:
                for addr, _ in write_his[-10:]:
                    addresses.add(addr)
            if read_his:
                for addr, _ in read_his[-10:]:
                    addresses.add(addr)

            for addr in addresses:
                try:
                    self.prev_memory[addr] = self.sim.get_memory(addr, size=4)
                except:
                    pass

    def show_changes(self):
        """Show changes in registers and memory after step execution"""
        changes = []

        # Check integer register changes
        for i in range(32):
            curr_val = self.sim.get_reg(i)
            prev_val = self.prev_regs.get(i, 0)
            if curr_val != prev_val:
                abi_name = self.INT_REG_ABI_NAMES[i]
                changes.append(f"  {abi_name:11s}: 0x{prev_val & 0xFFFFFFFF:08x} ({prev_val:11d}) -> 0x{curr_val & 0xFFFFFFFF:08x} ({curr_val:11d})")

        # Check floating-point register changes
        for i in range(32):
            curr_val = self.sim.state.fregs[i]
            prev_val = self.prev_fregs.get(i, 0.0)
            if curr_val != prev_val:
                abi_name = self.FLOAT_REG_ABI_NAMES[i]
                prev_hex = np.float32(prev_val).view(np.uint32)
                curr_hex = np.float32(curr_val).view(np.uint32)
                changes.append(f"  {abi_name:11s}: 0x{prev_hex:08x} ({prev_val:14.6f}) -> 0x{curr_hex:08x} ({curr_val:14.6f})")

        # Check memory changes
        if self.sim.get_mh:
            write_his, _ = self.sim.dump_mh()
            addresses = set()
            if write_his:
                for addr, _ in write_his[-10:]:
                    addresses.add(addr)
            for addr in addresses:
                try:
                    curr_val = self.sim.get_memory(addr, size=4)
                    prev_val = self.prev_memory.get(addr)
                    if prev_val is not None and curr_val != prev_val:
                        curr_signed = curr_val if curr_val < 0x80000000 else curr_val - 0x100000000
                        prev_signed = prev_val if prev_val < 0x80000000 else prev_val - 0x100000000
                        changes.append(f"  MEM[0x{addr:08x}]: 0x{prev_val & 0xFFFFFFFF:08x} ({prev_signed:11d}) -> 0x{curr_val & 0xFFFFFFFF:08x} ({curr_signed:11d})")
                except:
                    pass

        # Display changes if any
        if changes:
            print("\nChanges:")
            for change in changes:
                print(change)

    def step(self) -> bool:
        """Execute one instruction

        Returns:
            True if execution should continue, False if finished
        """
        if self.sim.state.finished:
            print("Program finished")
            return False

        # Capture state before execution
        self.capture_state()

        result = self.sim.step()

        # Show changes after execution
        if result:
            self.show_changes()

        return result

    def continue_execution(self) -> str:
        """Continue execution until breakpoint or end

        Returns:
            Reason for stopping: "breakpoint", "finished", "max_cycles"
        """
        self.running = True
        cycles = 0

        while not self.sim.state.finished and cycles < self.sim.max_cycles:
            # Check for breakpoint before executing
            if self.sim.state.pc in self.breakpoints:
                print(f"\nBreakpoint hit at PC: 0x{self.sim.state.pc:08x}")
                line = self.pc_to_line.get(self.sim.state.pc, "?")
                print(f"Line: {line}")
                return "breakpoint"

            if not self.sim.step():
                print("\nProgram finished")
                return "finished"

            cycles += 1

        if cycles >= self.sim.max_cycles:
            print(f"\nWarning: Reached maximum cycles ({self.sim.max_cycles})")
            return "max_cycles"

        return "finished"

    def run_interactive(self):
        """Run interactive debugging session"""
        print("RISC-V Debugger")
        print("Type 'help' for available commands\n")

        self.show_context()

        while True:
            try:
                command = input("\n(riscv-db) ").strip()

                if not command:
                    continue

                parts = command.split()
                cmd = parts[0].lower()

                if cmd in ['q', 'quit', 'exit']:
                    print("Exiting debugger")
                    break

                elif cmd in ['h', 'help', '?']:
                    self.print_help()

                elif cmd in ['s', 'step', 'n', 'next']:
                    if len(parts) > 1:
                        try:
                            steps = int(parts[1])
                        except ValueError:
                            print("Invalid step count")
                            continue
                        for _ in range(steps):
                            ret = self.step()
                            if not ret:
                                break
                        if self.show_stack_on_step:
                            self.show_stack()
                        self.show_context()
                        self.show_instruction()
                    elif self.step():
                        if self.show_stack_on_step:
                            self.show_stack()
                        self.show_context()
                        self.show_instruction()
                    else:
                        print("Program finished")

                elif cmd in ['c', 'continue', 'run']:
                    reason = self.continue_execution()
                    self.show_context()
                    if reason == "breakpoint":
                        self.show_instruction()

                elif cmd in ['b', 'break', 'breakpoint']:
                    if len(parts) < 2:
                        print("Usage: break <line_number>")
                    else:
                        try:
                            line_num = int(parts[1])
                            self.add_breakpoint(line_num)
                        except ValueError:
                            print("Invalid line number")

                elif cmd in ['d', 'delete']:
                    if len(parts) < 2:
                        print("Usage: delete <line_number>")
                    else:
                        try:
                            line_num = int(parts[1])
                            self.remove_breakpoint(line_num)
                        except ValueError:
                            print("Invalid line number")

                elif cmd in ['info']:
                    if len(parts) < 2:
                        print("Usage: info breakpoints|registers|fregs")
                    elif parts[1] in ['b', 'breakpoints']:
                        self.list_breakpoints()
                    elif parts[1] in ['r', 'registers', 'reg']:
                        self.show_registers(show_float=False)
                    elif parts[1] in ['f', 'fregs', 'float']:
                        self.show_float_registers()
                    elif parts[1] in ['all']:
                        self.show_registers(show_float=True)
                    else:
                        print("Unknown info command")

                elif cmd in ['l', 'list']:
                    self.show_context(lines_before=5, lines_after=5)

                elif cmd in ['r', 'registers', 'regs']:
                    self.show_registers(show_float=False)

                elif cmd in ['f', 'fregs', 'float']:
                    self.show_float_registers()

                elif cmd in ['i', 'inst', 'instruction']:
                    self.show_instruction()

                elif cmd in ['p', 'print']:
                    if len(parts) < 2:
                        print("Usage: print x<register_num> or print <abi_name> (e.g., print a0, print sp)")
                    else:
                        reg_str = parts[1].lower()
                        if reg_str.startswith('x'):
                            try:
                                reg_num = int(reg_str[1:])
                                if 0 <= reg_num < 32:
                                    value = self.sim.get_reg(reg_num)
                                    abi_name = self.INT_REG_ABI_NAMES[reg_num]
                                    print(f"{abi_name} (x{reg_num}) = 0x{value & 0xFFFFFFFF:08x} ({value})")
                                else:
                                    print("Register number must be 0-31")
                            except ValueError:
                                print("Invalid register format")
                        elif reg_str.startswith('f'):
                            try:
                                reg_num = int(reg_str[1:])
                                if 0 <= reg_num < 32:
                                    fvalue = self.sim.state.fregs[reg_num]
                                    hex_val = np.float32(fvalue).view(np.uint32)
                                    abi_name = self.FLOAT_REG_ABI_NAMES[reg_num]
                                    print(f"{abi_name} (f{reg_num}) = 0x{hex_val:08x} ({fvalue:.6f})")
                                else:
                                    print("Register number must be 0-31")
                            except ValueError:
                                print("Invalid register format")
                        # ABI名での検索を追加
                        elif reg_str in self.INT_REG_ABI_NAMES:
                            reg_num = self.INT_REG_ABI_NAMES.index(reg_str)
                            value = self.sim.get_reg(reg_num)
                            print(f"{reg_str} (x{reg_num}) = 0x{value & 0xFFFFFFFF:08x} ({value})")
                        elif reg_str in self.FLOAT_REG_ABI_NAMES:
                            reg_num = self.FLOAT_REG_ABI_NAMES.index(reg_str)
                            fvalue = self.sim.state.fregs[reg_num]
                            hex_val = np.float32(fvalue).view(np.uint32)
                            print(f"{reg_str} (f{reg_num}) = 0x{hex_val:08x} ({fvalue:.6f})")
                        else:
                            print("Use format: x<number>, f<number>, or ABI name (e.g., x10, f0, a0, sp)")

                elif cmd in ['m', 'mem', 'memory']:
                    if len(parts) < 2:
                        # Show recent memory accesses
                        self.show_recent_memory_access()
                    else:
                        try:
                            addr = int(parts[1], 0)  # Support hex and decimal
                            value = self.sim.get_memory(addr, size=4)
                            print(f"Memory[0x{addr:08x}] = 0x{value & 0xFFFFFFFF:08x} ({value})")
                        except ValueError:
                            print("Invalid address")
                        except Exception as e:
                            print(f"Error reading memory: {e}")

                elif cmd in ['pc']:
                    print(f"PC = 0x{self.sim.state.pc:08x}")

                elif cmd in ['stack', 'st']:
                    # スタック表示
                    count = 10  # デフォルト
                    if len(parts) >= 2:
                        try:
                            count = int(parts[1])
                        except ValueError:
                            print("Invalid count, using default (10)")
                    self.show_stack(count)

                elif cmd in ['ft', 'ftrace']:
                    # スタックトレース（関数呼び出し履歴）表示
                    count = 10  # デフォルト
                    if len(parts) >= 2:
                        try:
                            count = int(parts[1])
                        except ValueError:
                            print("Invalid count, using default (10)")
                    self.show_call_stack_trace(count)

                elif cmd in ['toggle-stack', 'ts']:
                    # スタック自動表示の切り替え
                    self.show_stack_on_step = not self.show_stack_on_step
                    status = "ON" if self.show_stack_on_step else "OFF"
                    print(f"Stack display on step: {status}")

                else:
                    print(f"Unknown command: {cmd}")
                    print("Type 'help' for available commands")

            except KeyboardInterrupt:
                print("\nInterrupted")
                continue
            except EOFError:
                print("\nExiting debugger")
                break

    def print_help(self):
        """Print help message"""
        help_text = """
Available commands:
  s, step, n, next [steps]  - Execute [steps](one) instruction(s) and show state (+ stack)
  c, continue, run          - Continue execution until breakpoint or end
  b, break <line>           - Set breakpoint at line number
  d, delete <line>          - Remove breakpoint at line number
  info breakpoints          - List all breakpoints
  info registers            - Show all integer register values
  info fregs                - Show all floating-point register values
  info all                  - Show both integer and floating-point registers
  l, list                   - Show source code around current PC
  r, registers, regs        - Show all integer register values
  f, fregs, float           - Show all floating-point register values
  stack, st [count]         - Show stack memory (default: 10 words from SP)
  ft, ftrace [count]         - Show call stack trace (function call history)
  toggle-stack, ts          - Toggle automatic stack display on step (default: ON)
  i, inst                   - Show current instruction
  p, print x<num>           - Print integer register value (e.g., print x10)
  p, print f<num>           - Print floating-point register value (e.g., print f0)
  m, memory [addr]          - Show memory value at address, or recent access if no address
  pc                        - Show program counter
  h, help, ?                - Show this help message
  q, quit, exit             - Exit debugger

Stack Display:
  By default, the stack (10 words from SP) is shown after each 's' command.
  Use 'toggle-stack' or 'ts' to turn this OFF/ON.
  Use 'stack' or 'st' to manually display the stack memory at any time.
  Use 'stack 20' to show 20 words instead of the default 10.

Call Stack Trace:
  Use 'ft' or 'ftrace' to show function call history (JAL/JALR calls).
  Default shows 10 most recent calls. Use 'st 20' to show more.

Breakpoints can be set using line numbers from the source file.
"""
        print(help_text)
