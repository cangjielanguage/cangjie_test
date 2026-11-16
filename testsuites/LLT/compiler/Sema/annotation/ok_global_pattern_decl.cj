// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: the argument of a custom annotation on a destructuring declaration must be
// collected into the symbol table, otherwise resolving the annotation argument reports an internal
// error.
//
// The runtime reflection part is not checked here: this branch's CHIR does not attach AnnoInfo to
// the global variables flattened from a VarWithPatternDecl, so CodeGen generates no reflection
// metadata for their annotations. Backporting that attachment would introduce annotation factory
// functions and reflection metadata into the generated objects, which is an ABI compatibility
// change, so this case only guards the Sema phase.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

const K: Int64 = 42

@Annotation
public class Anno {
    public let x: Int64
    public const init(x: Int64) {
        this.x = x
    }
}

@Anno[K]
public let (a, b) = (1, 2)

main(): Int64 {
    if (a != 1 || b != 2) {
        return 1
    }
    return 0
}
