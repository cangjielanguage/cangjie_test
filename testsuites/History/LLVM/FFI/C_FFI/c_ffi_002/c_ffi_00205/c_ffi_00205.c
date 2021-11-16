typedef int(*compare)(int, int);
int Max(int x, int y) {return x > y ? x : y;}
int Min(int x, int y) {return x < y ? x : y;}

compare GetMaxFuncPtr()
{
    int (*ret)(int, int) = &Max;
    return ret;
}

compare GetMinFuncPtr()
{
    int (*ret)(int, int) = &Min;
    return ret;
}

