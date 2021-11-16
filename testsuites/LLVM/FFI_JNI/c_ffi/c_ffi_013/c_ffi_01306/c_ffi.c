#include <stdint.h>
#include <stdio.h>
#include <string.h>

char* testfunc(char* a) {
    char* b = "World\n";
    char* temp = a;
    while (*temp != '\0') temp++;
    while ((*temp++ = *b++) != '\0');
    return a;
}
