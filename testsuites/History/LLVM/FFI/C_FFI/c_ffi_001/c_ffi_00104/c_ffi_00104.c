typedef struct {
    const long long a;
    const long long b;
    long long c;
    long long d;
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct in)
{
    in.c = in.c + 1;
    in.d = in.d + 1;
    return in;
}