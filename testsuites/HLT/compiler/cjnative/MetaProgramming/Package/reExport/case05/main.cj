/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj common.cj
// EXEC: %compiler %compile_lib_opt common.cj -o common1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt common.cj -o common2.%middle
// EXEC: %compiler %cmp_macro define.cj common1.%middle
// EXEC: %compiler %cmp_opt %f common2.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import M.*

main() {
    var a = @M1()
    return a - 1
}
