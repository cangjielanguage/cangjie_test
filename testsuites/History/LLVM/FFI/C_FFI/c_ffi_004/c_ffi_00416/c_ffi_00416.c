#include<stdio.h>
unsigned int ArrayFunc(unsigned int arr[])
{
    arr[0] += 1;
    if (arr[0] == 66) {
        printf("pass\n");
    }
    return arr[0];
}

unsigned int *ReturnArray()
{
    unsigned int* p = (unsigned int*)malloc(1 * sizeof(unsigned int));
    p[0] = 65;
    return p;
}
