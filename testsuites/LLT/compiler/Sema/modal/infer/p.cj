// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %frontendCompiler %f
class C {
    init() {}
    exclave init(this @local!) {}
}

func foo(c: C@local!) {

}

func bar() {
    let _ = { x => foo(x) }
    { x => foo(x) }
}

main() {
    bar()
    0
}