/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../mod1
// (CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p2 -o pB.o %compile_lib_opt
// (CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p1 -o pA.o %compile_lib_opt
// (CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src -o ./ pA.o pB.o

// (not CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p2 -o pB.bc %compile_lib_opt
// (not CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p1 -o pA.bc %compile_lib_opt
// (not CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src -o ./ pB.bc pA.bc

// (JS) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p2 -o p2.js %compile_lib_opt
// (JS) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p1 -o p1.js %compile_lib_opt
// (JS) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src
// RUN-EXEC: %run_pkg %run_opt %main %run_args

package d

import p1.*

main(): Int64 {
    var a = a1
    var b = a
    return 0
}
