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

uint32_t simulate_fmul(uint32_t input_a, uint32_t input_b)
{
  return to_bits(to_float(input_a) * to_float(input_b));
}
