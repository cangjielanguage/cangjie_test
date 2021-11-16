#include <cstdint>
#include <cstdio>
#include <string.h>

extern "C" {

char* testfunc(char* a) {
    char* b = " World by cangjie\n";
    char* temp = a;
    while (*temp != '\0') temp++;
    while ((*temp++ = *b++) != '\0');
    return a;
}

}