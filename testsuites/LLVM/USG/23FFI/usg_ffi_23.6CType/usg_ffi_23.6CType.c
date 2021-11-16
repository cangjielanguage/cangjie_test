typedef struct {
    long long x;
    long long y;
    long long z;
} MyStruct;

MyStruct PassStructToC(MyStruct p)
{
    printf("get from CJ record: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    p.x = 5;
    p.y = 6;
    p.z = 7;
    printf("change CJ record: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    return p;
}
