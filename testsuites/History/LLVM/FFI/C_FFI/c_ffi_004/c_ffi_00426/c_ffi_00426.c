#include<stdio.h>
double ArrayFunc(double arr[])
{
    arr[0] += 0.1;
    return arr[0];
}

double *ReturnArray()
{
    double *p = (double *)malloc(1 * sizeof(double));
    p[0] = 0.1;
    return p;
}
