#include<stdio.h>
int ArrayFunc(int arr[])
{
    arr[0] += 1;
    return arr[0];
}

int *ReturnArray()
{
    int* p = (int*)malloc(1 * sizeof(int));
    p[0] = 1;
    return p;
}
