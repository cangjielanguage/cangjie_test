// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Inside try, a cast or arithmetic that may throw stays a terminating try operation.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func inTry(a: Int64, b: Int8, c: Int8): Int64 {
    try {
        let x = Int8(a)
        let y = b + c
        let n = -b
        let d = b / c
        let m = b % c
        let s = b << c
        let sr = b >> c
        let sub = b - c
        let mul = b * c
        let e = a ** 2
        return Int64(x) + Int64(y) + Int64(n) + Int64(d) + Int64(m) + Int64(s) + Int64(sr) + Int64(sub) + Int64(mul) + e
    } catch (e: Exception) {
        return 0
    }
}

main() {
    return inTry(4, 2, 3)
}

// ASSERT: regex TryNumericCast\(.*// loc: "TryKeep.cj"-15-
// ASSERT: regex TryAdd\(.*// loc: "TryKeep.cj"-16-
// ASSERT: regex TryNeg\(.*// loc: "TryKeep.cj"-17-
// ASSERT: regex TryDiv\(.*// loc: "TryKeep.cj"-18-
// ASSERT: regex TryMod\(.*// loc: "TryKeep.cj"-19-
// ASSERT: regex TryLShift\(.*// loc: "TryKeep.cj"-20-
// ASSERT: regex TryRShift\(.*// loc: "TryKeep.cj"-21-
// ASSERT: regex TrySub\(.*// loc: "TryKeep.cj"-22-
// ASSERT: regex TryMul\(.*// loc: "TryKeep.cj"-23-
