#include<stdio.h>
long long ArrayFunc(long long arr[])
{
    arr[0] += 1;
    return arr[0];
}

long long *ReturnArray()
{
    long long *p = (long long *)malloc(1 * sizeof(long long));
    p[0] = 1;
    return p;
}
