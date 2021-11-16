#include<stdio.h>
signed char ArrayFunc(signed char arr[])
{
    arr[0] += 1;
    return arr[0];
}

signed char *ReturnArray()
{
    signed char* p = (signed char*)malloc(1 * sizeof(signed char));
    p[0] = 1;
    return p;
}
