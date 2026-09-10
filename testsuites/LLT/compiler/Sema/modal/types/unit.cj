// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %diag_json %f 2>&1
func f(): Unit @local! {
    let a: Int64 @local! = 0
}
func bar(): Unit @local! {
    exclave {
        let b: Int64@local! = 0
    }
}
main() {
    f()
    bar()
    0
}
// ASSERT: scan-1 "DiagKind": "sema_exclave_invalid_func_signature",
// ASSERT: scan "Errors": 1,