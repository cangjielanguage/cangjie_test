// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// TryIntrinsic must retain compile-time diagnostics for provably invalid indices.
// EXEC-PIPE-1: %compiler %enableO2 %disableConstPropagation %noColor -Woff unused %f -o %output 2>&1 | compare %f

func badRead(): Int64 {
    var row: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    let index = 6
    try { return row[index] } catch (_: IndexOutOfBoundsException) { return 0 }
}

func badWrite() {
    var row: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    let index = -1
    try { row[index] = 0 } catch (_: IndexOutOfBoundsException) {}
}

main() {
    badWrite()
    return badRead()
}

// ASSERT: scan array index 6 is past the end of array (which contains 5 elements)
// ASSERT: scan array index can not be negative
// ASSERT: scan 2 errors generated, 2 errors printed.
