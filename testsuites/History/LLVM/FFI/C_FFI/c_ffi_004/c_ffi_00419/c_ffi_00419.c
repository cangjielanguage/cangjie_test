#include<stdio.h>
short ArrayFunc(short arr[])
{
    arr[0] += 1;
    return arr[0];
}

short *ReturnArray()
{
    short* p = (short*)malloc(1 * sizeof(short));
    p[0] = 1;
    return p;
}
