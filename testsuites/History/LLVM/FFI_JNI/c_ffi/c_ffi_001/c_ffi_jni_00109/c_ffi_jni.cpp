#include <cstdint>
#include <cstdio>

extern "C" {

uint32_t testfunc(uint32_t a, uint32_t b) {
    return a - b;
}

}