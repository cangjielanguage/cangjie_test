#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

uint32_t* testfunc() {
    uint32_t* ptr = (uint32_t*)malloc(sizeof(uint32_t) * 3);
    ptr[0] = 0;
    ptr[1] = 2;
    ptr[2] = 4294967295;
    return ptr;
}
