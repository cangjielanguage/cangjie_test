/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC-PIPE: rm -rf dir;mkdir dir
// (Windows) EXEC-PIPE: mkdir dir
// EXEC-PIPE: %compiler %cmp_opt %compile_dylib_opt %f --output-dir ./dir
// (CJNATIVE) EXEC-PIPE: %ls dir/lib%n.%test_suffix dir/default.cjo
// (not CJNATIVE) EXEC-PIPE: %ls dir/%n.%dylib_suffix dir/default.cjo

func test() {
    return 0
}
