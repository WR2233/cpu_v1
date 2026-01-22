#ifndef LATCH_IF_ID_H
#define LATCH_IF_ID_H

#include <cstdint>

// パイプラインレジスタ: IF/ID
struct IF_ID
{
  uint32_t instruction;
  uint32_t pc;
  bool stall;

  IF_ID() : instruction(0), pc(0), stall(false) {}
};
#endif // LATCH_IF_ID_H