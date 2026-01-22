#include "memory.h"
#include <fstream>
#include <iostream>

Memory::Memory(size_t dataWords, size_t instWords, const std::string &mmioFile, size_t bramWords)
    : dataMemory(dataWords, 0), instructionMemory(instWords, 0), bram(bramWords, 0), mmioFilePath(mmioFile)
{
    reset();
}

void Memory::reset()
{
    std::fill(dataMemory.begin(), dataMemory.end(), 0);
    std::fill(instructionMemory.begin(), instructionMemory.end(), 0);
    std::fill(bram.begin(), bram.end(), 0);
    dataCache.reset();

    // Truncate MMIO output file
    std::ofstream ofs(mmioFilePath, std::ios::out | std::ios::binary | std::ios::trunc);
    if (!ofs)
    {
        std::cerr << "Warning: Failed to initialize MMIO file: " << mmioFilePath << std::endl;
    }
}

bool Memory::setInstruction(size_t index, uint32_t value)
{
    if (index >= instructionMemory.size())
    {
        return false;
    }
    instructionMemory[index] = value;
    return true;
}

bool Memory::getInstruction(uint32_t pc, uint32_t &value) const
{
    size_t idx = pc / 4;
    if (idx >= instructionMemory.size())
    {
        return false;
    }
    value = instructionMemory[idx];
    return true;
}

bool Memory::hasInstruction(uint32_t pc) const
{
    size_t idx = pc / 4;
    return idx < instructionMemory.size();
}

bool Memory::translateWordAddress(uint32_t address, size_t &index, bool &useBram) const
{
    // BRAM: 0x80000000 ~ 0xFFFF0000 (excluding MMIO)
    if (address >= BRAM_BASE && address < MMIO_ADDR)
    {
        useBram = true;
        uint32_t offset = address - BRAM_BASE;
        index = offset / 4;
        return index < bram.size();
    }
    // DRAM: 0x00000000 ~ 0x7FFFFFFF
    useBram = false;
    index = address / 4;
    return index < dataMemory.size();
}

bool Memory::translateByteAddress(uint32_t address, size_t &index, uint8_t &shift, bool &useBram) const
{
    // BRAM: 0x80000000 ~ 0xFFFF0000 (excluding MMIO)
    if (address >= BRAM_BASE && address < MMIO_ADDR)
    {
        useBram = true;
        uint32_t offset = address - BRAM_BASE;
        index = offset / 4;
        shift = offset % 4;
        return index < bram.size();
    }
    // DRAM: 0x00000000 ~ 0x7FFFFFFF
    useBram = false;
    index = address / 4;
    shift = address % 4;
    return index < dataMemory.size();
}

MemoryRead Memory::readWord(uint32_t address) const
{
    MemoryRead result;
    size_t idx = 0;
    bool useBram = false;
    if (!translateWordAddress(address, idx, useBram))
    {
        return result;
    }
    result.ok = true;
    if (useBram)
    {
        result.value = bram[idx];
        result.cacheMiss = false;
    }
    else
    {
        result.cacheMiss = dataCache.readWord(address, const_cast<std::vector<uint32_t> &>(dataMemory), result.value);
    }
    return result;
}

MemoryRead Memory::readByte(uint32_t address) const
{
    MemoryRead result;
    size_t idx = 0;
    uint8_t shift = 0;
    bool useBram = false;
    if (!translateByteAddress(address, idx, shift, useBram))
    {
        return result;
    }

    uint32_t word;
    if (useBram)
    {
        word = bram[idx];
        result.cacheMiss = false;
    }
    else
    {
        result.cacheMiss = dataCache.readWord(address, const_cast<std::vector<uint32_t> &>(dataMemory), word);
    }

    uint8_t byte = static_cast<uint8_t>((word >> (shift * 8)) & 0xFF);
    result.ok = true;
    // Sign-extend for byte reads
    result.value = static_cast<uint32_t>(static_cast<int32_t>(static_cast<int8_t>(byte)));
    return result;
}

MemoryWrite Memory::writeWord(uint32_t address, uint32_t value)
{
    MemoryWrite result;
    // MMIO range (0xFFFF0000~)
    if (address >= MMIO_ADDR)
    {
        if (address == MMIO_ADDR)
        {
            std::ofstream ofs(mmioFilePath, std::ios::out | std::ios::binary | std::ios::app);
            if (ofs)
            {
                uint8_t byte = static_cast<uint8_t>(value & 0xFF);
                ofs.write(reinterpret_cast<char *>(&byte), 1);
                result.ok = true;
                result.mmio = true;
                result.mmioValue = byte;
            }
        }
        else
        {
            // Other MMIO addresses: ERROR
            std::cerr << "Error: Write to MMIO range 0x" << std::hex << address
                      << " (value=0x" << value << ") is not allowed" << std::dec << std::endl;
            result.ok = false;
            std::exit(1);
        }
        return result;
    }

    size_t idx = 0;
    bool useBram = false;
    if (!translateWordAddress(address, idx, useBram))
    {
        return result;
    }
    if (useBram)
    {
        bram[idx] = value;
        result.cacheMiss = false;
    }
    else
    {
        result.cacheMiss = dataCache.writeWord(address, value, dataMemory);
    }
    result.ok = true;
    return result;
}

MemoryWrite Memory::writeByte(uint32_t address, uint8_t value)
{
    MemoryWrite result;
    // MMIO range (0xFFFF0000~)
    if (address >= MMIO_ADDR)
    {
        if (address == MMIO_ADDR)
        {
            // MMIO_ADDR: write to file (standard error output)
            std::ofstream ofs(mmioFilePath, std::ios::out | std::ios::binary | std::ios::app);
            if (ofs)
            {
                ofs.write(reinterpret_cast<char *>(&value), 1);
                result.ok = true;
                result.mmio = true;
                result.mmioValue = value;
            }
            return result;
        }
        else
        {
            // Other MMIO addresses: ERROR
            std::cerr << "Error: Write to MMIO range 0x" << std::hex << address
                      << " (value=0x" << (int)value << ") is not allowed" << std::dec << std::endl;
            result.ok = false;
            std::exit(1);
        }
        return result;
    }

    size_t idx = 0;
    uint8_t shift = 0;
    bool useBram = false;
    if (!translateByteAddress(address, idx, shift, useBram))
    {
        return result;
    }

    uint32_t mask = ~(0xFFu << (shift * 8));
    uint32_t byte_val = static_cast<uint32_t>(value) << (shift * 8);

    if (useBram)
    {
        bram[idx] = (bram[idx] & mask) | byte_val;
        result.cacheMiss = false;
    }
    else
    {
        // キャッシュは4byte単位で管理されているため1byteを更新するには
        // 一度他の3byteをとってきて、合わせて4byteにして書き込む必要がある
        uint32_t word;
        bool readMiss = dataCache.readWord(address, dataMemory, word);
        word = (word & mask) | byte_val;
        bool writeMiss = dataCache.writeWord(address, word, dataMemory);
        result.cacheMiss = readMiss || writeMiss;
    }
    result.ok = true;
    return result;
}

bool Memory::storeDataWord(uint32_t address, uint32_t value)
{
    size_t idx = 0;
    bool useBram = false;
    if (!translateWordAddress(address, idx, useBram))
    {
        return false;
    }
    if (useBram)
    {
        bram[idx] = value;
    }
    else
    {
        dataCache.writeWord(address, value, dataMemory);
    }
    return true;
}
