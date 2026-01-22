#include "pipeline/pipeline.h"
#include "pipeline/forwarding/forward_unit.h"
#include <cstdint>
#include <iostream>

void PipelineProcessor::execute()
{
  if (pipelineFrozen)
  {
    // Frozenだったら何もせずreturn
    return;
  }

  ex_mem.inst = id_ex.inst;
  ex_mem.pc = id_ex.pc;
  ex_mem.branch = false;
  ex_mem.fpuLatency = (id_ex.fpuLatency > 0) ? (id_ex.fpuLatency - 1) : 0;
  ex_mem.writeData = 0;

  if (id_ex.inst.type == InstructionType::NOP)
  {
    ex_mem.aluResult = 0;
    ex_mem.writeReg = 0;
    ex_mem.fpuLatency = 0;
    return;
  }
  if (id_ex.inst.type == InstructionType::EBREAK)
  {
    ex_mem.aluResult = 0;
    ex_mem.writeReg = 0;
    return;
  }

  // フォワーディング適用（detectForwarding()で計算済み）
  ex_mem.operandA = id_ex.readData1;
  ex_mem.operandB = id_ex.readData2;
  ForwardingUnit::Result forwardingResult = forwarding.getResult();
  logSnapshot.forwarding_snapshot = forwardingResult; // ログに保存
  if (forwardingResult.forwardA != ForwardingUnit::ForwardType::NONE)
  {
    ex_mem.operandA = forwardingResult.forwardValueA;
  }

  if (forwardingResult.forwardB != ForwardingUnit::ForwardType::NONE)
  {
    ex_mem.operandB = forwardingResult.forwardValueB;
  }

  // ALU演算
  switch (id_ex.inst.type)
  {
  case InstructionType::R_TYPE:
    ex_mem.writeReg = id_ex.rd;
    switch (id_ex.inst.opcode)
    {
    case Opcode::ADD:
      ex_mem.aluResult = ex_mem.operandA + ex_mem.operandB;
      break;
    case Opcode::SUB:
      ex_mem.aluResult = ex_mem.operandA - ex_mem.operandB;
      break;
    case Opcode::XOR:
      ex_mem.aluResult = ex_mem.operandA ^ ex_mem.operandB;
      break;
    case Opcode::OR:
      ex_mem.aluResult = ex_mem.operandA | ex_mem.operandB;
      break;
    case Opcode::AND:
      ex_mem.aluResult = ex_mem.operandA & ex_mem.operandB;
      break;
    case Opcode::SLL:
      ex_mem.aluResult = ex_mem.operandA << (ex_mem.operandB & 0x1F);
      break;
    case Opcode::SRL:
      // 論理右シフト（符号なし）
      ex_mem.aluResult = ex_mem.operandA >> (ex_mem.operandB & 0x1F);
      break;
    case Opcode::SRA:
      // 算術右シフト（符号付き）
      ex_mem.aluResult = static_cast<uint32_t>(static_cast<int32_t>(ex_mem.operandA) >> (ex_mem.operandB & 0x1F));
      break;
    case Opcode::SLT:
      // 符号付き比較
      ex_mem.aluResult = (static_cast<int32_t>(ex_mem.operandA) < static_cast<int32_t>(ex_mem.operandB)) ? 1 : 0;
      break;
    case Opcode::SLTU:
      // 符号なし比較
      ex_mem.aluResult = (ex_mem.operandA < ex_mem.operandB) ? 1 : 0;
      break;
    case Opcode::DIV:
      // 符号付き除算
      if (ex_mem.operandB != 0)
      {
        ex_mem.aluResult = static_cast<uint32_t>(static_cast<int32_t>(ex_mem.operandA) / static_cast<int32_t>(ex_mem.operandB));
      }
      else
      {
        ex_mem.aluResult = 0xFFFFFFFF; // Division by zero → -1
      }

      break;
    default:
      ex_mem.aluResult = 0;
    }
    break;

  case InstructionType::I_TYPE:
    ex_mem.writeReg = id_ex.rd;
    switch (id_ex.inst.opcode)
    {
    case Opcode::ADDI:
      ex_mem.aluResult = ex_mem.operandA + id_ex.immediate;
      break;
    case Opcode::SLTI:
      // 符号付き比較
      ex_mem.aluResult = (static_cast<int32_t>(ex_mem.operandA) < static_cast<int32_t>(id_ex.immediate)) ? 1 : 0;
      break;
    case Opcode::SLTIU:
      // 符号なし比較
      ex_mem.aluResult = (ex_mem.operandA < id_ex.immediate) ? 1 : 0;
      break;
    case Opcode::XORI:
      ex_mem.aluResult = ex_mem.operandA ^ id_ex.immediate;
      break;
    case Opcode::ORI:
      ex_mem.aluResult = ex_mem.operandA | id_ex.immediate;
      break;
    case Opcode::ANDI:
      ex_mem.aluResult = ex_mem.operandA & id_ex.immediate;
      break;
    case Opcode::SLLI:
      ex_mem.aluResult = ex_mem.operandA << (id_ex.immediate & 0x1F);
      break;
    case Opcode::SRLI:
      // 論理右シフト（符号なし）
      ex_mem.aluResult = ex_mem.operandA >> (id_ex.immediate & 0x1F);
      break;
    case Opcode::SRAI:
      // 算術右シフト（符号付き）
      ex_mem.aluResult = static_cast<uint32_t>(static_cast<int32_t>(ex_mem.operandA) >> (id_ex.immediate & 0x1F));
      break;
    case Opcode::LW:
    case Opcode::LB:
    case Opcode::FLW:
      // アドレス計算（符号拡張されたオフセットを加算）
      ex_mem.aluResult = ex_mem.operandA + id_ex.immediate;
      break;
    case Opcode::JALR:
      ex_mem.branch = true;
      ex_mem.branchTarget = (ex_mem.operandA + (id_ex.immediate)) & (~1); // 最下位ビットを0にする
      ex_mem.aluResult = id_ex.pc + 4;                                    // 戻りアドレス
      break;
    default:
      ex_mem.aluResult = 0;
    }
    break;

  case InstructionType::S_TYPE:
    ex_mem.writeReg = 0; // ストア命令は書き込まない
    // アドレス計算（符号拡張されたオフセットを加算）
    ex_mem.aluResult = ex_mem.operandA + id_ex.immediate;
    ex_mem.writeData = ex_mem.operandB; // ストアするデータ
    break;

  case InstructionType::B_TYPE:
    ex_mem.writeReg = 0; // 分岐命令は書き込まない
    switch (id_ex.inst.opcode)
    {
    case Opcode::BEQ:
      if (ex_mem.operandA == ex_mem.operandB)
      {
        ex_mem.branch = true;
        ex_mem.branchTarget = id_ex.pc + id_ex.immediate;
      }
      break;
    case Opcode::BNE:
      if (ex_mem.operandA != ex_mem.operandB)
      {
        ex_mem.branch = true;
        ex_mem.branchTarget = id_ex.pc + id_ex.immediate;
      }
      break;
    case Opcode::BLT:
      // 符号付き比較
      if (static_cast<int32_t>(ex_mem.operandA) < static_cast<int32_t>(ex_mem.operandB))
      {
        ex_mem.branch = true;
        ex_mem.branchTarget = id_ex.pc + id_ex.immediate;
      }
      break;
    case Opcode::BGE:
      // 符号付き比較
      if (static_cast<int32_t>(ex_mem.operandA) >= static_cast<int32_t>(ex_mem.operandB))
      {
        ex_mem.branch = true;
        ex_mem.branchTarget = id_ex.pc + id_ex.immediate;
      }
      break;
    case Opcode::BLTU:
      // 符号なし比較
      if (ex_mem.operandA < ex_mem.operandB)
      {
        ex_mem.branch = true;
        ex_mem.branchTarget = id_ex.pc + id_ex.immediate;
      }
      break;
    case Opcode::BGEU:
      // 符号なし比較
      if (ex_mem.operandA >= ex_mem.operandB)
      {
        ex_mem.branch = true;
        ex_mem.branchTarget = id_ex.pc + id_ex.immediate;
      }
      break;
    default:
      break;
    }
    break;

  case InstructionType::U_TYPE:
    ex_mem.writeReg = id_ex.rd;
    if (id_ex.inst.opcode == Opcode::LUI)
    {
      // 上位20ビットに即値をセット
      ex_mem.aluResult = id_ex.immediate;
    }
    else if (id_ex.inst.opcode == Opcode::AUIPC)
    {
      // PCに上位即値を加算
      ex_mem.aluResult = id_ex.pc + id_ex.immediate;
    }
    break;

  case InstructionType::J_TYPE:
    ex_mem.branch = true;
    // RISC-V JAL: PC相対アドレッシング
    ex_mem.branchTarget = id_ex.pc + id_ex.inst.immediate;
    ex_mem.writeReg = id_ex.rd;      // JALはリンクアドレスを書き込む
    ex_mem.aluResult = id_ex.pc + 4; // 戻りアドレス = PC + 4
    break;

  case InstructionType::F_TYPE:
    ex_mem.writeReg = id_ex.rd;
    {
      uint32_t fpOp1 = ex_mem.operandA;
      uint32_t fpOp2 = ex_mem.operandB;
      ex_mem.aluResult = 0;

      // FPU演算は1回だけ開始する（ストール中に繰り返し呼ばないため）
      if (!id_ex.fpuStarted && fpuEmulator.requiresFpuPipeline(id_ex.inst.opcode))
      {
        // 2オペランド演算
        switch (id_ex.inst.opcode)
        {
        case Opcode::FADD:
        case Opcode::FSUB:
        case Opcode::FMUL:
        case Opcode::FDIV:
        case Opcode::FEQ:
        case Opcode::FLT:
        case Opcode::FLE:
          fpuEmulator.execute(fpOp1, fpOp2, opcodeToFPUOp(id_ex.inst.opcode));
          break;
        // 1オペランド演算
        case Opcode::FSQRT:
        case Opcode::FISQRT:
        case Opcode::FINV:
        case Opcode::FLOOR:
        case Opcode::FTOI:
        case Opcode::ITOF:
          fpuEmulator.execute(fpOp1, opcodeToFPUOp(id_ex.inst.opcode));
          break;
        default:
          break;
        }
        id_ex.fpuStarted = true;
      }
      else if (id_ex.fpuStarted && fpuEmulator.requiresFpuPipeline(id_ex.inst.opcode))
      {
        id_ex.fpuLatency--;
      }
      if (id_ex.inst.opcode == Opcode::FSGNJ)
      {
        ex_mem.aluResult = (ex_mem.operandA & 0x7FFFFFFF) | (ex_mem.operandB & 0x80000000);
      }
      if (id_ex.inst.opcode == Opcode::FSGNJN)
      {
        ex_mem.aluResult = (ex_mem.operandA & 0x7FFFFFFF) | (~ex_mem.operandB & 0x80000000);
      }
      if (id_ex.inst.opcode == Opcode::FSGNJX)
      {
        ex_mem.aluResult = (ex_mem.operandA & 0x7FFFFFFF) | ((ex_mem.operandA ^ ex_mem.operandB) & 0x80000000);
      }
      if (id_ex.inst.opcode == Opcode::FMV)
      {
        ex_mem.aluResult = fpOp1;
        logSnapshot.fpuResult = ex_mem.aluResult;
      }
    }
    break;

  default:
    std::cerr << "FPU execute\n"
              << "対応していないFPU演算です\n ";
    std::abort();
  }

  logSnapshot.aluResult = ex_mem.aluResult;

  // ここはpipelineクラスで行われるべき処理だが、一時的のここで実装
  // 分岐処理：EXステージで即座に処理してフラッシュ
  if (ex_mem.branch)
  {
    pc = ex_mem.branchTarget;
    hazard.setFlush(true); // パイプラインフラッシュ

    // パイプラインフラッシュ時にFPUユニットもリセット
    fpuEmulator.reset();
  }
  else
  {
    hazard.setFlush(false);
  }
}
