typedef struct {
    long long a:4;
} BiggerStruct;

BiggerStruct* PassToCBigger(BiggerStruct* in)
{
    in->a = in->a + 1;
    return in;
}
