#include<stdio.h>
unsigned int ArrayFunc(unsigned int arr[])
{
    arr[0] += 1;
    return arr[0];
}

unsigned int *ReturnArray()
{
    unsigned int* p = (unsigned int*)malloc(1 * sizeof(unsigned int));
    p[0] = 1;
    return p;
}
