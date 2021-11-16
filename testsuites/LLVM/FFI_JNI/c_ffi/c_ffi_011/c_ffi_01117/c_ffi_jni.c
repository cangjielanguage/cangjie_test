#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern int32_t testfunc(int32_t (*a)(int32_t, int32_t)) {
    int32_t res = a(-2147483647, -1);
    return res;
}
