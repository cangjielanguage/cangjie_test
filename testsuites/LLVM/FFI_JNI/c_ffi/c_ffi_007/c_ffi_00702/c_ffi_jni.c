#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

bool* testfunc() {
    bool* ptr = (bool*)malloc(sizeof(bool) * 3);
    ptr[0] = true;
    ptr[1] = false;
    ptr[2] = true;
    return ptr;
}
