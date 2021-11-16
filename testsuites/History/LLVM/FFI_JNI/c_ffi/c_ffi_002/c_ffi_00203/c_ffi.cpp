#include <cstdint>
#include <cstdio>

extern "C" {

char* testfunc(char* a, char* b) {
    char* temp = a;
    while (*temp != '\0') temp++;
    while ((*temp++ = *b++) != '\0');

    return a;
}

}