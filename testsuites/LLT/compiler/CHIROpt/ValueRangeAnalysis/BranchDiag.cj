// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Branch predicates must not turn parameter arithmetic into compile-time errors.
// The exceptional paths must still throw when they are reached at runtime.
// EXEC: %compiler %enableO2 --fno-chir-function-inlining -Woff unused %f -o %output
// EXEC: %run %run_opt %output %run_args

func signedAdd(a: Int8): Int8 {
    if (a == 100) {
        return a + a
    }
    return a
}

func signedDivOverflow(a: Int8): Int8 {
    if (a == -128) {
        return a / -1
    }
    return a
}

func signedDivZero(b: Int64): Int64 {
    if (b == 0) {
        return 1 / b
    }
    return b
}

func signedModZero(b: Int64): Int64 {
    if (b == 0) {
        return 1 % b
    }
    return b
}

func unsignedAdd(u: UInt8): UInt8 {
    if (u == 200) {
        return u + u
    }
    return u
}

func unsignedDivZero(u: UInt8): UInt8 {
    if (u == 0) {
        return 1 / u
    }
    return u
}

func unsignedModZero(u: UInt8): UInt8 {
    if (u == 0) {
        return 1 % u
    }
    return u
}

main() {
    let safe = Int64(signedAdd(1)) + Int64(signedDivOverflow(1)) + signedDivZero(1) + signedModZero(1) +
        Int64(unsignedAdd(1)) + Int64(unsignedDivZero(1)) + Int64(unsignedModZero(1))
    if (safe != 7) { return 1 }
    var caught = 0
    try { signedAdd(100) } catch (_: ArithmeticException) { caught += 1 }
    try { signedDivOverflow(-128) } catch (_: ArithmeticException) { caught += 1 }
    try { signedDivZero(0) } catch (_: ArithmeticException) { caught += 1 }
    try { signedModZero(0) } catch (_: ArithmeticException) { caught += 1 }
    try { unsignedAdd(200) } catch (_: ArithmeticException) { caught += 1 }
    try { unsignedDivZero(0) } catch (_: ArithmeticException) { caught += 1 }
    try { unsignedModZero(0) } catch (_: ArithmeticException) { caught += 1 }
    if (caught != 7) { return 2 }
    return 0
}
