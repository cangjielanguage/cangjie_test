#include <stdio.h>
typedef struct {
    long long a;
    long long b;
    long long c;
    long long d[];
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct in)
{
    in.a += 1;
    in.b += 1;
    in.c += 1;
    in.d[0] = 1;
    return in;
}
