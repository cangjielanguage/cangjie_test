#include<stdio.h>
unsigned long long ArrayFunc(unsigned long long arr[])
{
    arr[0] += 1;
    return arr[0];
}

unsigned long long *ReturnArray()
{
    unsigned long long *p = (unsigned long long *)malloc(1 * sizeof(unsigned long long));
    p[0] = 1;
    return p;
}
