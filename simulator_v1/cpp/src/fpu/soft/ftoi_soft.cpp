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

uint32_t simulate_ftoi(uint32_t input)
{
    U32F fa;
    fa.bits = input;
    float x = fa.f;
    int32_t intResult = static_cast<int32_t>(std::nearbyint(x));
    return static_cast<uint32_t>(intResult);
}
