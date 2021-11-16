#include <stdint.h>
#include <stdio.h>
#include <string.h>

char* my_strcat(char* dest, const char* src)
{
    char* n = dest;
    while(*n) ++n;
    while(*n++ = *src++);
    return dest;
}

char* testfunc(char* a) {
    char* b=" Jie\n";
    my_strcat(a, b);
    return a;
}
