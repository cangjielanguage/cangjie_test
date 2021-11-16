typedef struct{
    long long a;
    long long b;
    long long c;
}MyStruct;

typedef MyStruct(*compare)(MyStruct);
MyStruct Max(MyStruct x) {
    x.a = x.a + 1;
    x.b = x.b + 1;
    x.c = x.c + 1;
    return x;
};

compare GetMaxFuncPtr()
{
    MyStruct (*ret)(MyStruct) = &Max;
    return ret;
}

