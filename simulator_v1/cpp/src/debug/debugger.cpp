#include "debugger.h"
#include <iostream>
#include <iomanip>
#include <sstream>
#include <string>

namespace
{
    // RISC-V ABI register names
    const char *REGISTER_NAMES[32] = {
        "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
        "s0/fp", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
        "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
        "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"};

    // RISC-V floating-point ABI register names
    const char *FP_REGISTER_NAMES[32] = {
        "ft0", "ft1", "ft2", "ft3", "ft4", "ft5", "ft6", "ft7",
        "fs0", "fs1", "fa0", "fa1", "fa2", "fa3", "fa4", "fa5",
        "fa6", "fa7", "fs2", "fs3", "fs4", "fs5", "fs6", "fs7",
        "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"};

    float uint32ToFloat(uint32_t bits)
    {
        union
        {
            uint32_t i;
            float f;
        } converter;
        converter.i = bits;
        return converter.f;
    }
} // namespace

PipelineDebugger::PipelineDebugger(PipelineProcessor &cpu)
    : cpu(cpu)
{
}

void PipelineDebugger::setSourceLines(const std::vector<std::string> &lines)
{
    sourceLines = lines;
}

void PipelineDebugger::setPCtoLine(const std::unordered_map<uint32_t, int> &pc_to_line_dict)
{
    pc_to_line = pc_to_line_dict;

    std::unordered_map<int, uint32_t> line_to_pc_dict;
    for (const auto &[pc, line] : pc_to_line)
    {
        line_to_pc_dict[line] = pc;
    }
    line_to_pc = line_to_pc_dict;
}

std::string PipelineDebugger::trim(const std::string &s)
{
    const char *ws = " \t\r\n";
    auto start = s.find_first_not_of(ws);
    if (start == std::string::npos)
    {
        return "";
    }
    auto end = s.find_last_not_of(ws);
    return s.substr(start, end - start + 1);
}

std::vector<std::string> PipelineDebugger::tokenize(const std::string &line)
{
    std::istringstream iss(line);
    std::vector<std::string> tokens;
    std::string word;
    while (iss >> word)
    {
        tokens.push_back(word);
    }
    return tokens;
}

bool PipelineDebugger::parseUint32(const std::string &text, uint32_t &value)
{
    try
    {
        size_t idx = 0;
        int base = 10;
        if (text.size() > 2 && text[0] == '0' && (text[1] == 'x' || text[1] == 'X'))
        {
            base = 16;
        }
        value = static_cast<uint32_t>(std::stoul(text, &idx, base));
        return idx == text.size();
    }
    catch (...)
    {
        return false;
    }
}

void PipelineDebugger::printHelp() const
{
    std::cout << "Debugger commands:\n"
                 "  s, step           Execute one cycle and show snapshot\n"
                 "  c, continue       Run until breakpoint or program end\n"
                 "  b, break <pc>     Set breakpoint at PC (hex or dec)\n"
                 "  d, delete <pc>    Remove breakpoint\n"
                 "  l, list           List breakpoints\n"
                 "  r, regs           Show general-purpose registers\n"
                 "  f, fregs          Show floating-point registers\n"
                 "  p, pipeline       Show detailed pipeline stages\n"
                 "  stack, st [n]     Show stack memory (default: 10 words from SP)\n"
                 "  i, info           Show current snapshot summary\n"
                 "  m, mem <addr> [n] Dump memory words starting at addr\n"
                 "  stats             Show statistics\n"
                 "  q, quit           Exit debugger\n";
}

void PipelineDebugger::printSnapshot() const
{
    const auto &snap = cpu.getLogSnapshot();
    std::cout << "\n=== Cycle " << snap.cycle << " ===\n";

    // Pipeline stage PCs
    std::cout << "Pipeline: ";
    std::cout << "IF=0x" << std::hex << std::setw(8) << std::setfill('0') << snap.if_id_snapshot.pc;
    std::cout << " ID=0x" << std::setw(8) << snap.id_ex_snapshot.pc;
    std::cout << " EX=0x" << std::setw(8) << snap.ex_mem_snapshot.pc;
    std::cout << " MEM=0x" << std::setw(8) << snap.mem_wb_snapshot.pc;
    std::cout << " WB=0x" << std::setw(8) << snap.wb_snapshot.pc << std::dec << "\n\n";

    // Current instruction (EX stage)
    std::cout << "[EX] ";
    if (snap.currentInstruction.type != InstructionType::NOP)
    {
        std::cout << snap.currentInstruction.toString() << "\n";
    }
    else if (snap.fetchedInstruction != 0)
    {
        std::cout << "0x" << std::hex << std::setw(8) << std::setfill('0')
                  << snap.fetchedInstruction << std::dec << "\n";
    }
    else
    {
        std::cout << "(NOP)\n";
    }

    auto reg1 = static_cast<uint32_t>(snap.regRead1Value);
    auto reg2 = static_cast<uint32_t>(snap.regRead2Value);
    auto regName = [&](uint8_t idx, RegType t) -> std::string
    {
        if (t == RegType::Fp)
        {
            return std::string("f") + std::to_string(idx) + " (" + getfpRegisterName(idx) + ")";
        }
        else
        {
            return std::string("x") + std::to_string(idx) + " (" + getRegisterName(idx) + ")";
        }
    };
    auto fmtVal = [&](uint32_t v, RegType t) -> std::string
    {
        std::ostringstream oss;
        oss << "0x" << std::hex << std::setw(8) << std::setfill('0') << v;
        if (t == RegType::Fp)
        {
            oss << std::dec << " (" << uint32ToFloat(v) << ")";
        }
        return oss.str();
    };
    std::cout << "  Reg reads: ";
    if (snap.currentInstruction.rs1Type != RegType::None)
    {
        std::cout << regName(snap.regRead1Index, snap.currentInstruction.rs1Type)
                  << "=" << fmtVal(reg1, snap.currentInstruction.rs1Type);
    }
    else
    {
        std::cout << "(none)";
    }
    std::cout << ", ";
    if (snap.currentInstruction.rs2Type != RegType::None)
    {
        std::cout << regName(snap.regRead2Index, snap.currentInstruction.rs2Type)
                  << "=" << fmtVal(reg2, snap.currentInstruction.rs2Type);
    }
    else
    {
        std::cout << "(none)";
    }
    std::cout << std::dec << "\n";

    auto alu = static_cast<uint32_t>(snap.aluResult);
    std::cout << "  ALU=0x" << std::hex << std::setw(8) << alu << std::dec
              << " FPU=" << snap.fpuResult
              << " MDU=" << snap.mduResult << "\n";

    // WB stage write back
    if (snap.wb_snapshot.inst.type != InstructionType::NOP &&
        snap.wb_snapshot.inst.rdType != RegType::None &&
        !(snap.wb_snapshot.inst.rdType == RegType::Int && snap.wb_snapshot.writeReg == 0))
    {
        std::cout << "\n[WB] " << snap.wb_snapshot.inst.toString() << "\n";
        bool isLoad = (snap.wb_snapshot.inst.opcode == Opcode::LW ||
                       snap.wb_snapshot.inst.opcode == Opcode::LB ||
                       snap.wb_snapshot.inst.opcode == Opcode::FLW);
        uint32_t writeValue = isLoad ? snap.wb_snapshot.memData : snap.wb_snapshot.aluResult;

        std::cout << "  Writing ";
        if (snap.wb_snapshot.inst.rdType == RegType::Fp)
        {
            std::cout << "f" << static_cast<int>(snap.wb_snapshot.writeReg)
                      << " (" << FP_REGISTER_NAMES[snap.wb_snapshot.writeReg] << ")";
        }
        else
        {
            std::cout << "x" << static_cast<int>(snap.wb_snapshot.writeReg)
                      << " (" << getRegisterName(snap.wb_snapshot.writeReg) << ")";
        }
        std::cout << " = 0x" << std::hex << std::setw(8) << std::setfill('0')
                  << writeValue;
        if (snap.wb_snapshot.inst.rdType == RegType::Fp)
        {
            std::cout << std::dec << " (" << uint32ToFloat(writeValue) << ")";
        }
        else
        {
            std::cout << std::dec << " (" << static_cast<int32_t>(writeValue) << ")";
        }
        std::cout << "\n";
    }
}

void PipelineDebugger::listBreakpoints() const
{
    if (breakpoints.empty())
    {
        std::cout << "No breakpoints set.\n";
        return;
    }
    std::cout << "Breakpoints:\n";
    for (auto pc : breakpoints)
    {
        std::cout << "  0x" << std::hex << std::setw(8) << std::setfill('0') << pc << std::dec << "\n";
    }
}

void PipelineDebugger::addBreakpoint(uint32_t pc)
{
    breakpoints.insert(pc);
    std::cout << "Breakpoint set at 0x" << std::hex << std::setw(8) << std::setfill('0') << pc << std::dec << "\n";
}

void PipelineDebugger::removeBreakpoint(uint32_t pc)
{
    auto it = breakpoints.find(pc);
    if (it == breakpoints.end())
    {
        std::cout << "No breakpoint at 0x" << std::hex << std::setw(8) << std::setfill('0') << pc << std::dec << "\n";
        return;
    }
    breakpoints.erase(it);
    std::cout << "Removed breakpoint at 0x" << std::hex << std::setw(8) << std::setfill('0') << pc << std::dec << "\n";
}

void PipelineDebugger::printMemory(uint32_t address, uint32_t count) const
{
    std::cout << "Memory dump from 0x" << std::hex << std::setw(8) << std::setfill('0') << address << std::dec << "\n";
    for (uint32_t i = 0; i < count; ++i)
    {
        uint32_t addr = address + i * 4;
        uint32_t data = cpu.peekMemory(addr);
        std::cout << "  0x" << std::hex << std::setw(8) << std::setfill('0') << addr
                  << ": 0x" << std::setw(8) << data << std::dec
                  << " (" << static_cast<int32_t>(data) << ")\n";
    }
}

void PipelineDebugger::printStack(uint32_t count) const
{
    const auto &snap = cpu.getLogSnapshot();
    uint32_t sp = snap.registers[2]; // sp is x2

    std::cout << "\nStack (SP = 0x" << std::hex << std::setw(8) << std::setfill('0') << sp << std::dec << "):\n";
    std::cout << "  Address      Value (hex)  Value (dec)\n";
    std::cout << "  ------------------------------------------\n";

    for (uint32_t i = 0; i < count; ++i)
    {
        uint32_t addr = sp + (i * 4);
        uint32_t data = cpu.peekMemory(addr);
        int32_t signed_value = static_cast<int32_t>(data);

        const char *marker = (i == 0) ? "SP-> " : "     ";
        std::cout << "  " << marker << "0x" << std::hex << std::setw(8) << std::setfill('0') << addr
                  << ": 0x" << std::setw(8) << data << std::dec << std::setfill(' ')
                  << "  " << std::setw(11) << signed_value << "\n";
    }
}

void PipelineDebugger::printFloatRegisters() const
{
    const auto &snap = cpu.getLogSnapshot();

    std::cout << "\nFloating-Point Registers:\n";
    for (int i = 0; i < 32; i += 4)
    {
        for (int j = 0; j < 4; ++j)
        {
            int reg = i + j;
            uint32_t bits = snap.fpRegisters[reg];
            float value = uint32ToFloat(bits);

            std::cout << "  f" << std::setw(2) << reg << " (" << std::setw(4) << std::left << FP_REGISTER_NAMES[reg] << std::right << "): "
                      << "0x" << std::hex << std::setw(8) << std::setfill('0') << bits << std::dec << std::setfill(' ')
                      << " (" << std::setw(14) << std::fixed << std::setprecision(6) << value << ")  ";
        }
        std::cout << "\n";
    }
}

const char *PipelineDebugger::getRegisterName(uint8_t index)
{
    if (index < 32)
    {
        return REGISTER_NAMES[index];
    }
    return "???";
}

const char *PipelineDebugger::getfpRegisterName(uint8_t index)
{
    if (index < 32)
    {
        return FP_REGISTER_NAMES[index];
    }
    return "???";
}

int PipelineDebugger::getRegisterIndex(const std::string &name)
{
    for (int i = 0; i < 32; ++i)
    {
        if (name == REGISTER_NAMES[i] || name == ("x" + std::to_string(i)))
        {
            return i;
        }
        if (name == std::to_string(i))
        {
            return i;
        }
    }

    return -1;
}

void PipelineDebugger::printRegister(const std::string &regName) const
{
    int idx = getRegisterIndex(regName);
    if (idx < 0)
    {
        std::cout << "Unknown register: " << regName << "\n";
        return;
    }

    const auto &snap = cpu.getLogSnapshot();
    uint32_t value = snap.registers[idx];
    std::cout << "x" << std::setw(2) << std::setfill(' ') << idx << " (" << std::setw(5) << std::setfill(' ') << getRegisterName(idx) << ") = 0x"
              << std::hex << std::setw(8) << std::setfill('0') << value << std::dec
              << " (" << std::setw(14) << std::setfill(' ') << static_cast<int32_t>(value) << ")";
}

void PipelineDebugger::printRegisters() const
{
    std::cout << "\nRegisters:\n";
    for (int i = 0; i < 32; i += 4)
    {
        for (int j = 0; j < 4; ++j)
        {
            int reg = i + j;
            printRegister(getRegisterName(reg));
            std::cout << "  ";
        }
        std::cout << "\n";
    }
}

int getLinefromPC(uint32_t pc, std::unordered_map<uint32_t, int> pc_to_line)
{
    int line = -1; // 未対応を表す値
    auto it = pc_to_line.find(pc);
    if (it != pc_to_line.end())
    {
        line = it->second;
    }
    if (line == -1)
    {
        std::cerr << "pc is not valid\n";
    }
    return line;
};

void PipelineDebugger::printSourceContext(int lines_before, int lines_after) const
{
    if (sourceLines.empty())
    {
        std::cout << "No source code available\n";
        std::cout << "(Use debugger mode with assembly files to see source)\n";
        return;
    }

    const auto &snap = cpu.getLogSnapshot();
    uint32_t pc_if = snap.if_id_snapshot.pc;
    uint32_t pc_id = snap.id_ex_snapshot.pc;
    uint32_t pc_ex = snap.ex_mem_snapshot.pc;
    uint32_t pc_mem = snap.mem_wb_snapshot.pc;
    uint32_t pc_wb = snap.wb_snapshot.pc;

    // PCを行番号に変換
    int line_if = getLinefromPC(pc_if, pc_to_line);
    int line_id = getLinefromPC(pc_id, pc_to_line);
    int line_ex = getLinefromPC(pc_ex, pc_to_line);
    int line_mem = getLinefromPC(pc_mem, pc_to_line);
    int line_wb = getLinefromPC(pc_wb, pc_to_line);

    int min_line = std::min({line_if, line_id, line_ex, line_mem, line_wb});
    int max_line = std::max({line_if, line_id, line_ex, line_mem, line_wb});

    if (max_line - min_line < 15)
    {
        std::cout << "\n=== Source Context ===\n";

        int start = std::max(0, min_line - lines_before);
        int end = std::min(static_cast<int>(sourceLines.size()), max_line + lines_after + 1);

        for (int i = start; i < end; ++i)
        {
            std::string marker = "                 ";

            // 複数ステージが同じ行にある場合
            std::string stages = "";
            if (i == line_if)
                stages += "IF ";
            if (i == line_id)
                stages += "ID ";
            if (i == line_ex)
                stages += "EX ";
            if (i == line_mem)
                stages += "MEM ";
            if (i == line_wb)
                stages += "WB ";

            if (!stages.empty())
            {
                marker = "[" + stages.substr(0, stages.length() - 1);
                while (marker.length() < 16)
                    marker += " ";
                marker += "]";
            }

            std::cout << marker << std::setw(5) << (i + 1) << ": " << sourceLines[i] << "\n";
        }
    }
    else // Stages spread out - show each stage separately
    {
        // IF Stage
        if (line_if >= 0)
        {
            std::cout << "\n[IF Stage] PC: 0x" << std::hex << pc_if << std::dec << "\n";
            int start = std::max(0, line_if - lines_before);
            int end = std::min(static_cast<int>(sourceLines.size()), line_if + lines_after + 1);
            for (int i = start; i < end; ++i)
            {
                const char *marker = (i == line_if) ? " IF => " : "       ";
                std::cout << marker << std::setw(5) << (i + 1) << ": " << sourceLines[i] << "\n";
            }
        }

        // ID Stage
        if (line_id >= 0)
        {
            std::cout << "\n[ID Stage] PC: 0x" << std::hex << pc_id << std::dec << "\n";
            int start = std::max(0, line_id - lines_before);
            int end = std::min(static_cast<int>(sourceLines.size()), line_id + lines_after + 1);
            for (int i = start; i < end; ++i)
            {
                const char *marker = (i == line_id) ? " ID => " : "       ";
                std::cout << marker << std::setw(5) << (i + 1) << ": " << sourceLines[i] << "\n";
            }
        }

        // EX Stage
        if (line_ex >= 0)
        {
            std::cout << "\n[EX Stage] PC: 0x" << std::hex << pc_ex << std::dec << "\n";
            int start = std::max(0, line_ex - lines_before);
            int end = std::min(static_cast<int>(sourceLines.size()), line_ex + lines_after + 1);
            for (int i = start; i < end; ++i)
            {
                const char *marker = (i == line_ex) ? " EX => " : "       ";
                std::cout << marker << std::setw(5) << (i + 1) << ": " << sourceLines[i] << "\n";
            }
        }

        // MEM Stage
        if (line_mem >= 0)
        {
            std::cout << "\n[MEM Stage] PC: 0x" << std::hex << pc_mem << std::dec << "\n";
            int start = std::max(0, line_mem - lines_before);
            int end = std::min(static_cast<int>(sourceLines.size()), line_mem + lines_after + 1);
            for (int i = start; i < end; ++i)
            {
                const char *marker = (i == line_mem) ? "MEM => " : "       ";
                std::cout << marker << std::setw(5) << (i + 1) << ": " << sourceLines[i] << "\n";
            }
        }

        // WB Stage
        if (line_wb >= 0)
        {
            std::cout << "\n[WB Stage] PC: 0x" << std::hex << pc_wb << std::dec << "\n";
            int start = std::max(0, line_wb - lines_before);
            int end = std::min(static_cast<int>(sourceLines.size()), line_wb + lines_after + 1);
            for (int i = start; i < end; ++i)
            {
                const char *marker = (i == line_wb) ? " WB => " : "       ";
                std::cout << marker << std::setw(5) << (i + 1) << ": " << sourceLines[i] << "\n";
            }
        }
    }
}

void PipelineDebugger::printPipeline() const
{
    const auto &snap = cpu.getLogSnapshot();

    std::cout << "\n=== Pipeline Stages (Cycle " << snap.cycle << ") ===\n\n";

    // IF/ID Stage
    std::cout << "[IF/ID]\n";
    std::cout << "  PC:          0x" << std::hex << std::setw(8) << std::setfill('0')
              << snap.if_id_snapshot.pc << std::dec << "\n";
    std::cout << "  Instruction: 0x" << std::hex << std::setw(8) << std::setfill('0')
              << snap.if_id_snapshot.instruction << std::dec << "\n";
    std::cout << "  Stall:       " << (snap.if_id_snapshot.stall ? "YES" : "NO") << "\n\n";

    // ID/EX Stage
    std::cout << "[ID/EX]\n";
    std::cout << "  PC:          0x" << std::hex << std::setw(8) << std::setfill('0')
              << snap.id_ex_snapshot.pc << std::dec << "\n";
    std::cout << "  Instruction: " << snap.id_ex_snapshot.inst.toString() << "\n";
    auto regName = [&](uint8_t idx, RegType t) -> std::string
    {
        if (t == RegType::Fp)
        {
            return std::string("f") + std::to_string(idx) + " (" + getfpRegisterName(idx) + ")";
        }
        else
        {
            return std::string("x") + std::to_string(idx) + " (" + getRegisterName(idx) + ")";
        }
    };
    auto fmtVal = [&](uint32_t v, RegType t) -> std::string
    {
        std::ostringstream oss;
        oss << "0x" << std::hex << std::setw(8) << std::setfill('0') << v;
        if (t == RegType::Fp)
        {
            oss << std::dec << " (" << uint32ToFloat(v) << ")";
        }
        return oss.str();
    };
    std::cout << "  rs1 (" << regName(snap.id_ex_snapshot.rs1, snap.id_ex_snapshot.inst.rs1Type) << "): "
              << fmtVal(snap.id_ex_snapshot.readData1, snap.id_ex_snapshot.inst.rs1Type) << "\n";
    std::cout << "  rs2 (" << regName(snap.id_ex_snapshot.rs2, snap.id_ex_snapshot.inst.rs2Type) << "): "
              << fmtVal(snap.id_ex_snapshot.readData2, snap.id_ex_snapshot.inst.rs2Type) << "\n";
    std::cout << "  rd:          " << regName(snap.id_ex_snapshot.rd, snap.id_ex_snapshot.inst.rdType) << "\n";
    std::cout << "  Immediate:   0x" << std::hex << std::setw(8) << std::setfill('0')
              << snap.id_ex_snapshot.immediate << std::dec << " (" << static_cast<int32_t>(snap.id_ex_snapshot.immediate) << ")\n";
    std::cout << "  Stall:       " << (snap.id_ex_snapshot.stall ? "YES" : "NO") << "\n";
    std::cout << "\n";

    // EX/MEM Stage
    std::cout << "[EX/MEM]\n";
    std::cout << "  PC:          0x" << std::hex << std::setw(8) << std::setfill('0')
              << snap.ex_mem_snapshot.pc << std::dec << "\n";
    std::cout << "  Instruction: " << snap.ex_mem_snapshot.inst.toString() << "\n";
    std::cout << "  ALU Result:  " << fmtVal(snap.ex_mem_snapshot.aluResult, snap.ex_mem_snapshot.inst.rdType);
    if (snap.ex_mem_snapshot.inst.rdType != RegType::Fp)
    {
        std::cout << " (" << static_cast<int32_t>(snap.ex_mem_snapshot.aluResult) << ")";
    }
    std::cout << "\n";
    std::cout << "  Write Data:  " << fmtVal(snap.ex_mem_snapshot.writeData, snap.ex_mem_snapshot.inst.rs2Type) << "\n";
    std::cout << "  Write Reg:   " << regName(snap.ex_mem_snapshot.writeReg, snap.ex_mem_snapshot.inst.rdType) << "\n";
    std::cout << "  Branch:      " << (snap.ex_mem_snapshot.branch ? "TAKEN" : "NOT TAKEN") << "\n";
    if (snap.ex_mem_snapshot.branch)
    {
        std::cout << "  Branch Tgt:  0x" << std::hex << std::setw(8) << std::setfill('0')
                  << snap.ex_mem_snapshot.branchTarget << std::dec << "\n";
    }
    std::cout << "  Stall:       " << (snap.ex_mem_snapshot.stall ? "YES" : "NO") << "\n";

    std::cout << "\n";

    // MEM/WB Stage
    std::cout << "[MEM/WB]\n";
    std::cout << "  Instruction: " << snap.mem_wb_snapshot.inst.toString() << "\n";
    std::cout << "  ALU Result:  " << fmtVal(snap.mem_wb_snapshot.aluResult, snap.mem_wb_snapshot.inst.rdType);
    if (snap.mem_wb_snapshot.inst.rdType != RegType::Fp)
    {
        std::cout << " (" << static_cast<int32_t>(snap.mem_wb_snapshot.aluResult) << ")";
    }
    std::cout << "\n";
    // メモリアクセス結果はロード時の型に合わせて表示
    RegType memType = snap.mem_wb_snapshot.inst.opcode == Opcode::FLW ? RegType::Fp : snap.mem_wb_snapshot.inst.rdType;
    std::cout << "  Mem Data:    " << fmtVal(snap.mem_wb_snapshot.memData, memType);
    if (memType != RegType::Fp)
    {
        std::cout << " (" << static_cast<int32_t>(snap.mem_wb_snapshot.memData) << ")";
    }
    std::cout << "\n";
    std::cout << "  Write Reg:   " << regName(snap.mem_wb_snapshot.writeReg, snap.mem_wb_snapshot.inst.rdType) << "\n";
    std::cout << "  Stall:       " << (snap.mem_wb_snapshot.stall ? "YES" : "NO") << "\n";

    std::cout << "\n";

    // WB Stage (Write Back - completed)
    std::cout << "[WB] (Write Back Completed)\n";
    std::cout << "  Instruction: " << snap.wb_snapshot.inst.toString() << "\n";

    // Determine what value was written back
    bool isLoad = (snap.wb_snapshot.inst.opcode == Opcode::LW ||
                   snap.wb_snapshot.inst.opcode == Opcode::LB ||
                   snap.wb_snapshot.inst.opcode == Opcode::FLW);

    uint32_t writeValue = isLoad ? snap.wb_snapshot.memData : snap.wb_snapshot.aluResult;
    std::cout << "  Write Value: " << fmtVal(writeValue, snap.wb_snapshot.inst.rdType);
    if (snap.wb_snapshot.inst.rdType != RegType::Fp)
    {
        std::cout << " (" << static_cast<int32_t>(writeValue) << ")";
    }
    if (isLoad)
    {
        std::cout << " [from memory]";
    }
    else
    {
        std::cout << " [from ALU/FPU]";
    }
    std::cout << "\n";

    std::cout << "  Write Reg:   " << regName(snap.wb_snapshot.writeReg, snap.wb_snapshot.inst.rdType) << "\n";
    std::cout << "\n";

    // Forwarding Unit
    std::cout << "[Forwarding]\n";
    const char *forwardTypeA = "NONE";
    const char *forwardTypeB = "NONE";
    ForwardingUnit::Result forwardingResult = snap.forwarding_snapshot;
    if (forwardingResult.forwardA == ForwardingUnit::ForwardType::FROM_EX_MEM)
        forwardTypeA = "FROM_EX_MEM";
    else if (forwardingResult.forwardA == ForwardingUnit::ForwardType::FROM_MEM_WB)
        forwardTypeA = "FROM_MEM_WB";

    if (forwardingResult.forwardB == ForwardingUnit::ForwardType::FROM_EX_MEM)
        forwardTypeB = "FROM_EX_MEM";
    else if (forwardingResult.forwardB == ForwardingUnit::ForwardType::FROM_MEM_WB)
        forwardTypeB = "FROM_MEM_WB";

    std::cout << "  Forward A:   " << forwardTypeA;
    if (forwardingResult.forwardA != ForwardingUnit::ForwardType::NONE)
    {
        std::cout << " (value=0x" << std::hex << std::setw(8) << std::setfill('0')
                  << forwardingResult.forwardValueA << std::dec << ")";
    }
    std::cout << "\n";
    std::cout << "  Forward B:   " << forwardTypeB;
    if (forwardingResult.forwardB != ForwardingUnit::ForwardType::NONE)
    {
        std::cout << " (value=0x" << std::hex << std::setw(8) << std::setfill('0')
                  << forwardingResult.forwardValueB << std::dec << ")";
    }
    std::cout << "\n\n";

    // Hazard Detection
    std::cout << "[Hazard Detection]\n";
    std::cout << "  Stall:       " << (snap.hazard_snapshot.shouldStall() ? "YES" : "NO") << "\n";
    std::cout << "  Flush:       " << (snap.hazard_snapshot.shouldFlush() ? "YES" : "NO") << "\n";
}

bool PipelineDebugger::step(bool show)
{
    if (!cpu.isRunning())
    {
        std::cout << "Processor halted.\n";
        return false;
    }

    cpu.clock();

    if (show)
    {
        printSnapshot();
        printSourceContext(5, 5);
    }

    const auto &snap = cpu.getLogSnapshot();
    if (!breakpoints.empty() && breakpoints.count(snap.currentInstructionAddress))
    {
        std::cout << "Hit breakpoint at 0x" << std::hex << std::setw(8) << std::setfill('0')
                  << snap.currentInstructionAddress << std::dec << "\n";
        return false;
    }

    if (!cpu.isRunning())
    {
        std::cout << "Program completed.\n";
        return false;
    }

    return true;
}

void PipelineDebugger::continueExecution()
{
    if (!cpu.isRunning())
    {
        std::cout << "Processor halted.\n";
        return;
    }

    while (cpu.isRunning())
    {
        cpu.clock();
        const auto &snap = cpu.getLogSnapshot();
        if (!breakpoints.empty() && breakpoints.count(snap.if_id_snapshot.pc))
        {
            std::cout << "Hit breakpoint at 0x" << std::hex << std::setw(8) << std::setfill('0')
                      << snap.if_id_snapshot.pc << std::dec << "\n";
            printSnapshot();
            return;
        }
    }

    std::cout << "Program completed.\n";
}

void PipelineDebugger::handleCommand(const std::string &line)
{
    auto trimmed = trim(line);
    if (trimmed.empty())
    {
        step(true);
        return;
    }

    auto tokens = tokenize(trimmed);
    auto cmd = tokens.front();

    if (cmd == "h" || cmd == "help")
    {
        printHelp();
    }
    else if (cmd == "s" || cmd == "step")
    {
        step(true);
    }
    else if (cmd == "c" || cmd == "continue")
    {
        continueExecution();
    }
    else if (cmd == "b" || cmd == "break")
    {
        if (tokens.size() < 2)
        {
            std::cout << "Usage: break <pc>\n";
            return;
        }
        uint32_t value = 0;
        if (!parseUint32(tokens[1], value))
        {
            std::cout << "Invalid address.\n";
            return;
        }
        addBreakpoint(value);
    }
    else if (cmd == "d" || cmd == "delete")
    {
        if (tokens.size() < 2)
        {
            std::cout << "Usage: delete <pc>\n";
            return;
        }
        uint32_t value = 0;
        if (!parseUint32(tokens[1], value))
        {
            std::cout << "Invalid address.\n";
            return;
        }
        removeBreakpoint(value);
    }
    else if (cmd == "l" || cmd == "list")
    {
        listBreakpoints();
    }
    else if (cmd == "r" || cmd == "regs")
    {
        if (tokens.size() == 2)
        {
            printRegister(tokens[1]);
            std::cout << "\n";
            return;
        }
        if (tokens.size() == 1)
        {
            printRegisters();
        }
    }
    else if (cmd == "f" || cmd == "fregs")
    {
        printFloatRegisters();
    }
    else if (cmd == "p" || cmd == "pipeline")
    {
        printPipeline();
    }
    else if (cmd == "i" || cmd == "info")
    {
        printSnapshot();
    }
    else if (cmd == "stack" || cmd == "st")
    {
        uint32_t count = 10;
        if (tokens.size() >= 2)
        {
            if (!parseUint32(tokens[1], count))
            {
                std::cout << "Invalid count, using default (10)\n";
                count = 10;
            }
        }
        printStack(count);
    }
    else if (cmd == "m" || cmd == "mem")
    {
        if (tokens.size() < 2)
        {
            std::cout << "Usage: mem <addr> [count]\n";
            return;
        }
        uint32_t addr = 0;
        if (!parseUint32(tokens[1], addr))
        {
            std::cout << "Invalid address.\n";
            return;
        }
        uint32_t count = 4;
        if (tokens.size() >= 3)
        {
            if (!parseUint32(tokens[2], count))
            {
                std::cout << "Invalid count.\n";
                return;
            }
        }
        printMemory(addr, count);
    }
    else if (cmd == "stats")
    {
        cpu.printStatistics();
    }
    else if (cmd == "q" || cmd == "quit")
    {
        running = false;
    }
    else
    {
        std::cout << "Unknown command. Type 'help' for list.\n";
    }
}

void PipelineDebugger::runInteractive()
{
    printHelp();
    printSnapshot();
    printSourceContext();

    std::string line;

    while (running)
    {
        if (!cpu.isRunning())
        {
            std::cout << "Processor halted.\n";
            break;
        }

        std::cout << "(dbg) ";
        if (!std::getline(std::cin, line))
        {
            break;
        }
        handleCommand(line);
    }

    std::cout << "\nFinal registers:\n";
    cpu.printRegisters();
    cpu.printStatistics();
}
