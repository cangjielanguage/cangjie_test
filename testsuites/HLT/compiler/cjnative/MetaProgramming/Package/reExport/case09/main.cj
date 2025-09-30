/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj ./mod1 common2.cj
// EXEC: %compiler %compile_lib_opt ./mod1/src/p1/*.cj  -o mod1/common1.%middle && ls
// EXEC: %compiler %compile_lib_opt common2.cj -o common2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./mod1/src/p1/*.cj  -o mod1/common1x.%middle && ls
// EXEC: %compiler %cmp_opt %compile_lib_opt common2.cj -o common2x.%middle
// EXEC: %compiler %cmp_macro define.cj mod1/common1.%middle common2.%middle
// EXEC: %compiler %cmp_opt %f -o %output mod1/common1x.%middle common2x.%middle
// RUN-EXEC: %run %run_opt %output %run_args

import M.*

main() {
    var a = @M1()
    return a
}
