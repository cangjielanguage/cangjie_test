#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern float testfunc(float (*a)(float, float)) {
    float res = a(1.0, 100000.0);
    return res;
}
