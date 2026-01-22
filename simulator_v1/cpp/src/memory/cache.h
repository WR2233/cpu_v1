#ifndef PIPELINE_CACHE_H
#define PIPELINE_CACHE_H

#include <cstdint>
#include <vector>

// - 2ウェイセットアソシエイティブ
// - ラインサイズ: 512 bytes (128 words)
// - キャッシュサイズ: 128 * 4096 = 524288 bytes = 131072 words
// - セットの数: 524288 / (2 * 512) = 512 個
// - LRU 置き換え ルール <-変えてもいい
// - Blocking

class Cache
{
public:
    static constexpr size_t LINE_SIZE_BYTES = 128;
    static constexpr size_t LINE_SIZE_WORDS = LINE_SIZE_BYTES / 4; // 128 words
    static constexpr size_t CACHE_SIZE_BYTES = 128 * 4096;         // 524288 bytes
    static constexpr size_t NUM_WAYS = 2;
    static constexpr size_t NUM_SETS = CACHE_SIZE_BYTES / (NUM_WAYS * LINE_SIZE_BYTES); // 512 sets

    // Address の分割:
    // [31:18] tag (14 bits)
    // [17:9]  set index (9 bits)
    // [8:2]   word offset (7 bits)
    // [1:0]   byte offset (2 bits, word単位でしかアクセスされないため 00)
    static constexpr uint32_t BLOCK_OFFSET_BITS = 7; // 128 bytes = 2^7
    static constexpr uint32_t SET_INDEX_BITS = 9;    // 512 sets = 2^9
    static constexpr uint32_t WORD_OFFSET_MASK = (LINE_SIZE_WORDS - 1);
    static constexpr uint32_t SET_INDEX_MASK = (NUM_SETS - 1);

    struct CacheLine
    {
        bool valid = false;
        uint32_t tag = 0;
        std::vector<uint32_t> data;

        CacheLine() : data(LINE_SIZE_WORDS, 0) {}
    };

    struct CacheSet
    {
        CacheLine ways[NUM_WAYS];
        bool lru = false; // false ->0: LRU, true ->1: LRU
    };

    Cache();
    // キャッシュミス時.trueを返す
    bool readWord(uint32_t address, std::vector<uint32_t> &memory, uint32_t &value);
    bool writeWord(uint32_t address, uint32_t value, std::vector<uint32_t> &memory);

    // Reset cache state
    void reset();

    // Statistics
    uint64_t getHits() const { return hits; }
    uint64_t getMisses() const { return misses; }
    double getHitRate() const
    {
        uint64_t total = hits + misses;
        return total > 0 ? static_cast<double>(hits) / total : 0.0;
    }

private:
    std::vector<CacheSet> sets;
    uint64_t hits;
    uint64_t misses;

    uint32_t getTag(uint32_t address) const
    {
        return address >> (BLOCK_OFFSET_BITS + SET_INDEX_BITS);
    }

    uint32_t getSetIndex(uint32_t address) const
    {
        return (address >> BLOCK_OFFSET_BITS) & SET_INDEX_MASK;
    }

    uint32_t getWordOffset(uint32_t address) const
    {
        return (address >> 2) & WORD_OFFSET_MASK;
    }

    uint32_t getLineBaseAddress(uint32_t address) const
    {
        return address & ~((LINE_SIZE_BYTES - 1));
    }

    void loadLine(CacheLine &line, uint32_t address, std::vector<uint32_t> &memory);

    int findLine(uint32_t setIndex, uint32_t tag) const;

    int selectVictim(uint32_t setIndex) const;
};

#endif // PIPELINE_CACHE_H
