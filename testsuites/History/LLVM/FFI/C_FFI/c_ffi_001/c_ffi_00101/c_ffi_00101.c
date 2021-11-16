typedef struct {
    long long x;
    long long y;
    long long z;
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct in)
{
    int times = 2;
    in.x = in.x * times;
    in.y = in.y * times;
    in.z = in.z * times;
    return in;
}
