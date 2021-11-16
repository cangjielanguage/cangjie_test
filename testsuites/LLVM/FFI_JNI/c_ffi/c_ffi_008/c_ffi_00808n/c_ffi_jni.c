#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

bool* testfunc() {
    bool* ptr = (bool*)malloc(sizeof(bool) * 2);
    ptr[0] = true;
    ptr[1] = false;
    return ptr;
}
