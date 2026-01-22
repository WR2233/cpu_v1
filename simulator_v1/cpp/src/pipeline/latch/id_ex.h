#ifndef LATCH_ID_EX_H
#define LATCH_ID_EX_H

#include "../../core/instruction.h"
#include <cstdint>

// パイプラインレジスタ: ID/EX
struct ID_EX
{
  Instruction inst;
  uint32_t pc;
  uint32_t readData1;
  uint32_t readData2;
  uint32_t immediate;
  uint8_t rs1;
  uint8_t rs2;
  uint8_t rd;
  bool stall;
  uint8_t fpuLatency; // FPU命令のレイテンシ（サイクル数）
  bool fpuStarted;    // FPU演算が既に開始されたか

  ID_EX() : pc(0), readData1(0), readData2(0), immediate(0),
            rs1(0), rs2(0), rd(0), stall(false), fpuLatency(0), fpuStarted(false) {}
};

#endif // LATCH_ID_EX_H