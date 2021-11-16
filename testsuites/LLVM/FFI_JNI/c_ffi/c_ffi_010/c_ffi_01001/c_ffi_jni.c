#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int8_t ctypefunc(int8_t a) {
    a = a * 2;
    return a;
}

int main()
{
    int8_t a = ctypefunc(8);
    printf("ctypefunc: %d \n", a);

    return 0;
}
