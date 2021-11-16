#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

int8_t* testfunc() {
    int8_t* ptr = (int8_t*)malloc(sizeof(int8_t) * 3);
    ptr[0] = -128;
    ptr[1] = 0;
    ptr[2] = 127;
    return ptr;
}

}