#include "pipeline/pipeline.h"
#include <iostream>

bool PipelineProcessor::memoryAccess()
{
  // 分岐処理はEXステージで既に処理済み

  // FPUパイプライン結果待ち
  if (ex_mem.inst.type == InstructionType::F_TYPE &&
      fpuEmulator.requiresFpuPipeline(ex_mem.inst.opcode) &&
      !fpuEmulator.isFpuResultReady(ex_mem.inst.opcode))
  {
    stallCount++;
    return false; // Pipeline frozen to keep FPU instruction in MEM
  }

  mem_wb.inst = ex_mem.inst;
  mem_wb.pc = ex_mem.pc;
  mem_wb.aluResult = ex_mem.aluResult;
  mem_wb.writeReg = ex_mem.writeReg;
  mem_wb.memData = 0;
  mem_wb.fpuLatency = (ex_mem.fpuLatency > 0) ? (ex_mem.fpuLatency - 1) : 0;
  mem_wb.operandA = ex_mem.operandA;
  mem_wb.operandB = ex_mem.operandB;

  if (ex_mem.inst.type == InstructionType::F_TYPE &&
      fpuEmulator.requiresFpuPipeline(ex_mem.inst.opcode))
  {
    // FPU結果を取得（
    mem_wb.aluResult = fpuEmulator.fetchFpuResult(ex_mem.inst.opcode);
    logSnapshot.fpuResult = mem_wb.aluResult;
  }

  if (ex_mem.inst.type == InstructionType::NOP)
  {
    return true;
  }

  // メモリアクセス
  switch (ex_mem.inst.opcode)
  {
  case Opcode::LW:
  {
    auto res = memory.readWord(ex_mem.aluResult);
    if (res.ok)
    {
      mem_wb.memData = res.value;
      logSnapshot.dataBus.valid = true;
      logSnapshot.dataBus.address = ex_mem.aluResult;
      logSnapshot.dataBus.readData = mem_wb.memData;
      if (res.cacheMiss)
      {
        cacheMissPenaltyRemaining = CACHE_MISS_PENALTY;
      }
    }
    break;
  }
  case Opcode::LB:
  {
    auto res = memory.readByte(ex_mem.aluResult);
    if (res.ok)
    {
      mem_wb.memData = res.value;
      logSnapshot.dataBus.valid = true;
      logSnapshot.dataBus.address = ex_mem.aluResult;
      logSnapshot.dataBus.readData = mem_wb.memData;
      if (res.cacheMiss)
      {
        cacheMissPenaltyRemaining = CACHE_MISS_PENALTY;
      }
    }
    break;
  }
  case Opcode::SW:
  {
    auto res = memory.writeWord(ex_mem.aluResult, ex_mem.writeData);
    if (!res.ok)
    {
      std::cerr << "Error: Memory write out of range at PC=0x" << std::hex << ex_mem.pc
                << " address=0x" << ex_mem.aluResult
                << " value=0x" << ex_mem.writeData << std::dec << std::endl;
      std::cerr << "  Instruction: SW" << std::endl;
      pipelineFrozen = true;
      executed_ebreak = true;
      std::exit(1);
    }
    if (res.ok)
    {
      logSnapshot.dataBus.valid = true;
      logSnapshot.dataBus.write = true;
      logSnapshot.dataBus.address = ex_mem.aluResult;
      logSnapshot.dataBus.writeData = ex_mem.writeData;
      if (res.cacheMiss)
      {
        cacheMissPenaltyRemaining = CACHE_MISS_PENALTY;
      }
    }
    if (res.mmio)
    {
      logSnapshot.mmioWrite = true;
      logSnapshot.mmioValue = res.mmioValue;
    }
    mem_wb.writeReg = 0; // SWはレジスタに書き込まない
    break;
  }
  case Opcode::SB:
  {
    auto res = memory.writeByte(ex_mem.aluResult, static_cast<uint8_t>(ex_mem.writeData & 0xFF));
    if (!res.ok)
    {
      std::cerr << "Error: Memory write out of range at PC=0x" << std::hex << ex_mem.pc
                << " address=0x" << ex_mem.aluResult
                << " value=0x" << (ex_mem.writeData & 0xFF) << std::dec << std::endl;
      std::cerr << "  Instruction: SB" << std::endl;
      pipelineFrozen = true;
      executed_ebreak = true;
      std::exit(1);
    }
    if (res.ok)
    {
      logSnapshot.dataBus.valid = true;
      logSnapshot.dataBus.write = true;
      logSnapshot.dataBus.address = ex_mem.aluResult;
      logSnapshot.dataBus.writeData = ex_mem.writeData & 0xFF;
      if (res.cacheMiss)
      {
        cacheMissPenaltyRemaining = CACHE_MISS_PENALTY;
      }
    }
    if (res.mmio)
    {
      logSnapshot.mmioWrite = true;
      logSnapshot.mmioValue = res.mmioValue;
      logSnapshot.dataBus.valid = true;
      logSnapshot.dataBus.write = true;
      logSnapshot.dataBus.address = ex_mem.aluResult;
      logSnapshot.dataBus.writeData = res.mmioValue;
    }
    mem_wb.writeReg = 0;
    break;
  }
  case Opcode::FLW:
  {
    auto res = memory.readWord(ex_mem.aluResult);
    if (res.ok)
    {
      mem_wb.memData = res.value;
      logSnapshot.dataBus.valid = true;
      logSnapshot.dataBus.address = ex_mem.aluResult;
      logSnapshot.dataBus.readData = mem_wb.memData;
      if (res.cacheMiss)
      {
        cacheMissPenaltyRemaining = CACHE_MISS_PENALTY;
      }
    }
    break;
  }
  case Opcode::FSW:
  {
    auto res = memory.writeWord(ex_mem.aluResult, ex_mem.writeData);
    if (res.ok)
    {
      logSnapshot.dataBus.valid = true;
      logSnapshot.dataBus.write = true;
      logSnapshot.dataBus.address = ex_mem.aluResult;
      logSnapshot.dataBus.writeData = ex_mem.writeData;
      if (res.cacheMiss)
      {
        cacheMissPenaltyRemaining = CACHE_MISS_PENALTY;
      }
    }
    if (res.mmio)
    {
      logSnapshot.mmioWrite = true;
      logSnapshot.mmioValue = res.mmioValue;
    }
    mem_wb.writeReg = 0; // FSWはレジスタに書き込まない
    break;
  }
  default:
    break;
  }
  return true;
}
