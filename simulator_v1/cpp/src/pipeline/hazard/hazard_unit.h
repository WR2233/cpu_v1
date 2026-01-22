#ifndef HAZARD_UNIT_H
#define HAZARD_UNIT_H

#include <cstdint>
#include "../../core/instruction.h"
#include "../latch/if_id.h"
#include "../latch/id_ex.h"
#include "../latch/ex_mem.h"
#include "../../fpu/fpu_emulator.h"

// ハザード検出ユニット
class HazardDetectionUnit
{
public:
  void reset()
  {
    stall_ = false;
    flush_ = false;
  }
  void compute(const IF_ID &if_id,
               const ID_EX &id_ex,
               const EX_MEM &ex_mem,
               const FPUEmulator &fpuEmulator);

  bool shouldStall() const;
  bool shouldFlush() const;
  void setFlush(bool val);
  void setStall(bool val);

private:
  bool stall_ = false;
  bool flush_ = false;
};

#endif // HAZARD_UNIT_H