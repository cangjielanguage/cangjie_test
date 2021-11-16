#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern double testfunc(double (*a)(double, double)) {
    double res = a(1.0, 100000.0);
    return res;
}
