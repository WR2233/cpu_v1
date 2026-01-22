#ifndef LATCH_EX_MEM_H
#define LATCH_EX_MEM_H

// パイプラインレジスタ: EX/MEM
struct EX_MEM
{
  Instruction inst;
  uint32_t pc;
  uint32_t aluResult;
  uint32_t writeData;
  uint32_t operandA;
  uint32_t operandB;
  uint8_t writeReg;
  bool branch;
  uint32_t branchTarget;
  bool stall;
  uint8_t fpuLatency; // 残りのFPUレイテンシ（サイクル数）

  EX_MEM() : pc(0), aluResult(0), writeData(0), writeReg(0),
             branch(false), branchTarget(0), stall(false), fpuLatency(0) {}
};

#endif // LATCH_EX_MEM_H