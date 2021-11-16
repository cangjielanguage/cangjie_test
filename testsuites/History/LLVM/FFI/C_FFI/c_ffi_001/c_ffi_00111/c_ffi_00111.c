#include <stdio.h>

typedef struct {
    long long a;
    long long b;
    long long c;
    char *d;
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct in)
{
    printf("%s,\n", in.d);
    in.a += 1;
    in.b += 1;
    in.c += 1;
    in.d = "ddd";
    return in;
}
