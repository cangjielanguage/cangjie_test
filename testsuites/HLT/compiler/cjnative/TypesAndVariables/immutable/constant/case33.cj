/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
class A {
    const A() {}
    const func test(a: Int16) {
        const c: Int16 = 1
        const b: Int16 = c
        return b
    }
}

main() {
    var a = A()
    var temp: Int16 = 1
    const c = a.test(temp)
    return a.test(1)
}
// ASSERT: scan sema_expect_const
