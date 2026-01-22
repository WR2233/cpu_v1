#include <cmath>
#include <cstdint>
#include <vector>

// Simple software implementations of the simulator FPU interfaces.
// These functions mirror the symbols provided by fpu_sim/* so that
// FPUEmulator can link against either implementation.

namespace
{
    union U32F
    {
        uint32_t bits;
        float f;
    };

    inline uint32_t to_bits(float f)
    {
        U32F u{};
        u.f = f;
        return u.bits;
    }

    inline float to_float(uint32_t bits)
    {
        U32F u{};
        u.bits = bits;
        return u.f;
    }
} // namespace

uint32_t simulate_fsqrt(uint32_t a, const std::vector<uint64_t> & /*bram*/)
{
    return to_bits(std::sqrt(to_float(a)));
}
