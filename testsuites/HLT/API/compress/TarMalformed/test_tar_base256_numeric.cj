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

import std.fs.*
import std.io.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

func fillStr(dst: Array<UInt8>, off: Int64, s: String): Unit {
    let b = s.toArray()
    var i = 0
    while (i < b.size) { dst[off + i] = b[i]; i += 1 }
}

func fillOctal(dst: Array<UInt8>, off: Int64, v: Int64, width: Int64): Unit {
    var i = width - 2
    var x = v
    while (i >= 0) { dst[off + i] = UInt8(48 + (x % 8)); x = x / 8; i -= 1 }
    dst[off + width - 1] = 0
}

func fillBase256(dst: Array<UInt8>, off: Int64, width: Int64, v: Int64, negative!: Bool = false): Unit {
    var i = 0
    while (i < width) { dst[off + i] = 0; i += 1 }
    dst[off] = if (negative) { 0xFF } else { 0x80 }
    var x = v
    i = width - 1
    while (i >= 1) { dst[off + i] = UInt8(x & 0xFF); x = x >> 8; i -= 1 }
}

func buildHeader(uid256!: Bool = false, uidVal!: Int64 = 0, uidNeg!: Bool = false,
    size256!: Bool = false, sizeVal!: Int64 = 0, sizeNeg!: Bool = false): Array<UInt8> {
    let h = Array<UInt8>(512, repeat: 0)
    fillStr(h, 0, "b256.txt")
    fillOctal(h, 100, 0o644, 8)
    if (uid256) { fillBase256(h, 108, 8, uidVal, negative: uidNeg) } else { fillOctal(h, 108, 1001, 8) }
    fillOctal(h, 116, 1002, 8)
    if (size256) { fillBase256(h, 124, 12, sizeVal, negative: sizeNeg) } else { fillOctal(h, 124, 3, 12) }
    fillOctal(h, 136, 1700000000, 12)
    var i = 148
    while (i < 156) { h[i] = 32; i += 1 }
    h[156] = UInt8(0x30)
    fillStr(h, 257, "ustar\0")
    h[263] = 48
    h[264] = 48
    fillOctal(h, 148, 0, 8)
    var sum: Int64 = 0
    i = 0
    while (i < 512) { sum += if (i >= 148 && i < 156) { 32 } else { Int64(h[i]) }; i += 1 }
    fillOctal(h, 148, sum, 7)
    h[154] = 0
    h[155] = 32
    return h
}

func entrySummaries(h: Array<UInt8>): String {
    let buf = ByteBuffer()
    buf.write(h)
    buf.write(Array<UInt8>(512, repeat: 0x61))
    buf.write(Array<UInt8>(1024, repeat: 0))
    var out = ""
    try {
        for (e in TarReader(buf).iterator()) {
            var n: Int64 = -1
            if (let Some(s) <- e.stream) {
                let b = Array<UInt8>(512, repeat: 0)
                n = s.read(b)
            }
            out = out + " [uid=${e.uid} size=${e.size} read=${n}]"
        }
    } catch (e: TarException) {
        return out + " TAREX"
    } catch (e: Exception) {
        return out + " OTHER"
    }
    return out
}

@Test
class TestTarBase256Numeric {
    @TestCase
    func positiveSizeBase256Parsed(): Unit {
        @Assert(entrySummaries(buildHeader(size256: true, sizeVal: 100)) ==
            " [uid=1001 size=100 read=100]")
    }

    @TestCase
    func bigSizeBase256CleanRejection(): Unit {
        @Assert(entrySummaries(buildHeader(size256: true, sizeVal: 8589934592)) ==
            " TAREX")
    }

    @TestCase
    func negativeUidNoEscape(): Unit {
        let r = entrySummaries(buildHeader(uid256: true, uidVal: 1, uidNeg: true))
        @Assert(!r.endsWith("OTHER"), true)
    }

    @TestCase
    func negativeSizeNoEscape(): Unit {
        let r = entrySummaries(buildHeader(size256: true, sizeVal: 1, sizeNeg: true))
        @Assert(!r.endsWith("OTHER"), true)
    }
}
