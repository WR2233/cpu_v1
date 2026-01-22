#include "cache.h"
#include <algorithm>

Cache::Cache() : sets(NUM_SETS), hits(0), misses(0)
{
    reset();
}

void Cache::reset()
{
    hits = 0;
    misses = 0;
    for (auto &set : sets)
    {
        for (size_t i = 0; i < NUM_WAYS; ++i)
        {
            set.ways[i].valid = false;
            set.ways[i].tag = 0;
            std::fill(set.ways[i].data.begin(), set.ways[i].data.end(), 0);
        }
        set.lru = false;
    }
}

int Cache::findLine(uint32_t setIndex, uint32_t tag) const
{
    const CacheSet &set = sets[setIndex];
    for (size_t i = 0; i < NUM_WAYS; ++i)
    {
        if (set.ways[i].valid && set.ways[i].tag == tag)
        {
            return static_cast<int>(i);
        }
    }
    return -1;
}

int Cache::selectVictim(uint32_t setIndex) const
{
    const CacheSet &set = sets[setIndex];

    for (size_t i = 0; i < NUM_WAYS; ++i)
    {
        if (!set.ways[i].valid)
        {
            return static_cast<int>(i);
        }
    }

    // LRU bit: false -> 0: LRU, true -> 1: LRU
    return set.lru ? 1 : 0;
}

void Cache::loadLine(CacheLine &line, uint32_t address, std::vector<uint32_t> &memory)
{
    uint32_t baseAddress = getLineBaseAddress(address);
    uint32_t baseWordIndex = baseAddress / 4;

    for (size_t i = 0; i < LINE_SIZE_WORDS; ++i)
    {
        uint32_t wordIndex = baseWordIndex + i;
        if (wordIndex < memory.size())
        {
            line.data[i] = memory[wordIndex];
        }
        else
        {
            std::exit(1); // メモリアドレスが不正エラー
        }
    }

    line.valid = true;
    line.tag = getTag(address);
}

bool Cache::readWord(uint32_t address, std::vector<uint32_t> &memory, uint32_t &value)
{
    uint32_t tag = getTag(address);
    uint32_t setIndex = getSetIndex(address);
    uint32_t wordOffset = getWordOffset(address);

    int wayIndex = findLine(setIndex, tag); // キャッシュにデータがあれば wayIndex >=0, なければ wayIndex = -1

    if (wayIndex >= 0)
    {
        // Cache hit
        hits++;
        CacheSet &set = sets[setIndex];

        // 2wayだからアクセスされていない方が,lruになるように更新 2wayでなくなったら更新する必要あり
        set.lru = (wayIndex == 0);

        value = set.ways[wayIndex].data[wordOffset];
        return false;
    }
    else
    {
        misses++;

        int victimWay = selectVictim(setIndex);
        CacheSet &set = sets[setIndex];
        loadLine(set.ways[victimWay], address, memory);

        // 2wayだからアクセスされていない方が,lruになるように更新 2wayでなくなったら更新する必要あり
        set.lru = (victimWay == 0);

        value = set.ways[victimWay].data[wordOffset];
        return true;
    }
}

bool Cache::writeWord(uint32_t address, uint32_t value, std::vector<uint32_t> &memory)
{
    uint32_t tag = getTag(address);
    uint32_t setIndex = getSetIndex(address);
    uint32_t wordOffset = getWordOffset(address);
    uint32_t wordIndex = address / 4;

    // ライトスルーだからメモリは常に書き込む
    if (wordIndex < memory.size())
    {
        memory[wordIndex] = value;
    }

    int wayIndex = findLine(setIndex, tag);

    if (wayIndex >= 0)
    {
        hits++;
        CacheSet &set = sets[setIndex];
        set.ways[wayIndex].data[wordOffset] = value;

        // 2wayだからアクセスされていない方が,lruになるように更新 2wayでなくなったら更新する必要あり
        set.lru = (wayIndex == 0);
        return false;
    }
    else
    {
        misses++;

        int victimWay = selectVictim(setIndex);
        CacheSet &set = sets[setIndex];

        loadLine(set.ways[victimWay], address, memory);

        set.ways[victimWay].data[wordOffset] = value;

        // 2wayだからアクセスされていない方が,lruになるように更新 2wayでなくなったら更新する必要あり
        set.lru = (victimWay == 0);
        return true;
    }
}
