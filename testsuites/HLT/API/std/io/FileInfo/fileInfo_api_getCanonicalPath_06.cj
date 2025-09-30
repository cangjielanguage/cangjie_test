/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC-PIPE: rm -rf 测试目录/测试2/; mkdir -p 测试目录/测试2/
// (Windows) EXEC-PIPE: mkdir -p 测试目录/测试2/
// EXEC-PIPE: %touch 测试目录/测试2/test.txt
// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.io.*
import std.posix.*
import std.fs.*

@When[os != "Windows"]
main() {
    var path: String = "测试目录/测试2/test.txt"
    var curdir = getcwd()
    var exppath: String = curdir + "/测试目录/测试2/test.txt"
    var file: FileInfo = FileInfo(path)
    var result1 = canonicalize(file.path).toString()
    if (result1 != exppath) {
        return 1
    }
    return 0
}

@When[os == "Windows"]
main() {
    var path: String = "测试目录\\测试2\\test.txt"
    var curdir = getcwd()
    var exppath: String = curdir + "\\测试目录\\测试2\\test.txt"
    var file: FileInfo = FileInfo(path)
    var result1 = canonicalize(file.path).toString()
    if (result1 != exppath) {
        return 1
    }
    return 0
}
