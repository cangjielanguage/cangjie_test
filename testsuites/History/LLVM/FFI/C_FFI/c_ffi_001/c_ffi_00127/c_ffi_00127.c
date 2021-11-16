typedef struct {
    long long a;
    long long b;
    long long c;
} BiggerStruct;

BiggerStruct* PassToCBigger(BiggerStruct* in)
{
    in->a = in->a + 1;
    in->b = in->b + 1;
    in->c = in->c + 1;
    return in;
}
