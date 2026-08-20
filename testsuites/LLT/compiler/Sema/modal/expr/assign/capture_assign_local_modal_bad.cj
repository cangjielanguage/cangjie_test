// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %f -Woff all %diag_json 2>&1

class NC {
    init() {}
    init(this @local!) { exclave { } }
}

func outer() {
    var x: NC@local! = NC()
    func inner() {
        x
    }
}

main() {}

// ASSERT: scan-1 "DiagKind": "sema_bad_capture_local",
// ASSERT: scan "Errors": 1,
