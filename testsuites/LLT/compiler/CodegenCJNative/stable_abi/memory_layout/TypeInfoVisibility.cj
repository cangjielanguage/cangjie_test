// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f

// A static GI typeInfo has no unique owning package: every package that uses the instantiation emits its own
// copy, so linkonce_odr must be kept for dedup at static link time. It is never imported across DSOs, hence it
// must be hidden: not in .dynsym, and in-DSO references stay non-preemptible.
// (not Windows and CJNATIVE) ASSERT: regex @"std.core:Array<Int64>\.ti" = linkonce_odr hidden global %TypeInfo
// (not Windows and CJNATIVE) ASSERT: regex @"Tuple<Int64,Int64>\.ti" = linkonce_odr hidden global %TypeInfo
// (not Windows and CJNATIVE) ASSERT: regex @"\(Int64\)->Int64\.ti" = linkonce_odr hidden global %TypeInfo
// (not Windows and CJNATIVE) ASSERT: regex @"CPointer<Int64>\.ti" = linkonce_odr hidden global %TypeInfo
// (not Windows and CJNATIVE) ASSERT: regex @"VArray<Int64,4>\.ti" = linkonce_odr hidden global %TypeInfo

// A concrete typeInfo has one owning package and is imported across DSOs: it must stay exported.
// (CJNATIVE) ASSERT: regex @"default:S\.ti" = global %TypeInfo
// (CJNATIVE) ASSERT: regex @"default:C\.ti" = global %TypeInfo

// An enum constructor typeInfo is linkonce_odr with cross-DSO importers: it must stay exported, too.
// (not Windows and CJNATIVE) ASSERT: regex @"default:E:0\.ti" = linkonce_odr global %TypeInfo
// (not Windows and CJNATIVE) ASSERT: regex @"default:E:1\.ti" = linkonce_odr global %TypeInfo

import std.reflect.*

public class C {
    public var x: Int64 = 0
}

public struct S {
    public var y: Int64 = 0
}

public enum E {
    | A
    | B(Int64)
}

public let va: VArray<Int64, $4> = [1, 2, 3, 4]

main() {
    let tis = [
        TypeInfo.of<Array<Int64>>(),
        TypeInfo.of<(Int64, Int64)>(),
        TypeInfo.of<(Int64) -> Int64>(),
        TypeInfo.of<CPointer<Int64>>(),
        TypeInfo.of<VArray<Int64, $4>>(),
        TypeInfo.of<C>(),
        TypeInfo.of<S>(),
        TypeInfo.of<E>()
    ]
    println(tis.size + va[0])
}
