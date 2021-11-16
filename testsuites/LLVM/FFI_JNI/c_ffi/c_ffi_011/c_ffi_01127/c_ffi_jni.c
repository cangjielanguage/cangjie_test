#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int8_t* get_cptr(int8_t*(*ptr)(int8_t*) ){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    ptrtmp[0] = 48;
    ptrtmp[1] = 48;
    ptrtmp[2] = 48;
    printf("ptrtmp: %s\n", ptrtmp);
    int8_t* res = ptr(ptrtmp);
    printf("res: %s\n", res);
    return res;
}
