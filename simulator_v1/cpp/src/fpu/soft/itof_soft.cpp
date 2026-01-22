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

// 名前空間の衝突（std::roundなど）を防ぐため、using namespace std; は避けます
using std::cerr;
using std::cout;
using std::endl;
using std::string;
using std::vector;

namespace
{
    union U32F
    {
        uint32_t bits;
        float f;
    };
}

uint32_t simulate_itof(uint32_t input)
{
    U32F result;
    int32_t intInput = static_cast<int32_t>(input);
    result.f = static_cast<float>(intInput);
    return result.bits;
}
