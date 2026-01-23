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
      {Forward::ForwardFromType::NONE, 0},
      {Forward::ForwardFromType::NONE, 0},
      {Forward::ForwardFromType::NONE, 0}};

  // ID_EXへのフォワーディング
  bool wantsA = (id_ex.inst.rs1Type != RegType::None);
  bool wantsB = (id_ex.inst.rs2Type != RegType::None);

  // EX_MEMからID_EXへフォワード
  if (canUseExMem(ex_mem, fpuEmulator, id_ex.inst.rs1Type) && ex_mem.writeReg == id_ex.rs1 && wantsA)
  {
    forwarding.forwardAtoID_EX = {Forward::ForwardFromType::FROM_EX_MEM, ex_mem.aluResult};
  }
  if (canUseExMem(ex_mem, fpuEmulator, id_ex.inst.rs2Type) && ex_mem.writeReg == id_ex.rs2 && wantsB)
  {
    forwarding.forwardBtoID_EX = {Forward::ForwardFromType::FROM_EX_MEM, ex_mem.aluResult};
  }

  // MEM_WBからID_EXへフォワード
  if (forwarding.forwardAtoID_EX.forwardFrom == Forward::ForwardFromType::NONE &&
      canUseWb(wb, id_ex.inst.rs1Type) && wb.writeReg == id_ex.rs1 && wantsA)
  {
    forwarding.forwardAtoID_EX = {Forward::ForwardFromType::FROM_MEM_WB, 0};
    if (wb.inst.opcode == Opcode::LW || wb.inst.opcode == Opcode::LB || wb.inst.opcode == Opcode::FLW)
    {
      forwarding.forwardAtoID_EX.forwardValue = wb.memData;
    }
    else
    {
      forwarding.forwardAtoID_EX.forwardValue = wb.aluResult;
    }
  }
  if (forwarding.forwardBtoID_EX.forwardFrom == Forward::ForwardFromType::NONE &&
      canUseWb(wb, id_ex.inst.rs2Type) && wb.writeReg == id_ex.rs2 && wantsB)
  {
    forwarding.forwardBtoID_EX = {Forward::ForwardFromType::FROM_MEM_WB, 0};
    if (wb.inst.opcode == Opcode::LW || wb.inst.opcode == Opcode::LB || wb.inst.opcode == Opcode::FLW)
    {
      forwarding.forwardBtoID_EX.forwardValue = wb.memData;
    }
    else
    {
      forwarding.forwardBtoID_EX.forwardValue = wb.aluResult;
    }
  }

  // MEM_WBからEX_MEMへフォワード (SW/SB/FSW命令のrs2用)
  wantsB = (ex_mem.inst.rs2Type != RegType::None);
  if (forwarding.forwardtoEX_MEM.forwardFrom == Forward::ForwardFromType::NONE &&
      canUseWb(wb, ex_mem.inst.rs2Type) && wb.writeReg == ex_mem.rs2 && wantsB)
  {
    forwarding.forwardtoEX_MEM = {Forward::ForwardFromType::FROM_MEM_WB, 0};
    if (wb.inst.opcode == Opcode::LW || wb.inst.opcode == Opcode::LB || wb.inst.opcode == Opcode::FLW)
    {
      forwarding.forwardtoEX_MEM.forwardValue = wb.memData;
    }
    else
    {
      forwarding.forwardtoEX_MEM.forwardValue = wb.aluResult;
    }
  }
  // 結果を保存
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