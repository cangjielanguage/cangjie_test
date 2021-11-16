#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

float* testfunc() {
    float* ptr = (float*)malloc(sizeof(float) * 3);
    ptr[0] = 3.14;
    ptr[1] = 0;
    ptr[2] = -3.14;
    return ptr;
}

}