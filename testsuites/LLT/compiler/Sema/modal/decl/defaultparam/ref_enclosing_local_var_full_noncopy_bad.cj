// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %f -Woff all %diag_json 2>&1

class C {
    init() {}
    exclave init(this @local!) {}
}

func outer() {
    let a: C @local! = exclave { C() }
    func inner(y!: C @local! = a) {
        println("ok")
    }
    inner()
}

main(): Int64 {
    outer()
    0
}

// ASSERT: scan "DiagKind": "sema_bad_capture_local",
// ASSERT: scan "Errors": 1,
