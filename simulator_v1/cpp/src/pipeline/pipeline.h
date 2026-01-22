#ifndef PIPELINE_H
#define PIPELINE_H

#include "../core/instruction.h"
#include "../fpu/fpu_emulator.h"
#include "../memory/memory.h"
#include "../pipeline/latch/if_id.h"
#include "../pipeline/latch/id_ex.h"
#include "../pipeline/latch/ex_mem.h"
#include "../pipeline/latch/mem_wb.h"
#include "../debug/pipeline_log.h"
#include <cstdint>
#include <vector>
#include <array>
#include <string>

// パイプラインプロセッサ
class PipelineProcessor
{
private:
    // レジスタファイル (32本のレジスタ、R0は常に0)
    std::array<uint32_t, 32> registers;

    // 浮動小数点レジスタファイル (32本のレジスタ)
    std::array<uint32_t, 32> fpRegisters;

    // メモリ管理
    Memory memory;

    // プログラムカウンタ
    uint32_t pc;

    // パイプラインレジスタ
    IF_ID if_id;
    ID_EX id_ex;
    EX_MEM ex_mem;
    MEM_WB mem_wb;
    MEM_WB wb; // WBステージの値（フォワーディング用）

    // フォワーディングとハザード検出
    ForwardingUnit forwarding;
    HazardDetectionUnit hazard;

    // サイクルカウンタ
    uint64_t cycleCount;
    uint64_t instructionCount;

    // ストール・フラッシュのカウント
    uint64_t stallCount;
    uint64_t flushCount;
    size_t loadedInstructionCount;

    // FPUエミュレータ
    FPUEmulator fpuEmulator;
    bool pipelineFrozen;

    static constexpr int CACHE_MISS_PENALTY = 50;
    int cacheMissPenaltyRemaining;

    LogSnapshot logSnapshot;

    void resetLogSnapshot();

    // 実行終了判定
    bool executed_ebreak;

public:
    PipelineProcessor();

    // メモリに命令をロード
    void loadProgram(const std::vector<uint32_t> &program);

    // 1サイクル実行
    void clock();

    // パイプラインステージ
    void fetch();
    void decode();
    void execute();
    bool memoryAccess();
    void writeBack();

    // ハザード検出とフォワーディング
    void detectHazards();
    void detectForwarding();

    // 状態表示
    void printStatus() const;
    void printPipeline() const;
    void printRegisters() const;
    void printStatistics() const;

    // 実行継続判定
    bool isRunning();

    // レジスタアクセス
    uint32_t getRegister(int index) const;
    void setRegister(int index, uint32_t value);
    uint32_t getfpRegister(int index) const;
    void setfpRegister(int index, uint32_t value);

    // デバッグ用
    const LogSnapshot &getLogSnapshot() const;
    uint32_t getPC() const { return pc; }
    const std::array<uint32_t, 32> &getRegisters() const { return registers; }
    const std::array<uint32_t, 32> &getfpRegisters() const { return fpRegisters; }
    uint32_t peekMemory(uint32_t address) const;
};

#endif // PIPELINE_H
