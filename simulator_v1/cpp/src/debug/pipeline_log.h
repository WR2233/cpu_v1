#include <array>
#include <cstdint>
#include "../core/instruction.h"
#include "../pipeline/latch/if_id.h"
#include "../pipeline/latch/id_ex.h"
#include "../pipeline/latch/ex_mem.h"
#include "../pipeline/latch/mem_wb.h"
#include "../pipeline/forwarding/forward_unit.h"
#include "../pipeline/hazard/hazard_unit.h"

struct BusActivity
{
  bool valid = false;
  bool write = false;
  uint32_t address = 0;
  uint32_t readData = 0;
  uint32_t writeData = 0;
};
// ログスナップショット（デバッグ用）
struct LogSnapshot
{
  uint64_t cycle = 0;
  uint32_t pc = 0;                        // Fetch stage PC
  uint32_t currentInstructionAddress = 0; // Decode/EX stage PC
  uint32_t fetchedInstruction = 0;
  uint32_t regRead1Value = 0;
  uint32_t regRead2Value = 0;
  uint8_t regRead1Index = 0;
  uint8_t regRead2Index = 0;
  uint32_t aluResult = 0;
  uint32_t fpuResult = 0;
  uint32_t mduResult = 0;
  BusActivity instructionBus;
  BusActivity dataBus;
  BusActivity romBus;
  Instruction currentInstruction;
  std::array<uint32_t, 32> registers{};
  std::array<uint32_t, 32> fpRegisters{};
  int stallCount = 0;
  int flushCount = 0;
  uint32_t accessingAddress = 0;
  uint32_t accessingData = 0;
  bool mmioWrite = false;
  uint8_t mmioValue = 0;
  bool pipelineFrozen = false;

  // Pipeline stage registers (for detailed pipeline view)
  IF_ID if_id_snapshot;
  ID_EX id_ex_snapshot;
  EX_MEM ex_mem_snapshot;
  MEM_WB mem_wb_snapshot;
  MEM_WB wb_snapshot;
  ForwardingUnit::Result forwarding_snapshot;
  HazardDetectionUnit hazard_snapshot;
};