#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

static int8_t testfunc(int8_t a, int8_t b);

int8_t foo(){
    return 0;
}

int8_t testfunc(int8_t a, int8_t b){
    int8_t c = a + b;
    return c;
}
