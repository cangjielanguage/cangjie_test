// DEPENDENCE: define.cj %n.expect.out
// EXEC: %compiler %cmp_macro define.cj
// EXEC-1: %run_macro %compiler %cmp_opt  %f -o %output > %n.%realOut 2>&1
// EXEC: %diff %n.expect.out %n.%realOut

import view.*

enum Eb1 {
    | Red
    | Red(Int64)
    | Red(Int64, Int64)

    @AA2
    func gggsss() {}
}

main() {}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

