#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

int32_t* testfunc() {
    int32_t* ptr = (int32_t*)malloc(sizeof(int32_t) * 3);
    ptr[0] = -2147483648;
    ptr[1] = 0;
    ptr[2] = 2147483647;
    return ptr;
}

}