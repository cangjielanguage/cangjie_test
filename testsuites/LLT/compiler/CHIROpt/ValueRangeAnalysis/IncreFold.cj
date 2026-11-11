// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Incremental compilation turns on effect-map recording. A readonly integer or bool
// global, a local tuple field, and a cast of that global are single values, so range
// propagation rewrites them and records the global load.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --incremental-compile --experimental --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f

let fixed: Int64 = 7
let flag: Bool = true

func useLoad(): Int64 {
    return fixed
}

func useFlag(): Bool {
    return flag
}

func useLocalTuple(): Int64 {
    let t = (8, 9)
    return t[0]
}

func useCast(): Int32 {
    return Int32(fixed)
}

main() {
    return useLoad() + (if (useFlag()) { 1 } else { 0 }) + useLocalTuple() + Int64(useCast())
}

// ASSERT: regex Int64 = Constant\(7i\) // loc: "IncreFold.cj"-18-12
// ASSERT: regex-not Load\(.*// loc: "IncreFold.cj"-18-12
// ASSERT: regex Bool = Constant\(true\) // loc: "IncreFold.cj"-22-12
// ASSERT: regex-not Load\(.*// loc: "IncreFold.cj"-22-12
// ASSERT: regex Int64 = Constant\(8i\) // loc: "IncreFold.cj"-27-12
// ASSERT: regex-not Field\(.*// loc: "IncreFold.cj"-27-12
// ASSERT: regex Int32 = Constant\(7i\) // loc: "IncreFold.cj"-31-12
// ASSERT: regex-not NumericCast\(.*// loc: "IncreFold.cj"-31-12
