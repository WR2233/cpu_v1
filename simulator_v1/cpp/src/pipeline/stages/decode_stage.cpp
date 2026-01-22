#include "pipeline/pipeline.h"

void PipelineProcessor::decode()
{
  if (pipelineFrozen)
  {
    return;
  }

  if (hazard.shouldFlush())
  {
    // フラッシュの場合、ID/EXステージをNOPにする
    id_ex.inst = Instruction();
    id_ex.inst.type = InstructionType::NOP;
    id_ex.inst.opcode = Opcode::NOP_CODE;
    id_ex.pc = 0;
    id_ex.rd = 0;
    id_ex.rs1 = 0;
    id_ex.rs2 = 0;
    id_ex.immediate = 0;
    id_ex.readData1 = 0;
    id_ex.readData2 = 0;
    id_ex.fpuLatency = 0;
    id_ex.fpuStarted = false;
    id_ex.stall = false;
    logSnapshot.currentInstruction = id_ex.inst;
    return;
  }
  else if (hazard.shouldStall())
  {
    // ストールの場合、NOPをID/EXに挿入
    id_ex.inst = Instruction();
    id_ex.inst.type = InstructionType::NOP;
    id_ex.inst.opcode = Opcode::NOP_CODE;
    id_ex.pc = 0;
    id_ex.rd = 0;
    id_ex.rs1 = 0;
    id_ex.rs2 = 0;
    id_ex.immediate = 0;
    id_ex.readData1 = 0;
    id_ex.readData2 = 0;
    id_ex.fpuLatency = 0;
    id_ex.fpuStarted = false;
    id_ex.stall = true;
    logSnapshot.currentInstruction = id_ex.inst;
    return;
  }

  // 命令デコード
  id_ex.inst.decode(if_id.instruction);
  id_ex.pc = if_id.pc;

  if (id_ex.inst.type == InstructionType::NOP)
  {
    id_ex.readData1 = 0;
    id_ex.readData2 = 0;
    id_ex.immediate = 0;
    id_ex.rs1 = 0;
    id_ex.rs2 = 0;
    id_ex.rd = 0;
    id_ex.fpuLatency = 0;
    logSnapshot.currentInstruction = id_ex.inst;
    return;
  }

  // レジスタ読み出し
  id_ex.rs1 = id_ex.inst.rs1;
  id_ex.rs2 = id_ex.inst.rs2;
  id_ex.rd = id_ex.inst.rd;
  id_ex.immediate = id_ex.inst.immediate;
  id_ex.fpuStarted = false;

  auto readOperand = [&](uint8_t idx, RegType file) -> uint32_t
  {
    switch (file)
    {
    case RegType::Fp:
      return getfpRegister(idx);
    case RegType::Int:
      return getRegister(idx);
    case RegType::None:
      return 0;
    default:
      return 0;
    }
  };

  id_ex.readData1 = readOperand(id_ex.inst.rs1, id_ex.inst.rs1Type);
  id_ex.readData2 = readOperand(id_ex.inst.rs2, id_ex.inst.rs2Type);

  // FPU命令の場合、レイテンシ設定
  id_ex.fpuLatency = fpuEmulator.requiresFpuPipeline(id_ex.inst.opcode) ? fpuEmulator.getFPULatency(opcodeToFPUOp(id_ex.inst.opcode)) : 0;

  logSnapshot.currentInstruction = id_ex.inst;
  logSnapshot.currentInstructionAddress = id_ex.pc;
  logSnapshot.regRead1Index = id_ex.rs1;
  logSnapshot.regRead2Index = id_ex.rs2;
  logSnapshot.regRead1Value = id_ex.readData1;
  logSnapshot.regRead2Value = id_ex.readData2;
  if (id_ex.inst.type != InstructionType::NOP)
  {
    instructionCount++;
  }
}
