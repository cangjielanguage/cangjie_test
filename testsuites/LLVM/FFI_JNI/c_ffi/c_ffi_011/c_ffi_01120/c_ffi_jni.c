#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern uint64_t testfunc(uint64_t (*a)(uint64_t, uint64_t)) {
    uint64_t res = a(18446744073709400000, 100000);
    return res;
}
