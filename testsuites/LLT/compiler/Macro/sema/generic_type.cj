// DEPENDENCE: define.cj %n.expect
// EXEC: %compiler %cmp_macro define.cj
// EXEC-1: %run_macro %compiler %cmp_opt  %f -o %output 2> %n.txt
// EXEC: %diff %n.expect %n.txt

import define.*

open class A<F, H> {}

extend<F, H> A<F, H> {
    static func f3(a: F, b: H) {
    }
}

class B<K> <: A<K, K> {}

main(): Unit {
    @Bf3(B)
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

