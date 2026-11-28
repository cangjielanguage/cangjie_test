/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: out_7z.tar, out_bsdtar_pax.tar, out_bsdtar_ustar.tar, out_bsdtar_v7.tar
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

func parseKind(path: String): String {
    var kind = "OK"
    try {
        for (e in TarReader(File(path, Read)).iterator()) {
            if (let Some(s) <- e.stream) { let _ = drain(s) }
        }
    } catch (e: TarException) {
        kind = "TAREX"
    } catch (e: Exception) {
        kind = "OTHER"
        println("[OTHER] ${path}: ${e.message}")
    }
    return kind
}

@Test
class TestTarWriterMatrix {
    @TestCase
    func sevenZipUtf8NamesParsed(): Unit {
        @Assert(parseKind("out_7z.tar"), "OK")
        var cjk = false
        for (e in TarReader(File("out_7z.tar", Read)).iterator()) {
            if (let Some(s) <- e.stream) { let _ = drain(s) }
            if (e.name.endsWith("中文文档.txt")) { cjk = true }
        }
        @Assert(cjk)
    }

    @TestCase
    func bsdtarPaxUtf8Parsed(): Unit {
        @Assert(parseKind("out_bsdtar_pax.tar"), "OK")
        var cjk = false
        for (e in TarReader(File("out_bsdtar_pax.tar", Read)).iterator()) {
            if (let Some(s) <- e.stream) { let _ = drain(s) }
            if (e.name.endsWith("中文文档.txt")) { cjk = true }
        }
        @Assert(cjk)
    }

    @TestCase
    func bsdtarUstarGbkNoEscape(): Unit {
        @Assert(parseKind("out_bsdtar_ustar.tar") != "OTHER", true)
        @Assert(parseKind("out_bsdtar_v7.tar") != "OTHER", true)
    }
}
