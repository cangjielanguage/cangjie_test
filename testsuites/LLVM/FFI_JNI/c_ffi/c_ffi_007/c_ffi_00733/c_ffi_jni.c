#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

int8_t* testfunc() {
    int8_t* ptr = (int8_t*)malloc(sizeof(int8_t) * 3);
    ptr[0] = 97;
    ptr[1] = 98;
    ptr[2] = 99;
    return ptr;
}
