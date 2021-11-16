#include <stdio.h>
typedef struct {
    long long a;
    long long b;
    long long c;
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct in)
{
    in.a += 1;
    in.b += 1;
    in.c += 1;
    return in;
}
