#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern uint32_t testfunc(uint32_t (*a)(uint32_t, uint32_t)) {
    uint32_t res = a(1, 2);
    return res;
}
