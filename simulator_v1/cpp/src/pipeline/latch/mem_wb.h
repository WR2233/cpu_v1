#ifndef LATCH_MEM_WB_H
#define LATCH_MEM_WB_H

#include "../../core/instruction.h"
#include <cstdint>

// パイプラインレジスタ: MEM/WB
struct MEM_WB
{
  Instruction inst;
  uint32_t pc;
  uint32_t aluResult;
  uint32_t memData;
  uint32_t operandA;
  uint32_t operandB;
  uint8_t writeReg;
  bool stall;
  uint8_t fpuLatency; // 残りのFPUレイテンシ（サイクル数）

  MEM_WB() : pc(0), aluResult(0), memData(0), writeReg(0), stall(false), fpuLatency(0) {}
};
#endif // LATCH_MEM_WB_H