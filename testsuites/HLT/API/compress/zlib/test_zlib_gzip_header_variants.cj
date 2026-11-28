/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: gzip_fname.gz, gzip_fextra.gz, gzip_fhcrc.gz, gzip_src.bin, zlib_wrapped.bin
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

func decompressGzipFile(path: String): Array<UInt8> {
    let out = ByteBuffer()
    let dis = DecompressInputStream(bufOf(File.readFrom(Path(path))), wrap: GzipFormat)
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
class TestZlibGzipHeaderVariants {
    @TestCase
    func gzipFnameHeaderAccepted(): Unit {
        @Assert(decompressGzipFile("gzip_fname.gz"), File.readFrom(Path("gzip_src.bin")))
    }

    @TestCase
    func gzipFextraFcommentAccepted(): Unit {
        @Assert(decompressGzipFile("gzip_fextra.gz"), File.readFrom(Path("gzip_src.bin")))
    }

    @TestCase
    func gzipFhcrcAccepted(): Unit {
        var ok = false
        try {
            ok = decompressGzipFile("gzip_fhcrc.gz").size == 102400
        } catch (e: ZlibException) {
            ok = false
        }
        @Assert(ok)
    }

    @TestCase
    func zlibWrappedRejectedAsGzip(): Unit {
        var threw = false
        try {
            let _ = decompressGzipFile("zlib_wrapped.bin")
        } catch (e: ZlibException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func zlibWrappedRejectedAsDeflate(): Unit {
        var threw = false
        try {
            let out = ByteBuffer()
            let dis = DecompressInputStream(bufOf(File.readFrom(Path("zlib_wrapped.bin"))),
                wrap: DeflateFormat)
            let one = Array<UInt8>(4096, repeat: 0)
            while (true) {
                let n = dis.read(one)
                if (n == 0) {
                    break
                }
                out.write(one[0..n])
            }
            dis.close()
        } catch (e: ZlibException) {
            threw = true
        }
        @Assert(threw)
    }
}
