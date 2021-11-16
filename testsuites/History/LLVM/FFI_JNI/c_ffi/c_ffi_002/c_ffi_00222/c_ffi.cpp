#include <cstdint>
#include <cstdio>
#include <string.h>

extern "C" {

void testfunc(char* a, char* b) {
    char *ret = a;  //[3]
    while ((*a++=*b++)!='\0'); //[4]
    printf("%s", ret);
}
void fflushOut(){
    fflush(stdout);
}
}