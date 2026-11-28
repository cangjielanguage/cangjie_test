/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: m_posix.tar
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

func drain(s: InputStream): Int64 {
    let buf = Array<UInt8>(4096, repeat: 0)
    var total: Int64 = 0
    while (true) { let n = s.read(buf); if (n == 0) { break }; total += n }
    return total
}

@Test
class TestPaxTimeSemantics {
    @TestCase
    func mtimeNsPrecisionApplied(): Unit {
        var mod = ""
        for (e in TarReader(File("m_posix.tar", Read)).iterator()) {
            if (let Some(s) <- e.stream) {
                let _ = drain(s)
            }
            if (e.name.endsWith("a.txt")) {
                mod = e.modificationTime.toString()
            }
        }
        @Assert(mod, "2026-11-26T08:30:34.5155469Z")
    }

    @TestCase
    func atimeCtimeRecordsAccessible(): Unit {
        var atime: ?String = None
        var ctime: ?String = None
        for (e in TarReader(File("m_posix.tar", Read)).iterator()) {
            if (let Some(s) <- e.stream) {
                let _ = drain(s)
            }
            if (e.name.endsWith("a.txt")) {
                if (let Some(p) <- (e as PaxTarEntry)) {
                    atime = p.getPaxData("atime")
                    ctime = p.getPaxData("ctime")
                }
            }
        }
        @Assert(atime, "1795681835.5161442")
        @Assert(ctime, "1795681834.5155469")
    }
}
