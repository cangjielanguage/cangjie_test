// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Unknown values of every integer width stay additions.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func widths(a: Int8, b: Int16, c: Int32, d: Int64, e: UInt8, f: UInt16, g: UInt32, h: UInt64, i: IntNative, j: UIntNative): Int64 {
    return Int64(a + 1) + Int64(b + 1) + Int64(c + 1) + (d + 1) + Int64(e + 1) + Int64(f + 1) + Int64(g + 1) + Int64(h + 1) + Int64(i + 1) + Int64(j + 1)
}

main() {
    return widths(1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
}

// ASSERT: regex Int8 = Add\(
// ASSERT: regex Int16 = Add\(
// ASSERT: regex Int32 = Add\(
// ASSERT: regex Int64 = Add\(
// ASSERT: regex UInt8 = Add\(
// ASSERT: regex UInt16 = Add\(
// ASSERT: regex UInt32 = Add\(
// ASSERT: regex UInt64 = Add\(
// ASSERT: regex IntNative = Add\(
// ASSERT: regex UIntNative = Add\(
