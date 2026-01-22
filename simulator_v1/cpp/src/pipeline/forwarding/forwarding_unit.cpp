#include "forward_unit.h"
#include <iostream>
#include "../../fpu/fpu_emulator.h"

void ForwardingUnit::compute(
    const ID_EX &id_ex,
    const EX_MEM &ex_mem,
    const MEM_WB &wb,
    const FPUEmulator &fpuEmulator)
{
  Result forwarding{
      ForwardType::NONE,
      ForwardType::NONE,
      0,
      0};

  bool wantsA = (id_ex.inst.rs1Type != RegType::None);
  bool wantsB = (id_ex.inst.rs2Type != RegType::None);

  if (canUseExMem(ex_mem, fpuEmulator, id_ex.inst.rs1Type) && ex_mem.writeReg == id_ex.rs1 && wantsA)
  {
    forwarding.forwardA = ForwardingUnit::ForwardType::FROM_EX_MEM;
    forwarding.forwardValueA = ex_mem.aluResult;
  }
  if (canUseExMem(ex_mem, fpuEmulator, id_ex.inst.rs2Type) && ex_mem.writeReg == id_ex.rs2 && wantsB)
  {
    forwarding.forwardB = ForwardingUnit::ForwardType::FROM_EX_MEM;
    forwarding.forwardValueB = ex_mem.aluResult;
  }

  if (forwarding.forwardA == ForwardingUnit::ForwardType::NONE &&
      canUseWb(wb, id_ex.inst.rs1Type) && wb.writeReg == id_ex.rs1 && wantsA)
  {
    forwarding.forwardA = ForwardingUnit::ForwardType::FROM_MEM_WB;
    if (wb.inst.opcode == Opcode::LW || wb.inst.opcode == Opcode::LB || wb.inst.opcode == Opcode::FLW)
    {
      forwarding.forwardValueA = wb.memData;
    }
    else
    {
      forwarding.forwardValueA = wb.aluResult;
    }
  }
  if (forwarding.forwardB == ForwardingUnit::ForwardType::NONE &&
      canUseWb(wb, id_ex.inst.rs2Type) && wb.writeReg == id_ex.rs2 && wantsB)
  {
    forwarding.forwardB = ForwardingUnit::ForwardType::FROM_MEM_WB;
    if (wb.inst.opcode == Opcode::LW || wb.inst.opcode == Opcode::LB || wb.inst.opcode == Opcode::FLW)
    {
      forwarding.forwardValueB = wb.memData;
    }
    else
    {
      forwarding.forwardValueB = wb.aluResult;
    }
  }
  forwardingResult = forwarding;
}

bool ForwardingUnit::canUseExMem(const EX_MEM &ex_mem, const FPUEmulator &fpuEmulator, RegType tagetType) const
{
  if (ex_mem.inst.rdType != tagetType || ex_mem.inst.rdType == RegType::None)
  {
    return false;
  }
  if (tagetType == RegType::Int && ex_mem.writeReg == 0)
  {
    return false; // x0はフォワード不要
  }
  // LoadはEXからフォワード不可
  bool exMemisLoad = (ex_mem.inst.opcode == Opcode::LW) || (ex_mem.inst.opcode == Opcode::LB) || (ex_mem.inst.opcode == Opcode::FLW);
  // FPU演算もEXからフォワード不可（結果がMEMステージで取得されるため）
  bool exMemIsFpuOp = fpuEmulator.requiresFpuPipeline(ex_mem.inst.opcode);
  return !exMemisLoad && !exMemIsFpuOp;
};

bool ForwardingUnit::canUseWb(const MEM_WB &wb, RegType targetType) const
{

  if (wb.inst.rdType != targetType || wb.inst.rdType == RegType::None)
  {
    return false;
  }
  if (targetType == RegType::Int && wb.writeReg == 0)
  {
    return false;
  }
  return true;
};