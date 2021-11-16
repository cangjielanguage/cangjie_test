#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

uint16_t* testfunc() {
    uint16_t* ptr = (uint16_t*)malloc(sizeof(uint16_t) * 3);
    ptr[0] = 97;
    ptr[1] = 98;
    ptr[2] = 99;
    return ptr;
}
