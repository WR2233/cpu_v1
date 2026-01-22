#ifndef PIPELINE_HISTORY_H
#define PIPELINE_HISTORY_H

#include "../pipeline/pipeline.h"
#include "../core/instruction.h"
#include <set>
#include <string>
#include <vector>
#include <unordered_map>

class ExecutionProfile
{
public:
  explicit ExecutionProfile(PipelineProcessor &cpu);
  void onCycleEnd();
  const std::unordered_map<Opcode, uint64_t> &getInstructionProfile();

  void printInstructionProfile();

private:
  PipelineProcessor &cpu;
  std::unordered_map<Opcode, uint64_t> instructionCounts;
  void recordInstruction(Opcode opcode);
};

#endif // PIPELINE_HISTORY_H
