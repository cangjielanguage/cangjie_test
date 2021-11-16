#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

int8_t** testfunc() {
    int8_t* ptr = (int8_t*)malloc(sizeof(int8_t) * 3);
    int8_t** array = (int8_t**)malloc(sizeof(ptr) * 1);
    array[0] = ptr;
    array[0][0] = -128;
    array[0][1] = 0;
    array[0][2] = 127;
    return array;
}
