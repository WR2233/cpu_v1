#include "fpu_emulator.h"
#include "../core/instruction.h"
#include <cmath>
#include <limits>
#include <fstream>
#include <sstream>
#include <vector>
#include <iostream>

// fpu_sim/fpu_softファイルからの関数宣言
extern uint32_t simulate_fadd(uint32_t input_a, uint32_t input_b);
extern uint32_t simulate_fsub(uint32_t input_a, uint32_t input_b);
extern uint32_t simulate_fmul(uint32_t a, uint32_t b);
extern uint32_t simulate_fdiv(uint32_t a, uint32_t b, const std::vector<uint64_t> &bram);
extern uint32_t simulate_finv(uint32_t a, const std::vector<uint64_t> &bram);
extern uint32_t simulate_fsqrt(uint32_t a, const std::vector<uint64_t> &bram);
extern uint32_t simulate_fisqrt(uint32_t a, const std::vector<uint64_t> &bram);
extern uint32_t simulate_ftoi(uint32_t a);
extern uint32_t simulate_itof(uint32_t a);

bool load_bram_from_coe(std::vector<uint64_t> &bram, std::string table_name)
{
    uint32_t num_entries = (table_name == "finv")     ? 1024
                           : (table_name == "fsqrt")  ? 2048
                           : (table_name == "fisqrt") ? 2048
                                                      : 0;
    std::string filename = "./src/fpu/sim/tables/" + table_name + "_table_optimized.coe";

    std::ifstream coe_file(filename);
    if (!coe_file.is_open())
    {
        std::cerr << "Error: Could not open " << filename << std::endl;
        return false;
    }

    std::cout << "Loading BRAM data from " << filename << "..." << std::endl;
    bram.clear();
    std::string line;

    // ヘッダー行 (radix=16 や vector=) を読み飛ばす
    while (std::getline(coe_file, line) && line.find("memory_initialization_vector=") == std::string::npos)
    {
        // "memory_initialization_vector=" が見つかるまで読み飛ばし
    }

    // データ行を読み込む
    while (std::getline(coe_file, line))
    {
        // 行末のカンマ(,)やセミコロン(;)を削除
        size_t last_char_pos = line.find_last_of(",;");
        if (last_char_pos != std::string::npos)
        {
            line = line.substr(0, last_char_pos);
        }

        // 空行はスキップ
        if (line.empty())
        {
            continue;
        }

        // 16進数文字列を uint64_t に変換
        try
        {
            // std::stoull を使って 16進数(base=16) から unsigned long long に変換
            unsigned long long value = std::stoull(line, nullptr, 16);
            bram.push_back(static_cast<uint64_t>(value));
        }
        catch (const std::invalid_argument &e)
        {
            std::cerr << "Error: Invalid data in COE file: " << line << std::endl;
            return false;
        }
    }

    if (bram.size() != num_entries)
    {
        std::cerr << "Error: COE file loaded " << bram.size() << " entries, but expected " << num_entries << std::endl;
        return false;
    }

    std::cout << "Successfully loaded " << bram.size() << " BRAM entries." << std::endl;
    return true;
}

FPUEmulator::FPUEmulator()
{
    struct BramInit
    {
        decltype(bram_finv) &bram;
        std::string name;
    };
    const BramInit brams[] = {
        {bram_finv, "finv"},
        {bram_fsqrt, "fsqrt"},
        {bram_fisqrt, "fisqrt"},
    };
    // コンストラクタ：BRAMテーブルを初期化
    for (const auto &b : brams)
    {
        if (!load_bram_from_coe(b.bram, b.name))
        {
            std::cerr << b.name << "_coe_path_err\n";
            std::exit(1);
        }
    }
}

// FPUOpに対応するUnitStateを取得
FPUEmulator::UnitState &FPUEmulator::getUnit(FPUOp op)
{
    switch (op)
    {
    case FPUOp::FADD:
        return fadd;
    case FPUOp::FSUB:
        return fsub;
    case FPUOp::FMUL:
        return fmul;
    case FPUOp::FDIV:
        return fdiv;
    case FPUOp::FSQRT:
        return fsqrt;
    case FPUOp::FEQ:
    case FPUOp::FLT:
    case FPUOp::FLE:
        return fcompare;
    case FPUOp::FTOI:
        return ftoi;
    case FPUOp::ITOF:
        return itof;
    case FPUOp::FINV:
        return finv;
    case FPUOp::FISQRT:
        return fisqrt;
    case FPUOp::FLOOR:
        return floor;
    default:
        return fadd; // デフォルト
    }
}

const FPUEmulator::UnitState &FPUEmulator::getUnit(FPUOp op) const
{
    return const_cast<FPUEmulator *>(this)->getUnit(op);
}

uint8_t FPUEmulator::getFPULatency(FPUOp op)
{
    switch (op)
    {
    case FPUOp::FADD:
    case FPUOp::FSUB:
    case FPUOp::FMUL:
    case FPUOp::FSQRT:
    case FPUOp::FINV:
    case FPUOp::FISQRT:
    case FPUOp::FDIV:
    case FPUOp::FTOI:
    case FPUOp::ITOF:
    case FPUOp::FLOOR:
        return 7;
    case FPUOp::FEQ:
    case FPUOp::FLT:
    case FPUOp::FLE:
        return 1;
    default:
        return 1;
    };
}

// 実際の計算を実行（2オペランド）
uint32_t FPUEmulator::compute(uint32_t a, uint32_t b, FPUOp op)
{
    Float32 fa, fb;
    fa.bits = a;
    fb.bits = b;

    switch (op)
    {
    case FPUOp::FADD:
        return simulate_fadd(a, b);
    case FPUOp::FSUB:
        return simulate_fsub(a, b);
    case FPUOp::FMUL:
        return simulate_fmul(a, b);
    case FPUOp::FDIV:
        return simulate_fdiv(a, b, bram_finv);
    case FPUOp::FEQ:
        return (fa.f == fb.f) ? 1 : 0;
    case FPUOp::FLT:
        return (fa.f < fb.f) ? 1 : 0;
    case FPUOp::FLE:
        return (fa.f <= fb.f) ? 1 : 0;
    default:
        return 0;
    }
}

// 実際の計算を実行（1オペランド）
uint32_t FPUEmulator::compute(uint32_t a, FPUOp op)
{
    Float32 fa, result;
    fa.bits = a;

    switch (op)
    {
    case FPUOp::FSQRT:
        return simulate_fsqrt(a, bram_fsqrt);
    case FPUOp::FTOI:
    {
        return simulate_ftoi(a);
    }
    case FPUOp::ITOF:
    {
        return simulate_itof(a);
    }
    case FPUOp::FINV:
        return simulate_finv(a, bram_finv);
    case FPUOp::FISQRT:
        return simulate_fisqrt(a, bram_fisqrt);
    case FPUOp::FLOOR:
        result.f = std::floor(fa.f);
        return result.bits;
    default:
        return 0;
    }
}

// ユニットが使用可能かチェック
bool FPUEmulator::canExecute() const
{
    for (FPUOp op : AllFPUOps)
    {
        const UnitState &unit = getUnit(op);
        if (unit.valid)
        {
            return false; // いずれかのユニットがビジー
        }
    }
    // すべて使われていなければ実行可能
    return true;
}

// パイプライン演算開始（2オペランド）
void FPUEmulator::execute(uint32_t a, uint32_t b, FPUOp op)
{
    UnitState &unit = getUnit(op);

    // ユニットが使用中の場合は実行しない（上書きを防ぐ）
    if (unit.valid)
    {
        // 既に使用中の場合は何もしない
        // （パイプライン側でストールすべき）
        return;
    }

    // 即座に計算を実行
    unit.result = compute(a, b, op);
    unit.remainingCycles = getFPULatency(op);
    unit.valid = true;
}

// パイプライン演算開始（1オペランド）
void FPUEmulator::execute(uint32_t a, FPUOp op)
{
    UnitState &unit = getUnit(op);

    // ユニットが使用中の場合は実行しない（上書きを防ぐ）
    if (unit.valid)
    {
        // 既に使用中の場合は何もしない
        // （パイプライン側でストールすべき）
        return;
    }

    // 即座に計算を実行
    unit.result = compute(a, op);
    unit.remainingCycles = getFPULatency(op);
    unit.valid = true;
}

// 結果準備完了確認
bool FPUEmulator::isReady(FPUOp op) const
{
    const UnitState &unit = getUnit(op);
    return unit.valid && unit.remainingCycles == 0;
}

// 結果取得（取得後にユニットを自動的にクリア）
uint32_t FPUEmulator::getResult(FPUOp op)
{
    UnitState &unit = getUnit(op);
    uint32_t result = unit.result;

    // 結果を取得したらユニットをクリア
    unit.valid = false;
    unit.remainingCycles = 0;
    unit.result = 0;

    return result;
}

// 1サイクル進める
void FPUEmulator::clock()
{
    // 全ユニットの残りサイクルをデクリメント
    auto decrementCycles = [](UnitState &unit)
    {
        if (unit.valid && unit.remainingCycles > 0)
        {
            unit.remainingCycles--;
        }
    };

    decrementCycles(fadd);
    decrementCycles(fsub);
    decrementCycles(fmul);
    decrementCycles(fdiv);
    decrementCycles(fsqrt);
    decrementCycles(fcompare);
    decrementCycles(ftoi);
    decrementCycles(itof);
    decrementCycles(finv);
    decrementCycles(fisqrt);
    decrementCycles(floor);
}

// リセット
void FPUEmulator::reset()
{
    fadd = UnitState{};
    fsub = UnitState{};
    fmul = UnitState{};
    fdiv = UnitState{};
    fsqrt = UnitState{};
    fcompare = UnitState{};
    ftoi = UnitState{};
    itof = UnitState{};
    finv = UnitState{};
    fisqrt = UnitState{};
    floor = UnitState{};
}

std::string FPUEmulator::toString(FPUOp op)
{
    switch (op)
    {
    case FPUOp::FADD:
        return "fadd";
    case FPUOp::FSUB:
        return "fsub";
    case FPUOp::FMUL:
        return "fmul";
    case FPUOp::FDIV:
        return "fdiv";
    case FPUOp::FSQRT:
        return "fsqrt";
    case FPUOp::FEQ:
        return "feq";
    case FPUOp::FLT:
        return "flt";
    case FPUOp::FLE:
        return "fle";
    case FPUOp::FTOI:
        return "ftoi";
    case FPUOp::ITOF:
        return "itof";
    case FPUOp::FINV:
        return "finv";
    case FPUOp::FISQRT:
        return "fisqrt";
    case FPUOp::FLOOR:
        return "floor";
    default:
        return "unknown"; // デフォルト
    }
}

// OpcodeからFPUOpへの変換ヘルパー関数
FPUOp opcodeToFPUOp(Opcode opcode)
{
    switch (opcode)
    {
    case Opcode::FADD:
        return FPUOp::FADD;
    case Opcode::FSUB:
        return FPUOp::FSUB;
    case Opcode::FMUL:
        return FPUOp::FMUL;
    case Opcode::FDIV:
        return FPUOp::FDIV;
    case Opcode::FSQRT:
        return FPUOp::FSQRT;
    case Opcode::FEQ:
        return FPUOp::FEQ;
    case Opcode::FLT:
        return FPUOp::FLT;
    case Opcode::FLE:
        return FPUOp::FLE;
    case Opcode::FTOI:
        return FPUOp::FTOI;
    case Opcode::ITOF:
        return FPUOp::ITOF;
    case Opcode::FINV:
        return FPUOp::FINV;
    case Opcode::FISQRT:
        return FPUOp::FISQRT;
    case Opcode::FLOOR:
        return FPUOp::FLOOR;
    default:
        std::cout << "Invalid opcode for FPU operation: " << static_cast<int>(opcode) << std::endl;
        throw std::invalid_argument("Invalid opcode"); // デフォルト値
    }
}

bool FPUEmulator::requiresFpuPipeline(Opcode opcode) const
{
    switch (opcode)
    {
    case Opcode::FADD:
    case Opcode::FSUB:
    case Opcode::FMUL:
    case Opcode::FDIV:
    case Opcode::FSQRT:
    case Opcode::FEQ:
    case Opcode::FLT:
    case Opcode::FLE:
    case Opcode::FISQRT:
    case Opcode::FINV:
    case Opcode::FLOOR:
    case Opcode::FTOI:
    case Opcode::ITOF:
        return true;
    default:
        return false;
    }
}

bool FPUEmulator::isFpuResultReady(Opcode opcode) const
{
    switch (opcode)
    {
    case Opcode::FADD:
    case Opcode::FSUB:
    case Opcode::FMUL:
    case Opcode::FDIV:
    case Opcode::FSQRT:
    case Opcode::FEQ:
    case Opcode::FLT:
    case Opcode::FLE:
    case Opcode::FISQRT:
    case Opcode::FINV:
    case Opcode::FLOOR:
    case Opcode::FTOI:
    case Opcode::ITOF:
        return isReady(opcodeToFPUOp(opcode));
    default:
        return true;
    }
}

uint32_t FPUEmulator::fetchFpuResult(Opcode opcode)
{
    switch (opcode)
    {
    case Opcode::FADD:
    case Opcode::FSUB:
    case Opcode::FMUL:
    case Opcode::FDIV:
    case Opcode::FSQRT:
    case Opcode::FEQ:
    case Opcode::FLT:
    case Opcode::FLE:
    case Opcode::FISQRT:
    case Opcode::FINV:
    case Opcode::FLOOR:
    case Opcode::FTOI:
    case Opcode::ITOF:
        return getResult(opcodeToFPUOp(opcode));
    default:
        throw std::invalid_argument("Invalid opcode for FPU result fetch");
    }
}