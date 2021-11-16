#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

uint16_t* testfunc(uint16_t* ptr) {
    ptr[0] = 1;
    ptr[1] = 2;
    ptr[2] = 3;
    return ptr;
}
