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

func fillBytes(dst: Array<UInt8>, off: Int64, bytes: Array<UInt8>): Unit {
    var i = 0
    while (i < bytes.size) {
        dst[off + i] = bytes[i]
        i += 1
    }
}

func fillOctal(dst: Array<UInt8>, off: Int64, v: Int64, width: Int64): Unit {
    var i = width - 2
    var x = v
    while (i >= 0) {
        dst[off + i] = UInt8(48 + (x % 8))
        x = x / 8
        i -= 1
    }
    dst[off + width - 1] = 0
}

func headerWithChecksum(nameBytes: Array<UInt8>, checksumStr: String): Array<UInt8> {
    let h = Array<UInt8>(512, repeat: 0)
    fillBytes(h, 0, nameBytes)
    fillOctal(h, 100, 420, 8)
    fillOctal(h, 124, 1, 12)
    fillOctal(h, 136, 1700000000, 12)
    var i = 148
    while (i < 156) {
        h[i] = 32
        i += 1
    }
    h[156] = UInt8(48)
    fillBytes(h, 257, "ustar  \u{0000}".toArray())
    let cs = checksumStr.toArray()
    var k = 0
    while (k < cs.size && k < 6) {
        h[148 + k] = cs[k]
        k += 1
    }
    h[154] = 0
    h[155] = 32
    return h
}

func dataBlock(data: Array<UInt8>): Array<UInt8> {
    let padded = (data.size + 511) / 512 * 512
    let b = Array<UInt8>(padded, repeat: 0)
    fillBytes(b, 0, data)
    return b
}

func cat(parts: Array<Array<UInt8>>): Array<UInt8> {
    var total = 0
    for (p in parts) {
        total += p.size
    }
    let out = Array<UInt8>(total, repeat: 0)
    var off = 0
    for (p in parts) {
        fillBytes(out, off, p)
        off += p.size
    }
    return out
}

func parseKind(buf: ByteBuffer): String {
    var kind = "OK"
    try {
        for (e in TarReader(buf).iterator()) {
            if (let Some(s) <- e.stream) {
                let one = Array<UInt8>(4096, repeat: 0)
                while (true) {
                    let n = s.read(one)
                    if (n == 0) {
                        break
                    }
                }
            }
        }
    } catch (e: TarException) {
        kind = "TAREX"
    } catch (e: Exception) {
        kind = "OTHER|${e.message}"
    }
    return kind
}

@Test
class TestTarChecksumVariants {
    @TestCase
    func signedChecksumAccepted(): Unit {
        let nameBytes: Array<UInt8> = [0xD6, 0xD0, 0x2E, 0x74, 0x78, 0x74]
        let h = headerWithChecksum(nameBytes, "000000")
        var sumS: Int64 = 0
        var i = 0
        while (i < 512) {
            let v = Int64(h[i])
            sumS += if (i >= 148 && i < 156) {
                32
            } else {
                if (v >= 128) { v - 256 } else { v }
            }
            i += 1
        }
        fillOctal(h, 148, sumS, 7)
        h[155] = 32
        let buf = ByteBuffer()
        buf.write(h)
        buf.write(dataBlock(Array<UInt8>(1, repeat: 65)))
        buf.write(Array<UInt8>(1024, repeat: 0))
        @Assert(parseKind(buf), "OK")
    }

    @TestCase
    func leadingSpaceChecksumAccepted(): Unit {
        let nameBytes: Array<UInt8> = [0x61, 0x2E, 0x74, 0x78, 0x74]
        let h = headerWithChecksum(nameBytes, "000000")
        var sum = 0
        var i = 0
        while (i < 512) {
            if (i >= 148 && i < 156) {
                sum += 32
            } else {
                sum += Int64(h[i])
            }
            i += 1
        }
        var csStr = "${sum}"
        while (csStr.size < 6) {
            csStr = " " + csStr
        }
        let csb = csStr.toArray()
        var k = 0
        while (k < csb.size && k < 6) {
            h[148 + k] = csb[k]
            k += 1
        }
        h[154] = 0
        h[155] = 32
        let buf = ByteBuffer()
        buf.write(h)
        buf.write(dataBlock(Array<UInt8>(1, repeat: 65)))
        buf.write(Array<UInt8>(1024, repeat: 0))
        @Assert(parseKind(buf), "OK")
    }
}
