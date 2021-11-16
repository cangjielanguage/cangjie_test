#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

uint16_t* testfunc() {
    uint16_t* ptr = (uint16_t*)malloc(sizeof(uint16_t) * 3);
    ptr[0] = 0;
    ptr[1] = 2;
    ptr[2] = 65535;
    return ptr;
}

}