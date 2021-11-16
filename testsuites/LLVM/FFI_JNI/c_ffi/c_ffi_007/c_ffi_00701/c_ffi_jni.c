#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

void* testfunc() {
    int* ptr = (int*)malloc(sizeof(int) * 2);
    ptr[0] = 1;
    ptr[1] = 2;
    return (void*)ptr;
}
