typedef struct {
    long long a;
    struct B {
        long long b;
        long long c;
    } b;
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct in)
{
    in.a += 1;
    in.b.b += 1;
    in.b.c += 1;
    return in;
}
