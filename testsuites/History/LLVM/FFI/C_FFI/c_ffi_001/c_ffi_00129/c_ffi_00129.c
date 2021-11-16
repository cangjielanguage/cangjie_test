typedef struct {
    long long a;
} BiggerStruct;

BiggerStruct* PassToCBigger(BiggerStruct* in)
{
    in->a = in->a + 1;
    return in;
}
