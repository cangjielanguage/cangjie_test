#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

uint32_t* testfunc() {
    uint32_t* ptr = (uint32_t*)malloc(sizeof(uint32_t) * 3);
    ptr[0] = (uint32_t)'a';
    ptr[1] = (uint32_t)'b';
    ptr[2] = (uint32_t)'c';
    return ptr;
}

}