#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* my_strcat(char* dest, const char* src)
{
    char* n = dest;
    while(*n) ++n;
    while(*n++ = *src++);
    return dest;
}

char* cstrfunc(char* a) {
    char* c = (char*)malloc(sizeof(char)*30);
    memset(c, 0, 30);
    char* b = " world";
    my_strcat(c, a);
    my_strcat(c, b);
    return c;
}

char* getcstr() {
    char* a = "hello";
    char* c = (char*)malloc(sizeof(char)*30);
    memset(c, 0, 30);
    my_strcat(c, a);
    return c;
}

int main()
{
    char *c = getcstr();
    c = cstrfunc(c);
    printf("cstringfunc: %s \n", c);
    return 0;
}
