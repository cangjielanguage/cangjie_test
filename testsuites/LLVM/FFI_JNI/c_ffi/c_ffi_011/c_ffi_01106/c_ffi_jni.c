#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern int32_t testfunc(int32_t (*a)(int32_t, int32_t)) {
    int32_t res = a(1, 2);
    return res;
}
