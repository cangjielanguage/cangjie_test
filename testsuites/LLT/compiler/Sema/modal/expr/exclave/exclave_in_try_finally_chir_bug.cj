// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output -Woff all 2>&1

func finallyExclave(_: Int @local!): String @local? {
    try {
        "ok"
    } catch (_) {
        "err"
    } finally {
        exclave {
            "cleanup"
        }
    }
}

main() {}
