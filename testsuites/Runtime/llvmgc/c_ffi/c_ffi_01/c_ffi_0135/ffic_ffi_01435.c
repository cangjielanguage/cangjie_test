#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

double* testfunc(double* ptr) {
    ptr[0] = 3.14;
    ptr[1] = 0.0;
    ptr[2] = -3.14;
    return ptr;
}
