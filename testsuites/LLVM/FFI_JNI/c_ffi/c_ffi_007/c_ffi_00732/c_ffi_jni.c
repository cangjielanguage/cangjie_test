#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

int32_t* testfunc() {
    int32_t* ptr = (int32_t*)malloc(sizeof(int32_t) * 3);
    ptr[0] = 97;
    ptr[1] = 98;
    ptr[2] = 99;
    return ptr;
}
