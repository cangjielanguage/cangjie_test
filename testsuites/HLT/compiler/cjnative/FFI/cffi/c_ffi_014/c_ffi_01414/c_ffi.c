/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int64_t func1(int64_t a, int64_t b)
{
    return a + b;
}

int64_t func2(int64_t a, int64_t b)
{
    return a + b + 20;
}

typedef struct {
    int8_t i8;
    int64_t (*testfunc)(int64_t a, int64_t b);
} teststruct;

teststruct testfunc1()
{
    teststruct cjstruct;
    cjstruct.i8 = 20;
    cjstruct.testfunc = func1;
    return cjstruct;
}

teststruct testfunc2(teststruct ts)
{
    if ((ts.i8 == 30) && (ts.testfunc(10, 20) == 40)) {
        ts.i8 += 10;
        ts.testfunc = func2;
    }

    return ts;
}
