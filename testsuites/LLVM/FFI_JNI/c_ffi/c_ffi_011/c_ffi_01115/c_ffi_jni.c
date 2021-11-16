#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern int16_t testfunc(int16_t (*a)(int16_t, int16_t)) {
    int16_t res = a(-32768, 0);
    return res;
}
