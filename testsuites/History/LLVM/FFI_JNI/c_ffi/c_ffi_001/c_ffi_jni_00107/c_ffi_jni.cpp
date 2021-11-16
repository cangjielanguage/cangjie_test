#include <cstdint>
#include <cstdio>

extern "C" {

uint16_t testfunc(uint16_t a, uint16_t b) {
    return a - b;
}

}