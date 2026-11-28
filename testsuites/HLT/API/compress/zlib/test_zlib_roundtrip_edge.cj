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
import std.random.*
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

func bufOf(bytes: Array<UInt8>): ByteBuffer {
    let b = ByteBuffer()
    b.write(bytes)
    return b
}

func roundtrip(data: Array<UInt8>, wrap: WrapType, level: CompressLevel): Array<UInt8> {
    let cbuf = ByteBuffer()
    let cis = CompressInputStream(bufOf(data), wrap: wrap, compressLevel: level)
    let one = Array<UInt8>(777, repeat: 0)
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
    return readToEnd(out)
}

func cjkData(len: Int64): Array<UInt8> {
    let unit = "\u{4ED3}\u{9895}\u{7F16}\u{7A0B}\u{8BED}\u{8A00} Cangjie compress roundtrip \u{8FB9}\u{754C}\u{6D4B}\u{8BD5}\u{3002}\n".toArray()
    let arr = Array<UInt8>(len, repeat: 0)
    var off = 0
    while (off < len) {
        var j = 0
        while (j < unit.size && off + j < len) {
            arr[off + j] = unit[j]
            j += 1
        }
        off += unit.size
    }
    return arr
}

@Test
class TestZlibRoundtripEdge {
    @TestCase
    func r01EmptyData(): Unit {
        for (w in [GzipFormat, DeflateFormat]) {
            for (lv in [BestSpeed, DefaultCompression, BestCompression]) {
                @Assert(roundtrip([], w, lv).size, 0)
            }
        }
    }

    @TestCase
    func r02Random512K(): Unit {
        let rnd = Random(20261124)
        let data = Array<UInt8>(512 * 1024, {_ => rnd.nextUInt8()})
        for (w in [GzipFormat, DeflateFormat]) {
            for (lv in [BestSpeed, DefaultCompression, BestCompression]) {
                @Assert(roundtrip(data, w, lv), data)
            }
        }
    }

    @TestCase
    func r03RepeatMonotonic(): Unit {
        let data = Array<UInt8>(1024 * 1024, {_ => UInt8(65)})
        var s1: Int64 = 0
        var s2: Int64 = 0
        var s3: Int64 = 0
        for (w in [GzipFormat, DeflateFormat]) {
            s1 = roundtrip(data, w, BestSpeed).size
            s2 = roundtrip(data, w, DefaultCompression).size
            s3 = roundtrip(data, w, BestCompression).size
            @Assert(s1 >= s2 && s2 >= s3, true)
        }
    }

    @TestCase
    func r04CjkText(): Unit {
        let data = cjkData(300 * 1024)
        for (w in [GzipFormat, DeflateFormat]) {
            for (lv in [BestSpeed, DefaultCompression, BestCompression]) {
                @Assert(roundtrip(data, w, lv), data)
            }
        }
    }

    @TestCase
    func r05ZeroLenWrite(): Unit {
        let cbuf = ByteBuffer()
        let cos = CompressOutputStream(cbuf, wrap: GzipFormat)
        cos.write([])
        cos.write([72, 73])
        cos.write([])
        cos.close()
        let dbuf = ByteBuffer()
        let dos = DecompressOutputStream(dbuf, wrap: GzipFormat)
        dos.write(readToEnd(cbuf))
        dos.close()
        @Assert(readToEnd(dbuf), [UInt8(72), UInt8(73)])
    }

    @TestCase
    func r07MidstreamFlush(): Unit {
        let half1 = cjkData(64 * 1024)
        let half2 = cjkData(64 * 1024)
        let expect = Array<UInt8>(half1.size + half2.size, repeat: 0)
        var i = 0
        while (i < half1.size) {
            expect[i] = half1[i]
            i += 1
        }
        while (i < expect.size) {
            expect[i] = half2[i - half1.size]
            i += 1
        }
        let cbuf = ByteBuffer()
        let cos = CompressOutputStream(cbuf, wrap: DeflateFormat)
        cos.write(half1)
        cos.flush()
        cos.write(half2)
        cos.close()
        let dbuf = ByteBuffer()
        let dos = DecompressOutputStream(dbuf, wrap: DeflateFormat)
        dos.write(readToEnd(cbuf))
        dos.close()
        @Assert(readToEnd(dbuf), expect)
    }

    @TestCase
    func r08AllByteValues(): Unit {
        let data = Array<UInt8>(256, {i => UInt8(i)})
        for (w in [GzipFormat, DeflateFormat]) {
            @Assert(roundtrip(data, w, DefaultCompression), data)
        }
    }
}
