#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern uint8_t testfunc(uint8_t (*a)(uint8_t, uint8_t)) {
    uint8_t res = a(255, 0);
    return res;
}
