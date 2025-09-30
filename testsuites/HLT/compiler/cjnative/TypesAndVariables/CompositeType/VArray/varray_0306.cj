/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not CJNATIVE) EXEC-1: %compiler %cmp_opt %f -o %output

main(): Int64 {
    let a: Any = VArray<UInt8, $1>({i => 1})
    0
}
