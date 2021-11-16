#include<stdio.h>
unsigned char ArrayFunc(unsigned char arr[])
{
    arr[0] += 1;
    return arr[0];
}

unsigned char *ReturnArray()
{
    unsigned char* p = (unsigned char*)malloc(1 * sizeof(unsigned char));
    p[0] = 1;
    return p;
}
