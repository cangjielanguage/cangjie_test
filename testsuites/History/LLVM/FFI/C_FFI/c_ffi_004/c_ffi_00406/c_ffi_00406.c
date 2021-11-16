int ArrayFunc(int arr[])
{
    return arr;
}

int *ReturnArray()
{
    int* p = (int*)malloc(5 * sizeof(int));
    p[5 - 1] = 5;
    return p;
}
