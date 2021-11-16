typedef struct {
    long long a;
    long long b;
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct in)
{
    in.a = in.a + 1;
    in.b = in.b + 1;
    return in;
}
