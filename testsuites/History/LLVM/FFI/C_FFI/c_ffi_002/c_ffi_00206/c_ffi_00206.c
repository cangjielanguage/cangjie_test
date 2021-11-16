#include<stdio.h>
typedef char*(*compare)(char*);
char* Max(char* x) {
    x = "c";
    return x;
};

compare GetMaxFuncPtr()
{
    char* (*ret)(char*) = &Max;
    return ret;
}

