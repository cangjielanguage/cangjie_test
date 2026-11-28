// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A readonly integer global is known. A mutable global and a class field are not.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


let fixed: Int64 = 7
var mutable: Int64 = 7
let text = "keep"
enum En { A | B }
let eg = En.A
class Box {
    var n: Int64 = 4
}
let box = Box()

func globals(): Int64 {
    let a = fixed == 7
    let b = mutable == 7
    let c = box.n == 4
    var acc = 0
    if (a) { acc = acc + 1 }
    if (b) { acc = acc + 1 }
    if (c) { acc = acc + 1 }
    return acc
}

main() {
    return globals()
}

// ASSERT: regex Bool = Constant\(true\) // loc: "GlobalKeep.cj"-24-13
// ASSERT: regex-not Equal\(.*// loc: "GlobalKeep.cj"-24-13
// ASSERT: regex Equal\(.*// loc: "GlobalKeep.cj"-25-13
// ASSERT: regex Equal\(.*// loc: "GlobalKeep.cj"-26-13
