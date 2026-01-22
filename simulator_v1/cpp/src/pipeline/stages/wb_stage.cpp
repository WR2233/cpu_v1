#include "pipeline/pipeline.h"

void PipelineProcessor::writeBack()
{
  // WBステージの値を保存
  wb = mem_wb;

  // EBREAKがWBステージに到達したら停止
  if (mem_wb.inst.type == InstructionType::EBREAK)
  {
    executed_ebreak = true;
    logSnapshot.registers = registers;
    return;
  }
  if (mem_wb.inst.type == InstructionType::NOP)
  {
    logSnapshot.registers = registers;
    return;
  }

  switch (mem_wb.inst.rdType)
  {
    uint32_t writeData;
  case RegType::None:
  {
    logSnapshot.registers = registers;
    return;
  }
  case RegType::Int:
  { // 整数レジスタに書き込み (x0はスキップ)
    if (mem_wb.writeReg == 0)
    {
      logSnapshot.registers = registers;
      return;
    }

    writeData = (mem_wb.inst.opcode == Opcode::LW || mem_wb.inst.opcode == Opcode::LB) ? mem_wb.memData : mem_wb.aluResult;
    setRegister(mem_wb.writeReg, writeData);
    break;
  }
  case RegType::Fp:
  { // 浮動小数点レジスタに書き込み
    writeData = (mem_wb.inst.opcode == Opcode::FLW) ? mem_wb.memData : mem_wb.aluResult;
    setfpRegister(mem_wb.writeReg, writeData);
    break;
  }
  }

  logSnapshot.registers = registers;
}