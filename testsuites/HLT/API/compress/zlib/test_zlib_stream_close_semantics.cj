/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.io.*
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

func bufOf(bytes: Array<UInt8>): ByteBuffer {
    let b = ByteBuffer()
    b.write(bytes)
    return b
}

@Test
class TestZlibStreamCloseSemantics {
    @TestCase
    func compressWriteAfterCloseThrows(): Unit {
        let out = ByteBuffer()
        let cos = CompressOutputStream(out)
        cos.write([72])
        cos.close()
        var threw = false
        try {
            cos.write([72])
        } catch (e: ZlibException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func decompressWriteAfterCloseThrows(): Unit {
        let cis = CompressInputStream(bufOf([72]), wrap: GzipFormat)
        let one = Array<UInt8>(64, repeat: 0)
        let gz = ByteBuffer()
        while (true) {
            let n = cis.read(one)
            if (n == 0) {
                break
            }
            gz.write(one[0..n])
        }
        cis.close()
        let out = ByteBuffer()
        let dos = DecompressOutputStream(out, wrap: GzipFormat)
        dos.write(readToEnd(gz))
        dos.close()
        var threw = false
        try {
            dos.write([UInt8(72)])
        } catch (e: ZlibException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func compressReadAfterCloseThrows(): Unit {
        let src = bufOf([72, 73, 74])
        let cis = CompressInputStream(src, wrap: GzipFormat)
        let t = Array<UInt8>(16, repeat: 0)
        let _ = cis.read(t)
        cis.close()
        var threw = false
        try {
            let _ = cis.read(t)
        } catch (e: ZlibException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func decompressReadAfterCloseThrows(): Unit {
        let cis = CompressInputStream(bufOf([72]), wrap: GzipFormat)
        let one = Array<UInt8>(64, repeat: 0)
        let gz = ByteBuffer()
        while (true) {
            let n = cis.read(one)
            if (n == 0) {
                break
            }
            gz.write(one[0..n])
        }
        cis.close()
        let dis = DecompressInputStream(gz, wrap: GzipFormat)
        let t = Array<UInt8>(16, repeat: 0)
        let _ = dis.read(t)
        dis.close()
        var threw = false
        try {
            let _ = dis.read(t)
        } catch (e: ZlibException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func emptyInputNoException(): Unit {
        let out = ByteBuffer()
        let dis = DecompressInputStream(ByteBuffer(), wrap: GzipFormat)
        let one = Array<UInt8>(64, repeat: 0)
        while (true) {
            let n = dis.read(one)
            if (n == 0) {
                break
            }
            out.write(one[0..n])
        }
        dis.close()
        @Assert(readToEnd(out).size, 0)
    }

    @TestCase
    func readEmptyBufferThrows(): Unit {
        let cis = CompressInputStream(bufOf([72, 73]), wrap: GzipFormat)
        var threw = false
        try {
            let _ = cis.read([])
        } catch (e: ZlibException) {
            threw = true
        }
        cis.close()
        @Assert(threw)
    }
}
