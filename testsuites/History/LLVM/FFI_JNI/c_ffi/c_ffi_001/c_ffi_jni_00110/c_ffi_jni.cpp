#include <cstdint>
#include <cstdio>

extern "C" {

int64_t testfunc(int64_t a, int64_t b) {
    return a - b;
}

}