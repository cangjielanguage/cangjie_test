#include<stdio.h>
unsigned short ArrayFunc(unsigned short arr[])
{
    arr[0] += 1;
    return arr[0];
}

unsigned short *ReturnArray()
{
    unsigned short* p = (unsigned short*)malloc(1 * sizeof(unsigned short));
    p[0] = 1;
    return p;
}
