#include <cstdint>
#include <cstdio>

extern "C" {

uint64_t testfunc(uint64_t a, uint64_t b) {
    return a - b;
}

}