/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20044.cj main_20044.cj
// (CJNATIVE) EXEC: %compiler %cmp_macro define_20044.cj
// (CJNATIVE) EXEC: %compiler %f  %cmp_macro
// (CJNATIVE) EXEC: %compiler %cmp_opt  main_20044.cj -o %output

// (not CJNATIVE) EXEC: %compiler %cmp_macro define_20044.cj
// (not CJNATIVE) EXEC: %compiler %cmp_opt %f %macro_opt
// (not CJNATIVE) EXEC: %compiler %cmp_opt main_20044.cj -o %output

// RUN-EXEC: %run %run_opt %output %run_args

macro package use

import std.ast.*
import define_20044.*

public macro Y(attr: Tokens, input: Tokens): Tokens {
    match (1) {
        case _ => return @X[quote(0)](123)
    }
    return quote(1)
}
