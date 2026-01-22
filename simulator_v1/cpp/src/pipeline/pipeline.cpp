#include "pipeline.h"
#include <iostream>
#include <iomanip>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <yaml-cpp/yaml.h>

namespace
{
    // RISC-V ABI register names
    const char *REGISTER_NAMES[32] = {
        "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
        "s0/fp", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
        "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
        "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"};
}

PipelineProcessor::PipelineProcessor()
    : registers{},
      fpRegisters{},
      memory(1 << 29, 1 << 18, "./log/output_mmio.ppm", 1 << 20), // moderate sizes to avoid overallocation
      pc(0),
      cycleCount(0),
      instructionCount(0),
      stallCount(0),
      flushCount(0),
      loadedInstructionCount(0),
      pipelineFrozen(false),
      cacheMissPenaltyRemaining(0),
      executed_ebreak(false)
{
    registers.fill(0);
    fpRegisters.fill(0);
    memory.reset();
    logSnapshot.registers = registers;
    logSnapshot.fpRegisters = fpRegisters;
    fpuEmulator.reset();

    // configファイルの読み込み
    YAML::Node config = YAML::LoadFile("config/config.yaml");
    if (config["registers"] && config["registers"].IsMap()) // 整数レジスタの初期値を設定
    {
        for (const auto &reg : config["registers"])
        {
            int index = reg.first.as<int>();
            uint32_t value = reg.second.as<uint32_t>();
            if (index >= 0 && index < 32)
            {
                registers[index] = value;
            }
        }
    }
    if (config["input_sld_file"] && config["input_sld_file"].IsScalar()) // sldファイルの初期ロード
    {
        std::string sld_filename = config["input_sld_file"].as<std::string>();
        std::ifstream sld_file(sld_filename, std::ios::binary);
        if (sld_file.is_open())
        {
            uint8_t byte;
            uint32_t address = 0;
            const uint32_t sld_end_addr = 0x1000;

            while (address < sld_end_addr && sld_file.read(reinterpret_cast<char *>(&byte), 1))
            {
                memory.writeByte(address, byte);
                address++;
            }
            sld_file.close();
            std::cout << "Loaded " << address << " bytes from SLD file: " << sld_filename << std::endl;
        }
        else
        {
            std::cerr << "Error: Cannot open SLD file " << sld_filename << std::endl;
            std::exit(1);
        }
    }
}

void PipelineProcessor::loadProgram(const std::vector<uint32_t> &program)
{
    size_t data_section_index = 0;
    bool in_code_secion = true;
    constexpr uint32_t BRAM_BASE = 0x80000000;
    loadedInstructionCount = 0;

    for (size_t i = 0; i < program.size(); ++i)
    {
        if (in_code_secion)
        {
            if (program[i] == 0x00000000)
            {
                in_code_secion = false;
                std::cout << "Switching to data section at index " << i << std::endl;
                continue;
            }
            if (!memory.setInstruction(i, program[i]))
            {
                std::cerr << "Warning: instruction memory overflow at index " << i << std::endl;
                break;
            }
            loadedInstructionCount++;
        }
        else // データセクションのロード
        {
            uint32_t address = data_section_index * 4 + BRAM_BASE;
            if (!memory.storeDataWord(address, program[i]))
            {
                std::cerr << "Warning: data section address out of range: 0x" << std::hex << address << std::dec << std::endl;
            }
            data_section_index++;
        }
    }

    pc = 0;
    cycleCount = 0;
    instructionCount = 0;
    pipelineFrozen = false;
    cacheMissPenaltyRemaining = 0;
    logSnapshot = LogSnapshot{};
    logSnapshot.registers = registers;
    fpuEmulator.reset();
}

uint32_t PipelineProcessor::getRegister(int index) const
{
    if (index >= 0 && index < 32)
    {
        return registers[index];
    }
    else
    {
        std::cerr << "Invalid register index: " << index << "\n";
    }
    return 0;
}

void PipelineProcessor::setRegister(int index, uint32_t value)
{
    if (index > 0 && index < 32)
    { // R0は書き込み不可
        registers[index] = value;
    }
    else
    {
        std::cerr << "Invalid register index: " << index << "\n";
    }
}

uint32_t PipelineProcessor::getfpRegister(int index) const
{
    if (index >= 0 && index < 32)
    {
        return fpRegisters[index];
    }
    else
    {
        std::cerr << "Invalid register index: " << index << "\n";
        std::exit(1);
    }
    return 0;
}

void PipelineProcessor::setfpRegister(int index, uint32_t value)
{
    if (index >= 0 && index < 32)
    {
        fpRegisters[index] = value;
    }
    else
    {
        std::cerr << "Invalid register index: " << index << "\n";
        std::exit(1);
    }
}

void PipelineProcessor::resetLogSnapshot()
{
    logSnapshot.cycle = cycleCount;
    logSnapshot.pc = pc;
    logSnapshot.currentInstructionAddress = 0;
    logSnapshot.fetchedInstruction = 0;
    logSnapshot.regRead1Value = 0;
    logSnapshot.regRead2Value = 0;
    logSnapshot.regRead1Index = 0;
    logSnapshot.regRead2Index = 0;
    logSnapshot.aluResult = 0;
    logSnapshot.fpuResult = 0;
    logSnapshot.mduResult = 0;
    logSnapshot.instructionBus = BusActivity{};
    logSnapshot.dataBus = BusActivity{};
    logSnapshot.romBus = BusActivity{};
    logSnapshot.currentInstruction = Instruction();
    logSnapshot.registers = registers;
    logSnapshot.fpRegisters = fpRegisters;
    logSnapshot.stallCount = static_cast<int>(stallCount);
    logSnapshot.flushCount = static_cast<int>(flushCount);
    logSnapshot.accessingAddress = 0;
    logSnapshot.accessingData = 0;
    logSnapshot.mmioWrite = false;
    logSnapshot.mmioValue = 0;
    logSnapshot.pipelineFrozen = false;

    // Capture pipeline stage snapshots
    logSnapshot.if_id_snapshot = if_id;
    logSnapshot.id_ex_snapshot = id_ex;
    logSnapshot.ex_mem_snapshot = ex_mem;
    logSnapshot.mem_wb_snapshot = mem_wb;
    logSnapshot.wb_snapshot = wb;
    // forwarding_snapshot is set in execute stage
    logSnapshot.hazard_snapshot = hazard;
}

void PipelineProcessor::clock()
{
    cycleCount++;
    resetLogSnapshot();

    fpuEmulator.clock();

    // Handle cache miss penalty
    if (cacheMissPenaltyRemaining > 0)
    {
        cacheMissPenaltyRemaining--;
        stallCount++;
        pipelineFrozen = true;
        logSnapshot.pipelineFrozen = true;
        return;
    }

    // ハザード検出
    detectHazards();

    // 逆順で実行 (WB -> MEM -> EX -> ID -> IF)
    writeBack();

    detectForwarding();

    bool memAdvanced = memoryAccess();
    pipelineFrozen = !memAdvanced;
    logSnapshot.pipelineFrozen = pipelineFrozen;

    execute();
    decode();
    fetch();
}

void PipelineProcessor::detectForwarding()
{
    forwarding.compute(id_ex, ex_mem, mem_wb, fpuEmulator);
}

void PipelineProcessor::detectHazards()
{
    hazard.compute(if_id, id_ex, ex_mem, fpuEmulator);
}

bool PipelineProcessor::isRunning()
{
    // EBREAKがWBステージに到達したら停止
    if (executed_ebreak)
    {
        return false;
    }

    return (pc / 4 < loadedInstructionCount) ||
           (if_id.instruction != 0) ||
           (id_ex.inst.type != InstructionType::NOP) ||
           (ex_mem.inst.type != InstructionType::NOP) ||
           (mem_wb.inst.type != InstructionType::NOP);
}

void PipelineProcessor::printPipeline() const
{
    std::cout << "\n=== Pipeline Status (Cycle " << cycleCount << ") ===\n";
    std::cout << "IF : " << std::hex << std::setw(8) << std::setfill('0') << if_id.instruction << std::dec << "\n";
    std::cout << "ID : " << id_ex.inst.toString() << "\n";
    std::cout << "EX : " << ex_mem.inst.toString() << "\n";
    std::cout << "MEM: " << mem_wb.inst.toString() << "\n";
}

void PipelineProcessor::printRegisters() const
{
    std::cout << "\n=== Integer Registers ===\n";
    for (int i = 0; i < 32; i += 4)
    {
        for (int j = 0; j < 4; ++j)
        {
            int reg = i + j;
            std::cout << "x" << std::setw(2) << reg << " (" << std::setw(6) << std::left << REGISTER_NAMES[reg] << std::right << "): "
                      << "0x" << std::hex << std::setw(8) << std::setfill('0') << registers[reg] << std::dec << std::setfill(' ') << "  ";
        }
        std::cout << "\n";
    }

    std::cout << "\n=== Floating Point Registers ===\n";
    for (int i = 0; i < 32; i += 4)
    {
        for (int j = 0; j < 4; ++j)
        {
            int reg = i + j;
            // 浮動小数点レジスタを16進数とfloatの両方で表示
            Float32 f32;
            f32.bits = fpRegisters[reg];
            std::cout << "f" << std::setw(2) << reg << ": "
                      << "0x" << std::hex << std::setw(8) << std::setfill('0') << fpRegisters[reg] << std::dec << std::setfill(' ')
                      << " (" << std::setw(12) << f32.f << ")  ";
        }
        std::cout << "\n";
    }
}

void PipelineProcessor::printStatistics() const
{
    std::cout << "\n=== Execution Statistics ===\n";
    std::cout << "Total Cycles: " << cycleCount << "\n";
    std::cout << "Instructions Executed: " << instructionCount << "\n";
    std::cout << "Stalls: " << stallCount << "\n";
    std::cout << "Flushes: " << flushCount << "\n";
    std::cout << "Cache Hits: " << memory.hits() << "\n";
    std::cout << "Cache Misses: " << memory.misses() << "\n";
    std::cout << "Cache Hit Rate: " << memory.hitRate() << "\n";

    if (instructionCount > 0)
    {
        std::cout << "CPI: " << (double)cycleCount / instructionCount << "\n";
    }
}

void PipelineProcessor::printStatus() const
{
    std::cout << "PC: 0x" << std::hex << std::setw(8) << std::setfill('0') << pc << std::dec
              << " | Cycle: " << cycleCount
              << " | Instructions: " << instructionCount << "\n";
}

const LogSnapshot &PipelineProcessor::getLogSnapshot() const
{
    return logSnapshot;
}

uint32_t PipelineProcessor::peekMemory(uint32_t address) const
{
    auto res = memory.readWord(address);
    return res.ok ? res.value : 0;
}
