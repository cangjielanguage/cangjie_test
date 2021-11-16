#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

double* testfunc() {
    double* ptr = (double*)malloc(sizeof(double) * 3);
    ptr[0] = 3.1415926;
    ptr[1] = 0;
    ptr[2] = -3.1415926;
    return ptr;
}

}