// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Value<T> {
    func value(): T

    func defaultValue(): T {
        value()
    }

    mut func mutValue(): T {
        value()
    }

    prop b: Int64 {
        get() {
            1
        }
    }
}

extend Int16 <: Value<Int64> {
    public func value(): Int64 {
        Int64(this)
    }
}

extend Unit <: Value<Int64> {
    public func value(): Int64 {
        42
    }
}

struct S <: Value<Int64> {
    public func value(): Int64 {
        7
    }
}

main() {
    var i: Value<Int64> = Int16(10)
    var u: Value<Int64> = ()
    var s: Value<Int64> = S()
    if (i.value() != 10 || i.defaultValue() != 10 || i.mutValue() != 10 || i.b != 1) {
        return 1
    }
    if (u.value() != 42 || u.defaultValue() != 42 || u.mutValue() != 42 || u.b != 1) {
        return 2
    }
    if (s.value() != 7 || s.defaultValue() != 7 || s.mutValue() != 7 || s.b != 1) {
        return 3
    }
    return 0
}
