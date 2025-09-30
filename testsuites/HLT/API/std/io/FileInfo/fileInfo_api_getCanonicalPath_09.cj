/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC-PIPE:rm -rf test/path; mkdir -p test/path
// (Windows) EXEC-PIPE:mkdir -p test/path
// EXEC-PIPE:%touch test/path/test.txt
// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.io.*
import std.posix.*
import std.fs.*

@When[os != "Windows"]
main() {
    var path: String = "test/./path/test.txt"
    var curdir = getcwd()
    var exppath: String = curdir + "/test/path/test.txt"
    var dir1: FileInfo = FileInfo(path)
    var result = canonicalize(dir1.path).toString()
    if (result != exppath) {
        return 1
    }
    return 0
}

@When[os == "Windows"]
main() {
    var path: String = "test\\.\\path\\test.txt"
    var curdir = getcwd()
    var exppath: String = curdir + "\\test\\path\\test.txt"
    var dir1: FileInfo = FileInfo(path)
    var result = canonicalize(dir1.path).toString()
    if (result != exppath) {
        return 1
    }
    return 0
}
