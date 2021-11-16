#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

uint64_t* testfunc() {
    uint64_t* ptr = (uint64_t*)malloc(sizeof(uint64_t) * 3);
    ptr[0] = 0;
    ptr[1] = 2;
    ptr[2] = 18446744073709551615;
    return ptr;
}

}