#include <iostream>
#include <vector>
#include <cstdint>
#include <string>
#include <cmath>
#include <iomanip>
#include <sstream>
#include <cstring>
#include <bitset>
#include <algorithm>

namespace
{
    union U32F
    {
        uint32_t bits;
        float f;
    };
}

// 名前空間の衝突（std::roundなど）を防ぐため、using namespace std; は避けます
using std::cerr;
using std::cout;
using std::endl;
using std::string;
using std::vector;

// ftoi_pipeline.sv のビットレベルシミュレータ
uint32_t simulate_ftoi(uint32_t input)
{
    uint32_t input_a_s1 = input;

    uint32_t sign_s1_comb = (input_a_s1 >> 31) & 1;
    uint32_t exponent_s1_comb = (input_a_s1 >> 23) & 0xFF;
    // mantissa: [32:25]=0, [24]=1, [23:1]=frac, [0]=0
    uint64_t mantissa_s1_comb = ((uint64_t)1 << 24) | ((input_a_s1 & 0x7FFFFF) << 1);

    uint32_t shift_amount_s1_comb = 150 - exponent_s1_comb; // オーバーフローしてもunsigned計算で回るのでOKだが値には注意
    uint32_t shift_amount_s1_comb2 = exponent_s1_comb - 150;

    uint64_t shifted_mantissa_s1_comb;

    if (exponent_s1_comb < 150)
    {
        // 右シフト (Right Shift)
        // C++では64bit以上のシフトはUndefined Behaviorなのでガードする
        if (shift_amount_s1_comb >= 64)
        {
            shifted_mantissa_s1_comb = 0;
        }
        else
        {
            shifted_mantissa_s1_comb = mantissa_s1_comb >> shift_amount_s1_comb;
        }
    }
    else
    {
        // 左シフト (Left Shift)
        if (shift_amount_s1_comb2 >= 64)
        {
            shifted_mantissa_s1_comb = 0;
        }
        else
        {
            shifted_mantissa_s1_comb = mantissa_s1_comb << shift_amount_s1_comb2;
        }

        // Verilogの33bit幅に合わせる (上位ビットを捨てる)
        shifted_mantissa_s1_comb &= 0x1FFFFFFFFULL;
    }

    // 丸め処理
    uint32_t result_s1_comb;
    if (shifted_mantissa_s1_comb & 1)
    {
        result_s1_comb = (uint32_t)((shifted_mantissa_s1_comb >> 1) + 1);
    }
    else
    {
        result_s1_comb = (uint32_t)(shifted_mantissa_s1_comb >> 1);
    }

    uint32_t final_result;
    if (sign_s1_comb)
    {
        final_result = ~result_s1_comb + 1;
    }
    else
    {
        final_result = result_s1_comb;
    }

    return final_result;
}