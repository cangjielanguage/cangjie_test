// DEPENDENCE: define.cj %n.expect
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output 2> %n.txt
// EXEC: %diff %n.expect %n.txt
import define.*

main() {
    @MatchSome
    let x = 1
    x
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

