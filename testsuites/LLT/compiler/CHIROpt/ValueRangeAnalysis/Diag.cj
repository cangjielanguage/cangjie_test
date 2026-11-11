// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Constant propagation is off, so these operands are not literals at the operator.
// Range analysis is what proves the single values and reports the errors.
// EXEC-PIPE-1: %compiler %enableO2 %disableConstPropagation %f -o %output -Woff unused 2>&1 | compare %f

main() {
    let x: Int8 = 50
    let y: Int8 = 60
    let z = x + y
    let w = z + z
    let zero = 1 - 1
    let d = 1 / zero
    let m = 1 % zero
    let uz: UInt8 = 0
    let ud = UInt8(1) / uz
    let um = UInt8(1) % uz
    let p: Int8 = -128
    let q: Int8 = -1
    let r = p / q
    let u: UInt8 = 200
    let v = u + u
    return Int64(w) + d + m + Int64(ud) + Int64(um) + Int64(r) + Int64(v)
}

// ASSERT: scan operation 'Int8(110) + Int8(110)' would overflow
// ASSERT: scan operation 'Int8(-128) / Int8(-1)' would overflow
// ASSERT: scan operation 'UInt8(200) + UInt8(200)' would overflow
// ASSERT: scan divide by zero
// ASSERT: scan modulo by zero
// ASSERT: scan range of Int8 is -128 ~ 127
// ASSERT: scan range of UInt8 is 0 ~ 255
// ASSERT: scan 7 errors generated, 7 errors printed.
