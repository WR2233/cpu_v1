#!/usr/bin/env python3
"""Run RISC-V Simulator

This script runs RISC-V assembly programs on the simulator.
Supports single file or multiple files (linker mode).
"""

import sys
import os
import argparse
import traceback
from typing import Optional, List

# Add parent directory to path to access assembler module
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from simulator import Simulator
from assembler.assembler import link_files
from simulator.order import load_sld_file

# Format memory history as readable text
def format_history(history, access_type):
    lines = []
    if access_type=="pc":
        for addr in history:
            # Convert to unsigned 32-bit for proper hex display
            addr_u = addr & 0xFFFFFFFF
            lines.append(f"0x{addr_u:08x}")
    else:
        for addr, value in history:
            # Convert to unsigned 32-bit for proper hex display
            addr_u = addr & 0xFFFFFFFF
            value_u = value & 0xFFFFFFFF
            if access_type == "MMIO":
                value_u_byte = value_u & 0xFF
                lines.append(f"0x{value_u_byte:02x}")
            else:
                lines.append(f"0x{addr_u:08x}")
                lines.append(f"0x{value_u:08x}")
    return "\n".join(lines)

def preserve_history(write_his= (None, None), read_his= (None, None), mmio_his= (None, None), pc_his=(None, None)):
    if write_his[0] :
        write_text = format_history(write_his[0], "Memory Write")
        read_text = format_history(read_his[0], "Memory Read")
        if write_his[1]:
            # Write to files
            write_path, read_path = write_his[1], read_his[1]
            print(f"\nWriting memory access history:")
            print(f"  Write history -> {write_path}")
            print(f"  Read history  -> {read_path}")

            with open(write_path, 'w', encoding='utf-8') as f:
                f.write(write_text)
            with open(read_path, 'w', encoding='utf-8') as f:
                f.write(read_text)

            print(f"Memory history saved successfully.")
            print(f"  Total writes: {len(write_his[0])}")
            print(f"  Total reads:  {len(read_his[0])}")
        else:
            # Print to stdout
            print("\n" + "="*50)
            print("MEMORY WRITE HISTORY")
            print("="*50)
            print(write_text)
            print("\n" + "="*50)
            print("MEMORY READ HISTORY")
            print("="*50)
            print(read_text)
            print("="*50)

    if mmio_his[0]:
        mmio_text = format_history(mmio_his[0], "MMIO")
        if mmio_his[1]:  # None or empty string -> print to stdout
            # Write to file
            mmio_path = mmio_his[1]
            print(f"\nWriting MMIO history:")
            print(f"   MMIO history -> {mmio_path}")

            with open(mmio_path, 'w', encoding='utf-8') as f:
                f.write(mmio_text)

            print(f"MMIO history saved successfully.")
            print(f"  Total MMIO: {len(mmio_his[0])}")
        else:
            # Print to stdout
            print("\n" + "="*50)
            print("MMIO HISTORY")
            print("="*50)
            print(mmio_text)
            print("="*50)

    if pc_his[0]:
        pc_txt = format_history(pc_his[0], "pc")
        if pc_his[1]:
            pc_path = pc_his[1]
            # Write to file
            print(f"\nWriting PC history:")
            print(f"   PC history -> {pc_path}")

            with open(pc_path, 'w', encoding='utf-8') as f:
                f.write(pc_txt)

            print(f"pc history saved successfully.")
        else:
            print("\n" + "="*50)
            print("PC HISTORY")
            print("="*50)
            print(pc_txt)
            print("="*50)
    return

def run_simulator(binary: list, mh: Optional[list] = None, mmio_path: str = '', sld_file: str = None, pc_path: Optional[str] = None):
    # Create simulator
    sim = Simulator()
    if mh is not None:
        sim.get_mh = True
    if mmio_path is not None:
        sim.get_mmioh = True
    if pc_path is not None:
        sim.get_pch = True
    # Always track stack trace for debugger
    sim.get_stack_trace = True

    # Load program
    sim.load(binary)

    # Load SLD file if specified
    if sld_file:
        print(f"Loading SLD file: {sld_file} into memory [0x0, 0x1000)...")
        load_sld_file(sim.state, sld_file, start_addr=0x0, end_addr=0x1000)
        print("SLD file loaded successfully")
    print("Starting simulation...\n")
    
    # Run the program
    try:
        cycles = sim.run(max_cycles=10000000000)
        print(f"\nExecution completed in {cycles} cycles")
    except KeyboardInterrupt:
        print(f"\n\nSimulation interrupted by user (Ctrl+C)")
        cycles = sim.state.cycle
        print(f"Executed {cycles} cycles before interruption")

    # Get result from a0
    result = sim.get_reg(10)
    print(f"{result}")

    # Show final register state
    print("\nFinal registers:")
    sim.print_state()
    
    # historyの保存
    write_his = None
    read_his  = None
    mmio_his  = None
    pc_his    = None
    if sim.get_mh:
        write_his, read_his = sim.dump_mh() 
    if sim.get_mmioh:
        mmio_his = sim.dump_mmioh()
    if sim.get_pch:
        pc_his = sim.dump_pch()
    if mh is not None:
        preserve_history((write_his, mh[0]), (read_his, mh[1]), (mmio_his, mmio_path), (pc_his, pc_path))
    else:
        preserve_history((write_his, None), (read_his, None), (mmio_his, mmio_path), (pc_his, pc_path))
    return


def run_with_files(input_files: list, mh: Optional[list] = None, mmioh: Optional[str] = None, sld_file: str = None, pch: Optional[str] = None):
    """Run simulator on multiple assembly files (linker mode)

    Args:
        input_files: List of assembly file paths
        assemble_output: Optional path to save merged assembly source
        sld_file: Optional SLD file to load into memory [0x0, 0x1000)
    """
    binary = []
    ext_fst = input_files[0].split('.')[-1]
    if ext_fst == "bin":
        for f in input_files:
            with open(f, "rb") as fp:
                data= fp.read()
            for i in range(0, len(data) ,4):
                word = int.from_bytes(data[i:i+4], byteorder="little")
                binary.append(word)
    else:
        # Assemble the merged source
        print(f"Assembling merged code...")
        # Link and assemble
        binary = link_files(input_files)
        print(f"Assembled {len(binary)} instructions\n")

    run_simulator(binary, mh, mmioh, sld_file, pch)


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description='RISC-V Simulator - Run RISC-V assembly programs',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
    """
    )

    parser.add_argument(
        'input',
        nargs='+',
        help='Input assembly file(s) - multiple files will be linked'
    )
        
    parser.add_argument(
        '--get-memory-history', 
        nargs='*',
        help='メモリアクセスの履歴を出力する, (arg=0 -> 標準出力, args=2 -> それぞれのファイルに出力する)'
    )
    
    parser.add_argument(
        '--get-mmio-history',
        nargs='?',
        const='',  # 引数なしで指定された場合は空文字列
        help='MMIOへの書き込みを出力する, (arg=0 -> 標準出力, args=1 -> ファイルに出力する)'
    )

    parser.add_argument(
        '-i', '--input-sld',
        metavar='FILE',
        help='SLDファイルをメモリの0x0~0x1000にロードする（スペース区切りの10進数整数、32ビットワード単位）'
    )
    
    parser.add_argument(
        '--get-pc-history',
        nargs='?',
        const='',
        help='PCの履歴を出力する, (len(arg)=0 -> 標準出力, len(arg)=1 -> ファイルに出力する)'
    )

    parser.add_argument(
        '--get-history',
        action='store_true',
        help='--get-memory-history write.txt read.txt --get-mmio-history mmio_history.txt --get-pc-history pc_history.txt と等価'
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

    # Validate get-memory-history の引数
    mh = args.get_memory_history
    if mh is None:
        pass
    else:
        if len(mh) not in (0, 2):
            parser.error("--get-memory-history は０個または２個のパスのみ指定可能です。")

    mmio_history_path = args.get_mmio_history
    pc_history_path = args.get_pc_history
    
    if args.get_history:
        mh = ["./simulator/log/write.txt", "./simulator/log/read.txt"]
        mmio_history_path = "./simulator/log/mmio_history.txt"
        pc_history_path = "./simulator/log/pc_history.txt"
        
    # Run simulator
    try:
        run_with_files(args.input, mh, mmio_history_path, args.input_sld, pc_history_path)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    main()
