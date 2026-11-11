// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Known casts and unsigned adds fold. arr.size < 0 stays; the unsigned cast of that size is not < 0.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func knownCast(): Int64 {
    let n = Int32(3)
    let w = Int64(n)
    let u8 = UInt8(1) + UInt8(2)
    let u16 = UInt16(1) + UInt16(2)
    let u32 = UInt32(1) + UInt32(2)
    let i8: Int8 = 1 + 1
    let i16: Int16 = 1 + 1
    let arr = [1, 2, 3]
    var acc = w + Int64(u8) + Int64(u16) + Int64(u32) + Int64(i8) + Int64(i16)
    if (arr.size < 0) { acc = acc + 1 }
    if (UInt64(arr.size) < 0) { acc = acc + 1 }
    return acc
}

main() {
    return knownCast()
}

// ASSERT: regex Int64 = Constant\(3i\) // loc: "CastFold.cj"-15-13
// ASSERT: regex UInt8 = Constant\(3u\) // loc: "CastFold.cj"-16-14
// ASSERT: regex Int8 = Constant\(2i\) // loc: "CastFold.cj"-19-20
// ASSERT: regex LT\(.*// loc: "CastFold.cj"-23-9
// ASSERT: regex Bool = Constant\(false\) // loc: "CastFold.cj"-24-9
// ASSERT: regex-not LT\(.*// loc: "CastFold.cj"-24-9
