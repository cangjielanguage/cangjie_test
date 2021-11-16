typedef struct {
    char c;
    signed char sc;
    unsigned char uc;
    short s;
    unsigned short us;
    int i;
    signed int si;
    unsigned int ui;
    long long ll;
    unsigned long long ull;
    float f;
    double d;
    _Bool b;
    unsigned int ui_1;
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct in)
{
    in.c = in.c + 1;
    in.sc = in.sc - 1;
    in.uc = in.uc + 1;
    in.s = in.s + 1;
    in.us = in.us + 1;
    in.i = in.i + 1;
    in.si = in.si + 1;
    in.ui = in.ui + 1;
    in.ll = in.ll + 1;
    in.ull = in.ull + 1;
    in.f = in.f + 1;
    in.d = in.d + 1;
    in.ui_1 = in.ui_1 + 1;
    in.b = !in.b;
    return in;
}