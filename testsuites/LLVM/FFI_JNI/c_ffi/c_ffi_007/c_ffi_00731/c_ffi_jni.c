#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

uint32_t* testfunc() {
    uint32_t* ptr = (uint32_t*)malloc(sizeof(uint32_t) * 3);
    ptr[0] = 97;
    ptr[1] = 98;
    ptr[2] = 99;
    return ptr;
}
