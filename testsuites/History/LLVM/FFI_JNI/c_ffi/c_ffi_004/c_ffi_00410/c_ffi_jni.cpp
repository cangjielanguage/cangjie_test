#include <algorithm>
#include <cstdint>
#include <cstdio>

extern "C" {

bool* testfunc() {
    bool* ptr = (bool*)malloc(sizeof(bool) * 2);
    ptr[0] = true;
    ptr[1] = false;
    return ptr;
}

}