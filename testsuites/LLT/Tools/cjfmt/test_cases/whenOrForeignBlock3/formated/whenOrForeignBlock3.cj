// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

@CallingConv[CDECL]
foreign {
    func foo3(): Unit

    func foo4(): Unit
}

@CallingConv[STDCALL]
foreign {
    func foo5(): Unit

    func foo6(): Unit
}
