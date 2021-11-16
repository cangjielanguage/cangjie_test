#include <cstdint>
#include <cstdio>
#include <string.h>

extern "C" {

char* testfunc(char* a, char* b, char* c, int num1, int num2) {
    if (num1 > num2)
    {
        char *ret = a;  //[3]
        while ((*a++=*b++)!='\0'); //[4]
        return ret;
    } else {
        return c;
    }

    return a;
}

}