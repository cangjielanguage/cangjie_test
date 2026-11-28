/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: gzip_multi.gz, gzip_src.bin
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

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

func compressGzip(data: Array<UInt8>): Array<UInt8> {
    let cbuf = ByteBuffer()
    let cis = CompressInputStream(bufOf(data), wrap: GzipFormat)
    let one = Array<UInt8>(1024, repeat: 0)
    while (true) {
        let n = cis.read(one)
        if (n == 0) {
            break
        }
        cbuf.write(one[0..n])
    }
    cis.close()
    return readToEnd(cbuf)
}

func decompressGzip(buf: ByteBuffer): Array<UInt8> {
    let out = ByteBuffer()
    let dis = DecompressInputStream(buf, wrap: GzipFormat)
    let one = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = dis.read(one)
        if (n == 0) {
            break
        }
        out.write(one[0..n])
    }
    dis.close()
    return readToEnd(out)
}

@Test
class TestZlibMultimemberGzip {
    @TestCase
    func singleMemberRoundtrip(): Unit {
        let data = "AAAA".toArray()
        @Assert(decompressGzip(bufOf(compressGzip(data))), data)
    }

    @TestCase
    func multimemberSyntheticConcatenated(): Unit {
        let buf = ByteBuffer()
        buf.write(compressGzip("AAAA".toArray()))
        buf.write(compressGzip("BBBB".toArray()))
        @Assert(decompressGzip(buf), "AAAABBBB".toArray())
    }

    @TestCase
    func multimemberPythonFixture(): Unit {
        let buf = ByteBuffer()
        buf.write(File.readFrom(Path("gzip_multi.gz")))
        @Assert(decompressGzip(buf), File.readFrom(Path("gzip_src.bin")))
    }
}
