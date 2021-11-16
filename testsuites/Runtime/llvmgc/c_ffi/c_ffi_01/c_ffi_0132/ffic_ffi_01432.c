#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

uint64_t* testfunc(uint64_t* ptr) {
    ptr[0] = 1;
    ptr[1] = 2;
    ptr[2] = 3;
    return ptr;
}
