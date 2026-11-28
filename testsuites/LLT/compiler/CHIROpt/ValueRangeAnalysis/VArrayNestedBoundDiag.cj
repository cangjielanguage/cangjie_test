// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Range propagation must also check multidimensional accesses in TryIntrinsic.
// Keep this separate from one-dimensional errors, which stop compilation earlier.
// EXEC-PIPE-1: %compiler %enableO2 %disableConstPropagation %noColor -Woff unused %f -o %output 2>&1 | compare %f

main() {
    var row: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    var grid = VArray<VArray<Int64, $5>, $4>(repeat: row)
    let index = 6
    try { return grid[1][index] } catch (_: IndexOutOfBoundsException) { return 0 }
}

// ASSERT: scan error: array index is out of bounds
// ASSERT: scan however the size of varray is 5
// ASSERT: scan 1 error generated, 1 error printed.
