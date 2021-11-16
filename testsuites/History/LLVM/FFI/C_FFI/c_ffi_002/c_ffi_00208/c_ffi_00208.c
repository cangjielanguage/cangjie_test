typedef int(*compare)(char*,signed char*,unsigned char*,
                        short*,unsigned short*,
                        int*,signed int*, unsigned int*,
                        long long*, unsigned long long*,
                        float*, double*, _Bool*, unsigned int*);

int Max(char* a,signed char* b,unsigned char* c,
         short* d,unsigned short* e,
         int* f,signed int* g, unsigned int* h,
         long long* i, unsigned long long* j,
         float* k, double* l, _Bool* m, unsigned int* n) {
    a += 1;
    b += 1;
    c += 1;
    d += 1;
    e += 1;
    f += 1;
    g += 1;
    h += 1;
    i += 1;
    j += 1;
    k += 1;
    l += 1;
    m += 1;
    n += 1;
    return 0;
};

compare GetMaxFuncPtr()
{
    int (*ret)(char*,signed char*,unsigned char*,
                          short*,unsigned short*,
                          int*,signed int*, unsigned int*,
                          long long*, unsigned long long*,
                          float*, double*, _Bool*, unsigned int*) = &Max;
    return ret;
}

