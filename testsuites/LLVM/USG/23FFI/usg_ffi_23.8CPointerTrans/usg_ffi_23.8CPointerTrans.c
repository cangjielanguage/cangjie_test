#include <stdint.h>

int32_t* PassInt32PointerToCangjie() {
    int32_t* a = (int32_t*)malloc(sizeof(int32_t));
    *a = 2147483647;
    return a;
}

void GetInt32PointerFromCangjie(int32_t* a) {
    if (*a == 2147483647) {
        printf("Get from Cangjie pointer success. \n");
    }
    free(a);
}
