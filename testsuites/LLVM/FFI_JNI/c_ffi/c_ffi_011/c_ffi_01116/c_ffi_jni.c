#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern uint16_t testfunc(uint16_t (*a)(uint16_t, uint16_t)) {
    uint16_t res = a(65534, 1);
    return res;
}
