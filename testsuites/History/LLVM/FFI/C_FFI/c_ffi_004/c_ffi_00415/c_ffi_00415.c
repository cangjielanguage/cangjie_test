_Bool ArrayFunc(_Bool arr[])
{
    arr[0] = 1;
    return arr[0];
}

_Bool *ReturnArray()
{
    _Bool* p = (_Bool*)malloc(1 * sizeof(_Bool));
    p[0] = 0;
    return p;
}
