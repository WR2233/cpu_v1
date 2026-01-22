#ifndef PIPELINE_MEMORY_H
#define PIPELINE_MEMORY_H

#include <cstdint>
#include <string>
#include <vector>
#include "cache.h"

// Data read result
struct MemoryRead
{
    bool ok = false;
    uint32_t value = 0;
    bool cacheMiss = false;
};

// Data write result
struct MemoryWrite
{
    bool ok = false;
    bool mmio = false;
    uint8_t mmioValue = 0;
    bool cacheMiss = false;
};

class Memory
{
public:
    Memory(size_t dataWords = 1048576, size_t instWords = 4096, const std::string &mmioFile = "./log/output_mmio.ppm", size_t bramWords = 4096);

    void reset();

    // Instruction memory
    bool setInstruction(size_t index, uint32_t value);
    bool getInstruction(uint32_t pc, uint32_t &value) const;
    bool hasInstruction(uint32_t pc) const;
    size_t instructionSize() const { return instructionMemory.size(); }

    // Data access
    MemoryRead readWord(uint32_t address) const;
    MemoryRead readByte(uint32_t address) const;
    MemoryWrite writeWord(uint32_t address, uint32_t value);
    MemoryWrite writeByte(uint32_t address, uint8_t value);

    // Direct data load (used for program load)
    bool storeDataWord(uint32_t address, uint32_t value);

    size_t dataSizeWords() const { return dataMemory.size(); }

    // stats
    uint64_t hits() const { return dataCache.getHits(); }
    uint64_t misses() const { return dataCache.getMisses(); }
    double hitRate() const { return dataCache.getHitRate(); }

private:
    std::vector<uint32_t> dataMemory;
    std::vector<uint32_t> instructionMemory;
    std::vector<uint32_t> bram;
    std::string mmioFilePath;
    mutable Cache dataCache; // dataMemory用のキャッシュ

    static constexpr uint32_t BRAM_BASE = 0x80000000;
    static constexpr uint32_t MMIO_ADDR = 0xFFFF0000;

    bool translateWordAddress(uint32_t address, size_t &index, bool &useBram) const;
    bool translateByteAddress(uint32_t address, size_t &index, uint8_t &shift, bool &useBram) const;
};

#endif // PIPELINE_MEMORY_H
