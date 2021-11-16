#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern int8_t testfunc(int8_t (*a)(int8_t, int8_t)) {
    int8_t res = a(-1, -2);
    return res;
}
