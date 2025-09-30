/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows or OHOS) EXEC: rm -rf test/mydic/;rm -rf test/path/
// EXEC: %compiler %cmp_opt -o %output %f
// (not Windows or OHOS)RUN-EXEC: mkdir -p "test/mydic/" && mkdir -p "test/path/" && %touch "test/mydic/test.txt" && %run %run_opt %output %run_args
// (Windows and not OHOS)EXEC: mkdir -p test/mydic/ && mkdir test/path/ && %touch test/mydic/test.txt && %run %run_opt %output %run_args

import std.io.*
import std.posix.*
import std.fs.*

@When[os != "Windows"]
main() {
    var path: String = "test/path/../mydic/test.txt"
    var curdir = getcwd()
    var exppath: String = curdir + "/test/mydic/test.txt"
    var dir1: FileInfo = FileInfo(path)
    var result = canonicalize(dir1.path).toString()
    if (result != exppath) {
        return 1
    }
    return 0
}

@When[os == "Windows"]
main() {
    var path: String = "test\\path\\..\\mydic\\test.txt"
    var curdir = getcwd()
    var exppath: String = curdir + "\\test\\mydic\\test.txt"
    var dir1: FileInfo = FileInfo(path)
    var result = canonicalize(dir1.path).toString()
    if (result != exppath) {
        return 1
    }
    return 0
}
