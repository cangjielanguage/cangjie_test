/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: alice29.txt, fields.c, kennedy.bin, sum.bin, plrabn12.txt
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args
// TIMEOUT: 300

import std.fs.*
import std.io.*
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

func bufOf(bytes: Array<UInt8>): ByteBuffer {
    let b = ByteBuffer()
    b.write(bytes)
    return b
}

func corpusRoundtrip(path: String, wrap: WrapType): Bool {
    let data = File.readFrom(Path(path))
    let cbuf = ByteBuffer()
    let cis = CompressInputStream(bufOf(data), wrap: wrap, compressLevel: DefaultCompression)
    let one = Array<UInt8>(65536, repeat: 0)
    while (true) {
        let n = cis.read(one)
        if (n == 0) {
            break
        }
        cbuf.write(one[0..n])
    }
    cis.close()
    let dis = DecompressInputStream(bufOf(readToEnd(cbuf)), wrap: wrap)
    let out = ByteBuffer()
    while (true) {
        let n = dis.read(one)
        if (n == 0) {
            break
        }
        out.write(one[0..n])
    }
    dis.close()
    return readToEnd(out) == data
}

@Test
class TestCompressCorpusRoundtrip {
    @TestCase
    func corpusAlice29(): Unit {
        @Assert(corpusRoundtrip("alice29.txt", GzipFormat), true)
        @Assert(corpusRoundtrip("alice29.txt", DeflateFormat), true)
    }

    @TestCase
    func corpusFieldsC(): Unit {
        @Assert(corpusRoundtrip("fields.c", GzipFormat), true)
        @Assert(corpusRoundtrip("fields.c", DeflateFormat), true)
    }

    @TestCase
    func corpusKennedyXls(): Unit {
        @Assert(corpusRoundtrip("kennedy.bin", GzipFormat), true)
        @Assert(corpusRoundtrip("kennedy.bin", DeflateFormat), true)
    }

    @TestCase
    func corpusSum(): Unit {
        @Assert(corpusRoundtrip("sum.bin", GzipFormat), true)
        @Assert(corpusRoundtrip("sum.bin", DeflateFormat), true)
    }

    @TestCase
    func corpusPlrabn12(): Unit {
        @Assert(corpusRoundtrip("plrabn12.txt", GzipFormat), true)
        @Assert(corpusRoundtrip("plrabn12.txt", DeflateFormat), true)
    }
}
