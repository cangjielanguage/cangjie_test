typedef struct {
    short a:8;
} BiggerStruct;

BiggerStruct* PassToCBigger(BiggerStruct* in)
{
    in->a = in->a + 1;
    return in;
}
