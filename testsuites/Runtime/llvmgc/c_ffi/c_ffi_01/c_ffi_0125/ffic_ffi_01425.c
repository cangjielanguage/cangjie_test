#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

char* str[] = {"cang2", "jie2"};

char** testfunc(char** ptr, int len) {
    for (int i = 0; i < len; i++) {
        ptr[i] = str[i];
    }
    return ptr;
}