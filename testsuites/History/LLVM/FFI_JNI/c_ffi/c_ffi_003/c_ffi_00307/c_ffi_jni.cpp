#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

int64_t* testfunc() {
    int64_t* ptr = (int64_t*)malloc(sizeof(int64_t) * 3);
    ptr[0] = -9223372036854775808;
    ptr[1] = 0;
    ptr[2] = 9223372036854775807;
    return ptr;
}

}