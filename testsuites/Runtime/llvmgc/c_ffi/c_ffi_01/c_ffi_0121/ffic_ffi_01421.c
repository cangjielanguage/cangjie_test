#include <stdlib.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>

void* MallocWithZero(size_t size)
{
    if (size == 0) {
        return NULL;
    }
    void* ptr = malloc(size);
    if (ptr == NULL) {
        return NULL;
    }
    if (memset_s(ptr, size, 0, size) != 0) {
        return NULL;
    }
    return ptr;
}
