"""RISC-V Simulator Main Loop"""

from .data_types import State
from .order import create_state, fetch, print_state, load_program
from .decoder import decode
from .executor import execute
from .order import get_reg, set_reg, load_word, get_byte

class Simulator:
    """RISC-V Simulator"""

    def __init__(self):
        self.state = create_state()
        self.debug = False
        self.max_cycles = 100000000  # Maximum cycles to prevent infinite loops
        self.pc_his = [0]
        self._get_pch = False

    @property
    def get_mh(self):
        """Get memory history tracking flag"""
        return self.state.get_mh

    @get_mh.setter
    def get_mh(self, value):
        """Set memory history tracking flag"""
        self.state.get_mh = value
        
    @property
    def get_mmioh(self):
        """Get MMIO history tracking flag"""
        return self.state.get_mmioh

    @get_mmioh.setter
    def get_mmioh(self, value):
        """Set MMIO history tracking flag"""
        self.state.get_mmioh = value
    
    @property
    def get_pch(self):
        """GET PC history tracking flag"""
        return self._get_pch

    @get_pch.setter
    def get_pch(self, value):
        """set PC history tracking flag"""
        self._get_pch = value

    @property
    def get_stack_trace(self):
        """Get stack trace tracking flag"""
        return self.state.get_stack_trace

    @get_stack_trace.setter
    def get_stack_trace(self, value):
        """Set stack trace tracking flag"""
        self.state.get_stack_trace = value

    def load(self, program, start_addr=0):
        """Load program into memory"""
        load_program(self.state, program, start_addr)

    def step(self):
        """Execute one instruction"""
        if self.state.finished:
            return False

        # Fetch
        inst_bits = fetch(self.state)

        # Check for end of program (all zeros or specific marker)
        if inst_bits == 0:
            self.state.finished = True
            return False

        if self.debug:
            print(f"PC: 0x{self.state.pc:08x}, Inst: 0x{inst_bits:08x}")

        # Decode
        try:
            inst = decode(inst_bits)
        except Exception as e:
            print(f"ERROR: Failed to decode instruction at PC=0x{self.state.pc:08x}: {e}")
            self.state.finished = True
            return False

        # Execute
        try:
            execute(self.state, inst)
        except Exception as e:
            print(f"ERROR: Failed to execute instruction at PC=0x{self.state.pc:08x}: {e}")
            import traceback
            traceback.print_exc()
            self.state.finished = True
            return False

        return True

    def run(self, max_cycles=None):
        """Run until finished or max_cycles reached"""
        if max_cycles is not None:
            self.max_cycles = max_cycles

        cycles = 0
        last_pc = -1
        infinite_loop_count = 0

        while not self.state.finished and cycles < self.max_cycles:
            # Detect infinite loop (j end: j to itself)
            if self.state.pc == last_pc:
                infinite_loop_count += 1
                if infinite_loop_count > 2:
                    print(f"Detected infinite loop at PC=0x{self.state.pc:08x}, stopping")
                    break
            else:
                infinite_loop_count = 0

            last_pc = self.state.pc

            if not self.step():
                break
            cycles += 1
            self.state.cycle = cycles  # Update state cycle counter
            if self.get_pch:
                self.pc_his.append(self.state.pc)

        if cycles >= self.max_cycles:
            print(f"Warning: Reached maximum cycles ({self.max_cycles})")

        return cycles

    def print_state(self):
        """Print current state"""
        print_state(self.state)

    def get_reg(self, r):
        """Get register value"""
        return get_reg(self.state, r)

    def set_reg(self, r, value):
        """Set register value"""
        set_reg(self.state, r, value)

    def get_memory(self, addr, size=4):
        """Get memory value"""
        if size == 4:
            return load_word(self.state, addr)
        elif size == 1:
            return get_byte(self.state, addr)
        else:
            raise ValueError(f"Invalid size: {size}")

    def set_memory(self, addr, value, size=4):
        """Set memory value"""
        from order import store_word, store_half, set_byte
        if size == 4:
            store_word(self.state, addr, value)
        elif size == 2:
            store_half(self.state, addr, value)
        elif size == 1:
            set_byte(self.state, addr, value)
        else:
            raise ValueError(f"Invalid size: {size}")

    def dump_mh(self):
        """Return memory access history"""
        return self.state.write_his, self.state.read_his
    
    def dump_mmioh(self):
        """Return MMIO history"""
        return self.state.mmio_his

    def dump_stack_trace(self):
        """Return call stack trace"""
        return self.state.call_stack

    def dump_pch(self):
        """ Return PC history"""
        return self.pc_his

def main():
    """Example usage"""
    sim = Simulator()
    sim.debug = True

    # Example program: Add 5 + 7 and store in x10
    # addi x10, x0, 5    -> 0x00500513
    # addi x11, x0, 7    -> 0x00700593
    # add x12, x10, x11  -> 0x00b50633
    program = [
        0x00500513,  # addi x10, x0, 5
        0x00700593,  # addi x11, x0, 7
        0x00b50633,  # add x12, x10, x11
        0x00000000,  # end marker
    ]

    sim.load(program)
    cycles = sim.run()

    print(f"\nExecution completed in {cycles} cycles")
    sim.print_state()
    print(f"\nResult in x12: {sim.get_reg(12)}")


if __name__ == "__main__":
    main()
