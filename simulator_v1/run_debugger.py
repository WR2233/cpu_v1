#!/usr/bin/env python3
"""Run RISC-V Debugger

This script launches the interactive debugger for RISC-V assembly programs.
"""

import sys
import os
import argparse
import io

# Make stderr unbuffered for real-time MMIO output when redirected to file
# This ensures that 2>log.txt will update the file in real-time
if not sys.stderr.isatty():
    sys.stderr = io.TextIOWrapper(
        os.fdopen(sys.stderr.fileno(), 'wb', 0),
        encoding='utf-8',
        write_through=True,
        line_buffering=False
    )

# Add parent directory to path to access assembler module
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from simulator import Simulator
from simulator.debugger import Debugger
from assembler.assembler import assemble, link_files
from simulator.order import load_sld_file

def get_assemble_code(assembly_path:str) -> str:
    # Read source file
    with open(assembly_path, 'r', encoding='utf-8') as f:
        assemble_code = f.read()
    return assemble_code

def run_debugger(assembly_code: str, file_change_line=None, sld_file: str = None) -> str:
    """Run debugger on assembly file

    Args:
        assembly_code: assembly string
        file_change_line: File change line list for multi-file assembly (optional)
        sld_file: SLD file to load into memory [0x0, 0x1000) (optional)
    """

    # Assemble the program and get accurate line mapping from assembler
    binary, pc_to_line = assemble(assembly_code, file_change_line=file_change_line, return_line_mapping=True)

    # Create reverse mapping (line to PC) and source lines
    source_lines = assembly_code.split('\n')
    line_to_pc = {v: k for k, v in pc_to_line.items()}

    # Create simulator
    sim = Simulator()
    sim.debug = False  # Disable simulator's debug output
    sim.get_stack_trace = True  # Enable call stack tracing for debugger
    sim.get_mh = True

    # Load program
    sim.load(binary)

    # Load SLD file if specified
    if sld_file:
        print(f"Loading SLD file: {sld_file} into memory [0x0, 0x1000)...")
        load_sld_file(sim.state, sld_file, start_addr=0x0, end_addr=0x1000)
        print("SLD file loaded successfully")

    # Create debugger
    debugger = Debugger(sim, source_lines)
    debugger.line_to_pc = line_to_pc
    debugger.pc_to_line = pc_to_line

    debugger.run_interactive()

    # Show final state
    print("\n" + "="*60)
    print("Final State:")
    print("="*60)
    print(f"PC: 0x{sim.state.pc:08x}")
    print(f"Result in a0 (x10): {sim.get_reg(10)}")


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description='RISC-V Debugger - Interactive debugger for RISC-V assembly programs',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python run_debugger.py program.s lib.s

Modes:
  Interactive: Full debugger with commands (break, continue, step, etc.)
        """
    )

    parser.add_argument(
        'input',
        nargs='+',
        help='Input assembly file(s) - multiple files will be linked'
    )

    parser.add_argument(
        '-i', '--input-sld',
        metavar='FILE',
        help='SLDファイルをメモリの0x0~0x1000にロードする（スペース区切りの10進数整数、32ビットワード単位）'
    )

    args = parser.parse_args()

    # Validate input files
    for filepath in args.input:
        if not os.path.exists(filepath):
            print(f"Error: File not found: {filepath}")
            sys.exit(1)

    # Validate SLD file if specified
    if args.input_sld and not os.path.exists(args.input_sld):
        print(f"Error: SLD file not found: {args.input_sld}")
        sys.exit(1)

    # Determine mode
    assemble_code, file_change_line = link_files(args.input, format='assemble')
    print(f"Assembling {args.input}...")
    run_debugger(assemble_code, file_change_line, args.input_sld)

if __name__ == "__main__":
    main()
