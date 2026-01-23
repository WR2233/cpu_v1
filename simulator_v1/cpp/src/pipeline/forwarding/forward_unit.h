#ifndef FORWARD_UNIT_H
#define FORWARD_UNIT_H

#include <cstdint>
#include "../../core/instruction.h"
#include "../latch/id_ex.h"
#include "../latch/ex_mem.h"
#include "../latch/mem_wb.h"

class FPUEmulator;

struct Forward
{
  enum class ForwardFromType
  {
    NONE,
    FROM_EX_MEM,
    FROM_MEM_WB
  };
  ForwardFromType forwardFrom;
  uint32_t forwardValue; // 実際にフォワードする値
};

// フォワーディング制御
class ForwardingUnit
{
public:
  struct Result
  {
    Forward forwardAtoID_EX;
    Forward forwardBtoID_EX;
    Forward forwardtoEX_MEM;
  };

  void compute(
      const ID_EX &id_ex,
      const EX_MEM &ex_mem,
      const MEM_WB &wb,
      const FPUEmulator &fpuEmulator);
  Result getResult() const
  {
    return forwardingResult;
  }

private:
  bool canUseExMem(const EX_MEM &ex_mem, const FPUEmulator &fpuEmulator, RegType targetType) const;
  bool canUseWb(const MEM_WB &wb, RegType targetType) const;
  Result forwardingResult;
};
#endif // FORWARD_UNIT_H