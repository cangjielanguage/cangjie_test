#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

int16_t* testfunc() {
    int16_t* ptr = (int16_t*)malloc(sizeof(int16_t) * 3);
    ptr[0] = -32768;
    ptr[1] = 0;
    ptr[2] = 32767;
    return ptr;
}
