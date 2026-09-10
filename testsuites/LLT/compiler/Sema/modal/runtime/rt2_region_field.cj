// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args

// RT-2 复现：@local! 容器逐元素拷贝 @local! 元素触发 region 断言
// 实测：崩溃
//   field must reference heap object, current local object or null
//   CJNative Handle signal: 6.
package demo
import std.collection.*
import std.core.*

main(): Int64 {
    // @local! Array @local! 元素逐元素写入新 @local! Array
    let inner: Array<Int64> @local! = [1, 2]
    let copy: Array<Int64> @local! = Array<Int64>(2, repeat: 0)
    var i: Int64 = 0
    while (i < 2) {
        copy[i] = inner[i]   // 触发 region 断言崩溃
        i = i + 1
    }
    println("copy done")
    return 0
}
