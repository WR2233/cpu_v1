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

uint32_t simulate_fadd(uint32_t input_a, uint32_t input_b)
{
    return to_bits(to_float(input_a) + to_float(input_b));
}

uint32_t simulate_fsub(uint32_t input_a, uint32_t input_b)
{
    return to_bits(to_float(input_a) - to_float(input_b));
}

uint32_t simulate_fmul(uint32_t a, uint32_t b)
{
    return to_bits(to_float(a) * to_float(b));
}

uint32_t simulate_fdiv(uint32_t a, uint32_t b, const std::vector<uint64_t> & /*bram*/)
{
    return to_bits(to_float(a) / to_float(b));
}

uint32_t simulate_finv(uint32_t a, const std::vector<uint64_t> & /*bram*/)
{
    return to_bits(1.0f / to_float(a));
}

uint32_t simulate_fsqrt(uint32_t a, const std::vector<uint64_t> & /*bram*/)
{
    return to_bits(std::sqrt(to_float(a)));
}

uint32_t simulate_fisqrt(uint32_t a, const std::vector<uint64_t> & /*bram*/)
{
    return to_bits(1.0f / std::sqrt(to_float(a)));
}

uint32_t simulate_itof(uint32_t input)
{
    U32F result;
    int32_t intInput = static_cast<int32_t>(input);
    result.f = static_cast<float>(intInput);
    return result.bits;
}

uint32_t simulate_ftoi(uint32_t input)
{
    U32F fa;
    fa.bits = input;
    float x = fa.f;
    int32_t intResult = static_cast<int32_t>(std::nearbyint(x));
    return static_cast<uint32_t>(intResult);
}