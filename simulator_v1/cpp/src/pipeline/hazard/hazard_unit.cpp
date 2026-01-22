#include "hazard_unit.h"
#include "../../core/instruction.h"
#include "../latch/if_id.h"
#include "../latch/id_ex.h"
#include "../latch/ex_mem.h"
#include "../../fpu/fpu_emulator.h"

void HazardDetectionUnit::compute(const IF_ID &if_id,
                                  const ID_EX &id_ex,
                                  const EX_MEM &ex_mem,
                                  const FPUEmulator &fpuEmulator)
{
  reset();

  Instruction current;
  current.decode(if_id.instruction);

  // Load-Use ハザード検出
  bool idexIsLoad = (id_ex.inst.opcode == Opcode::LW || id_ex.inst.opcode == Opcode::LB || id_ex.inst.opcode == Opcode::FLW);
  if (idexIsLoad && id_ex.inst.rdType != RegType::None)
  {
    auto dependRs = [&](RegType rsType, uint32_t rs) -> bool
    {
      if (rsType == RegType::None)
      {
        return false;
      }
      else if (rsType == RegType::Int && rs == 0)
      {
        return false;
      }
      else if (rsType == id_ex.inst.rdType && rs == id_ex.inst.rd)
      {
        return true;
      }
      return false;
    };
    if (dependRs(current.rs1Type, current.rs1) || dependRs(current.rs2Type, current.rs2))
    {
      stall_ = true;
    }
  }

  // ---- FPU -> Int RAW hazard ----
  auto dependsOnIntRd = [&](RegType rsType, uint32_t rs, uint32_t rd) -> bool
  {
    if (rsType != RegType::Int)
      return false;
    if (rs == 0)
      return false; // x0は無視
    return rs == rd;
  };

  // ID/EX にある「Intに書くFPU命令」の結果はまだ使えない
  if (fpuEmulator.requiresFpuPipeline(id_ex.inst.opcode) &&
      id_ex.inst.rdType == RegType::Int &&
      id_ex.rd != 0)
  {
    bool dep_rs1 = dependsOnIntRd(current.rs1Type, current.rs1, id_ex.rd);
    bool dep_rs2 = dependsOnIntRd(current.rs2Type, current.rs2, id_ex.rd);
    if (dep_rs1 || dep_rs2)
      stall_ = true;
  }

  // EX/MEM にある「Intに書くFPU命令」もまだWBに来ていないので使えない
  if (fpuEmulator.requiresFpuPipeline(ex_mem.inst.opcode) &&
      ex_mem.inst.rdType == RegType::Int &&
      ex_mem.writeReg != 0)
  {
    bool dep_rs1 = dependsOnIntRd(current.rs1Type, current.rs1, ex_mem.writeReg);
    bool dep_rs2 = dependsOnIntRd(current.rs2Type, current.rs2, ex_mem.writeReg);
    if (dep_rs1 || dep_rs2)
      stall_ = true;
  }

  // FPU RAWハザード検出
  // ID/EX または EX/MEM ステージにFPU命令があり、結果がまだWBステージに到達していない場合ストール
  auto dependsOnFpuReg = [&](RegType rsType, uint32_t rs, RegType rdType, uint32_t rd) -> bool
  {
    if (rdType == RegType::Int && rd == 0)
      return false;
    if (rsType == RegType::None || rdType == RegType::None)
    {
      return false;
    }
    return (rsType == rdType && rs == rd);
  };

  // ID/EX ステージのFPU命令をチェック
  // FPU命令の結果はMEMステージで取得されるため、ID/EXにある間はフォワーディング不可
  if (id_ex.inst.rdType == RegType::Fp && id_ex.rd != 0)
  {
    if (fpuEmulator.requiresFpuPipeline(id_ex.inst.opcode))
    {
      bool dep_rs1 = dependsOnFpuReg(current.rs1Type, current.rs1, id_ex.inst.rdType, id_ex.rd);
      bool dep_rs2 = dependsOnFpuReg(current.rs2Type, current.rs2, id_ex.inst.rdType, id_ex.rd);
      if (dep_rs1 || dep_rs2)
      {
        stall_ = true;
      }
    }
  }

  // EX/MEM ステージのFPU命令をチェック
  // FPU命令の結果はMEMステージで取得されるが、まだWBに到達していないためフォワーディング不可
  if (ex_mem.inst.rdType == RegType::Fp && ex_mem.writeReg != 0)
  {
    if (fpuEmulator.requiresFpuPipeline(ex_mem.inst.opcode))
    {
      bool dep_rs1 = dependsOnFpuReg(current.rs1Type, current.rs1, ex_mem.inst.rdType, ex_mem.writeReg);
      bool dep_rs2 = dependsOnFpuReg(current.rs2Type, current.rs2, ex_mem.inst.rdType, ex_mem.writeReg);
      if (dep_rs1 || dep_rs2)
      {
        stall_ = true;
      }
    }
  }

  // FPUユニット構造ハザード検出:
  // FPUがビジーの間に新しいFPU命令が来たらIDで止める
  if (current.type == InstructionType::F_TYPE && fpuEmulator.requiresFpuPipeline(current.opcode))
  {
    if (!fpuEmulator.canExecute())
    {
      stall_ = true;
    }
  }
}

bool HazardDetectionUnit::shouldStall() const
{
  return stall_;
}

void HazardDetectionUnit::setFlush(bool flush)
{
  flush_ = flush;
}

bool HazardDetectionUnit::shouldFlush() const
{
  return flush_;
}

void HazardDetectionUnit::setStall(bool stall)
{
  stall_ = stall;
}