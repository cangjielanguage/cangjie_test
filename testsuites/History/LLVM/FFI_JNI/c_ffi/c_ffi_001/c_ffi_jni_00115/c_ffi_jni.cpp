#include <cstdint>
#include <cstdio>

extern "C" {

int64_t testfunc1(int64_t a, int64_t b) {
    return a - b;
}

int64_t testfunc2(int64_t a, int64_t b) {
    return a + b;
}

}