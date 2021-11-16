#include <stdlib.h>
typedef struct{
    long long a;
}MyStruct;

MyStruct* AllocCStruct()
{
    MyStruct* p = malloc(sizeof(MyStruct));
    return p;
}


typedef MyStruct*(*compare)(MyStruct*);
MyStruct* Max(MyStruct* x) {
    x->a = x->a + 1;
    return x;
};

compare GetMaxFuncPtr()
{
    MyStruct* (*ret)(MyStruct*) = &Max;
    return ret;
}

