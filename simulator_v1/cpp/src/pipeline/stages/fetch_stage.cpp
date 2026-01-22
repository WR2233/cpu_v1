#include "pipeline/pipeline.h"

void PipelineProcessor::fetch()
{
  if (pipelineFrozen)
  {
    return;
  }

  if (hazard.shouldFlush())
  {
    // フラッシュ時も新しいPCから命令フェッチ
    flushCount++;
  }
  else if (hazard.shouldStall())
  {
    // ストールの場合は命令フェッチをスキップ
    stallCount++;
    return;
  }

  uint32_t fetched = 0;
  if ((pc / 4) < loadedInstructionCount && memory.getInstruction(pc, fetched))
  {
    if_id.instruction = fetched;
    if_id.pc = pc;
    if_id.stall = false;
    logSnapshot.instructionBus.valid = true;
    logSnapshot.instructionBus.address = if_id.pc;
    logSnapshot.instructionBus.readData = if_id.instruction;
    logSnapshot.fetchedInstruction = if_id.instruction;
    logSnapshot.pc = if_id.pc;
    pc += 4;
  }
  else
  {
    // 命令コードの範囲を超えていたら NOP
    if_id.instruction = 0;
    if_id.stall = false;
  }
}
