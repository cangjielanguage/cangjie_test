/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int16_t* ptrfunc(int16_t* p)
{
    int16_t* ptr = (int16_t*)malloc(sizeof(int16_t) * 3);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = *p;
    ptr[1] = 0;
    ptr[2] = 32767;
    return ptr;
}

int16_t* getptr()
{
    int16_t* ptr = (int16_t*)malloc(sizeof(int16_t) * 3);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = -32768;
    ptr[1] = 2;
    ptr[2] = 3;
    return ptr;
}

int main()
{
    int16_t b = -32768;
    int16_t* ptr = &b;
    ptr = ptrfunc(ptr);
    printf("ptrfunc:\n");
    printf("ptrfunc[0]: %d \n", ptr[0]);
    printf("ptrfunc[1]: %d \n", ptr[1]);
    printf("ptrfunc[2]: %d \n", ptr[2]);
    free(ptr);
    ptr = NULL;
    return 0;
}
