// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Saturating overflow clamps. Wrapping overflow keeps the computed result.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


@OverflowSaturating
func sat(): Int64 {
    let s: Int8 = 100 + 100
    let u: UInt8 = 200 + 200
    return Int64(s) + Int64(u)
}

@OverflowWrapping
func wrap(): Int64 {
    let s: Int8 = 100 + 100
    return Int64(s)
}

main() {
    return sat() + wrap()
}

// ASSERT: regex Int8 = Constant\(127i\) // loc: "SatWrap.cj"-15-19
// ASSERT: regex-not Add\(.*// loc: "SatWrap.cj"-15-19
// ASSERT: regex UInt8 = Constant\(255u\) // loc: "SatWrap.cj"-16-20
// ASSERT: regex-not Add\(.*// loc: "SatWrap.cj"-16-20
// ASSERT: regex Int8 = Constant\(200i\) // loc: "SatWrap.cj"-22-19
// ASSERT: regex-not Add\(.*// loc: "SatWrap.cj"-22-19
