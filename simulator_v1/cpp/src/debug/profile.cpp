#include "profile.h"
#include "../core/instruction.h"
#include <iostream>
#include <iomanip>
#include <sstream>
#include <string>

ExecutionProfile::ExecutionProfile(PipelineProcessor &cpu)
    : cpu(cpu)
{
}

void ExecutionProfile::onCycleEnd()
{
  const auto &snap = cpu.getLogSnapshot();
  Instruction inst = snap.wb_snapshot.inst;
  if (inst.type != InstructionType::NOP)
  {
    recordInstruction(inst.opcode);
  }
}
void ExecutionProfile::printInstructionProfile()
{
  std::cout << "\n=== Instruction Profile ===\n";
  std::cout << std::left << std::setw(20) << "Opcode"
            << std::right << std::setw(15) << "Count"
            << "\n";
  std::cout << std::string(50, '-') << "\n";
  uint64_t totalInstructions = 0;
  for (const auto &entry : instructionCounts)
  {
    totalInstructions += entry.second;
  }

  for (const auto &entry : instructionCounts)
  {
    std::string opcodeStr = opcodeToString(entry.first);
    uint64_t count = entry.second;

    std::cout << std::left << std::setw(20) << opcodeStr
              << std::right << std::setw(15) << count
              << "\n";
  }
  std::cout << std::string(50, '-') << "\n";
  std::cout << std::left << std::setw(20) << "Total"
            << std::right << std::setw(15) << totalInstructions
            << "\n";
}

const std::unordered_map<Opcode, uint64_t> &ExecutionProfile::getInstructionProfile()
{
  return instructionCounts;
}

void ExecutionProfile::recordInstruction(Opcode opcode)
{
  instructionCounts[opcode]++;
}
