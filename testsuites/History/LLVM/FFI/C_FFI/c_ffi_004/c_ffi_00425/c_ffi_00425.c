#include<stdio.h>
float ArrayFunc(float arr[])
{
    arr[0] += 0.1;
    return arr[0];
}

float *ReturnArray()
{
    float *p = (float *)malloc(1 * sizeof(float));
    p[0] = 0.1;
    return p;
}
