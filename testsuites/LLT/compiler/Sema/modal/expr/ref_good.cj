// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class C {}
struct A<T> {}

type MM = C

func foo() {
    let a = C() @~local
    let b = MM() @~local
    let e = Int32(8) @local!
    let f = UInt8(e) @local!
    let g = Int64(f) @local?
    let h = Float32(g) @~local
}
main() {}
