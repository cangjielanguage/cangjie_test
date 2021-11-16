#include <cstdint>
#include <cstdio>

extern "C" {

double testfunc(int64_t a, double b) {
    return a / b;
}

}