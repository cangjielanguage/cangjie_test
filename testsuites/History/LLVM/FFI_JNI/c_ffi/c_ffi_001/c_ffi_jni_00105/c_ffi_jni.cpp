#include <cstdint>
#include <cstdio>

extern "C" {

uint8_t testfunc(uint8_t a) {
    return a + 128;
}

}