#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern int64_t testfunc(int64_t (*a)(int64_t, int64_t)) {
    int64_t res = a(1, 2);
    return res;
}
