#ifndef FPU_EMULATOR_H
#define FPU_EMULATOR_H

#include "../core/instruction.h"
#include <cstdint>
#include <array>
#include <cmath>
#include <cstring>
#include <vector>

/**
指定したサイクル数だけ待ってから、結果を出力するFPUパイプラインモジュール群
 */

// FPU演算の種類
enum class FPUOp
{
    FADD,
    FSUB,
    FMUL,
    FDIV,
    FSQRT,
    FEQ,
    FLT,
    FLE,
    FTOI,
    ITOF,
    FINV,
    FISQRT,
    FLOOR
};

inline constexpr FPUOp AllFPUOps[] = {
    FPUOp::FADD,
    FPUOp::FSUB,
    FPUOp::FMUL,
    FPUOp::FDIV,
    FPUOp::FSQRT,
    FPUOp::FEQ,
    FPUOp::FLT,
    FPUOp::FLE,
    FPUOp::FTOI,
    FPUOp::ITOF,
    FPUOp::FINV,
    FPUOp::FISQRT,
    FPUOp::FLOOR,
};

// 浮動小数点数のビット表現
union Float32
{
    float f;
    uint32_t bits;
};

FPUOp opcodeToFPUOp(Opcode opcode);

// execute時に計算を完了し、残りサイクル数をカウントダウンする方式
class FPUEmulator
{
private:
    // 各演算ユニットの状態
    struct UnitState
    {
        uint32_t result = 0;     // 計算結果
        int remainingCycles = 0; // 残りサイクル数
        bool valid = false;      // 有効な結果が存在するか
    };

    // 演算ユニット（各演算タイプごとに1つ）
    UnitState fadd;
    UnitState fsub;
    UnitState fmul;
    UnitState fdiv;
    UnitState fsqrt;
    UnitState fcompare; // FEQ, FLT, FLE共用
    UnitState ftoi;
    UnitState itof;
    UnitState finv;
    UnitState fisqrt;
    UnitState floor;

    // ハードウェア精度演算用のBRAMテーブル
    std::vector<uint64_t> bram_finv;
    std::vector<uint64_t> bram_fsqrt;
    std::vector<uint64_t> bram_fisqrt;

    // FPUOpに対応するUnitStateを取得
    UnitState &getUnit(FPUOp op);
    const UnitState &getUnit(FPUOp op) const;

    // 実際の計算を実行
    uint32_t compute(uint32_t a, uint32_t b, FPUOp op);
    uint32_t compute(uint32_t a, FPUOp op);

public:
    // コンストラクタ（BRAMテーブルを初期化）
    FPUEmulator();
    // パイプライン演算開始（2オペランド）
    void execute(uint32_t a, uint32_t b, FPUOp op);

    // パイプライン演算開始（1オペランド）
    void execute(uint32_t a, FPUOp op);

    // ユニットが使用中でないかチェック
    bool canExecute() const;

    // fpu命令ごとにレイテンシを発行
    uint8_t getFPULatency(FPUOp op);

    bool requiresFpuPipeline(Opcode opcode) const;
    bool isFpuResultReady(Opcode opcode) const;
    uint32_t fetchFpuResult(Opcode opcode);

    // 1サイクル進める
    void clock();

    // 結果取得
    bool isReady(FPUOp op) const;
    uint32_t getResult(FPUOp op); // 結果取得後、ユニットを自動的にクリア

    // リセット（全ユニットをクリア）
    void reset();

    // デバッグ用
    std::string toString(FPUOp op);
};

#endif // FPU_EMULATOR_H
