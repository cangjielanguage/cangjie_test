/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_20006.cj main_20006.cj

// (CJNATIVE) EXEC: %compiler %cmp_macro macro_define_20006.cj
// (CJNATIVE) EXEC: %compiler %f %cmp_macro
// (CJNATIVE) ERRCHECK: %compiler %cmp_opt  main_20006.cj -o %output

// (not CJNATIVE) EXEC: %compiler %cmp_macro macro_define_20006.cj
// (not CJNATIVE) EXEC: %compiler %f %macro_opt
// (not CJNATIVE) ERRCHECK: %compiler %cmp_opt main_20006.cj -o %output

macro package test

import std.ast.*

public macro x(input: Tokens) {
    input
}
// ASSERT: scan macro_ambiguous_match
