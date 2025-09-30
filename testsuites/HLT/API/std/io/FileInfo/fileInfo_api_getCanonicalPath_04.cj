/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC: rm -rf test08
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: mkdir -p test08 && %run %run_opt %output %run_args

import std.io.*
import std.posix.*
import std.fs.*

@When[os != "Windows"]
main() {
    var path: String = "test08"
    var curdir = getcwd()
    var exppath = curdir + "/test08"
    var file: FileInfo = FileInfo(path)
    var result = canonicalize(file.path).toString()
    if (result != exppath) {
        return 1
    }
    return 0
}

@When[os == "Windows"]
main() {
    var path: String = "test08"
    var curdir = getcwd()
    var exppath = curdir + "\\test08"
    var file: FileInfo = FileInfo(path)
    var result = canonicalize(file.path).toString()
    if (result != exppath) {
        return 1
    }
    return 0
}
