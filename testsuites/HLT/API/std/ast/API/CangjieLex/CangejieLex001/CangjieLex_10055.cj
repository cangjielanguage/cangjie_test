/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:../utils.cj
// ERRCHECK: %compiler %cmp_opt %f utils.cj %use_ast -o %output

import std.ast.*

main(){
    var a : Tokens = cangjieLex("#")
    var b : Tokens = quote(#)
    return check(a,b)
}
// ASSERT: scan lex_expected_quote_in_raw_string
