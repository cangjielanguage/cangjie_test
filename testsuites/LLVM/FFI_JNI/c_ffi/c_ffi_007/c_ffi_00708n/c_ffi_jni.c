#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

uint8_t* testfunc() {
    uint8_t* ptr = (uint8_t*)malloc(sizeof(uint8_t) * 3);
    ptr[0] = 0;
    ptr[1] = 2;
    ptr[2] = 255;
    return ptr;
}
