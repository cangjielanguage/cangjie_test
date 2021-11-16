#include <cstdint>
#include <cstdio>
#include <string.h>

extern "C" {

char* testfunc(char* input) {
    char* b = "World\n";
    char* temp = input;
    while (*temp != '\0') temp++;
    while ((*temp++ = *b++) != '\0');
    return input;
}
void fflushOut(){
    fflush(stdout);
}
}