#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

void* testfunc() {
    int* ptr = (int*)malloc(sizeof(int) * 2);
    ptr[0] = 1;
    ptr[1] = 2;
    return (void*)ptr;
}

}