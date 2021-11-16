#include <stdlib.h>
typedef struct {
long long x;
long long y;
long long z;
} Point3D;

Point3D addPoint(Point3D p1, Point3D p2);

void* malloc1(size_t size)
{
    return malloc(size);
}
