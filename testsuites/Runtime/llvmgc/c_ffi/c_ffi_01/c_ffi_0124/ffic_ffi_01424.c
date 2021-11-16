#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

int8_t** testfunc(int8_t** ptr1) {
    ptr1[0][0] = -128;
    ptr1[0][1] = 0;
    ptr1[0][2] = 127;
    return ptr1;
}