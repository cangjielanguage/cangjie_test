// DEPENDENCE: define.cj %n.expect
// EXEC: %compiler %cmp_macro define.cj
// EXEC-1: %run_macro %compiler %cmp_opt  %f -o %output 2> %n.txt
// EXEC: %diff %n.expect %n.txt

import define.*

@FooGeneric
func foo<T>(a: T) {
    bar<Int64>(1)
    a
}

func bar<T>(a: T) {
    baz(foo<Int64>(1)) // Use unknown as function call
    a
}

func baz<T>(a: T): T {
    a
}

main() {}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

