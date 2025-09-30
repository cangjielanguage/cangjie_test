/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 15263
// ASSERT: scan-not 4

func test() {
    try {
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        } finally {
            print(1);
            return 1
        }
    } catch (_) {
        print(5)
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        } finally {
            print(2);
            return 5
        }
    } finally {
        print(6)
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        } finally {
            print(3);
            return 10
        }
        print(4);
    }
}

main() {
    var res = test()
    print("success")
    return res - 10
}
