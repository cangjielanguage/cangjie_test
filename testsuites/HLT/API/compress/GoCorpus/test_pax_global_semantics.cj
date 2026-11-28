/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pax-global-records.tar
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

func makeHeader(name!: String, size!: Int64, typeFlag!: UInt8): Array<UInt8> {
    let h = Array<UInt8>(512, repeat: 0)
    fillBytes(h, 0, name.toArray())
    fillOctal(h, 100, 420, 8)
    fillOctal(h, 124, size, 12)
    fillOctal(h, 136, 1700000000, 12)
    var i = 148
    while (i < 156) {
        h[i] = 32
        i += 1
    }
    h[156] = typeFlag
    fillBytes(h, 257, "ustar\u{0000}00".toArray())
    var sum = 0
    i = 0
    while (i < 512) {
        if (i >= 148 && i < 156) {
            sum += 32
        } else {
            sum += Int64(h[i])
        }
        i += 1
    }
    fillOctal(h, 148, sum, 7)
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

func paxRecord(key: String, value: String): String {
    let body = key + "=" + value + "\n"
    var d = 1
    var total = 0
    while (true) {
        total = body.size + d + 1
        let dd = "${total}".size
        if (dd == d) {
            break
        }
        d = dd
    }
    return "${total} " + body
}

@Test
class TestPaxGlobalSemantics {
    @TestCase
    func globalHeaderApplied(): Unit {
        let globalData = (paxRecord("path", "global_override.txt") + paxRecord("mtime", "1234567.5")).toArray()
        let buf = ByteBuffer()
        buf.write(cat([
            makeHeader(name: "pax_global_header", size: Int64(globalData.size), typeFlag: UInt8(103)),
            dataBlock(globalData),
            makeHeader(name: "orig.txt", size: 3, typeFlag: UInt8(48)),
            dataBlock(Array<UInt8>(3, repeat: 65)),
            Array<UInt8>(1024, repeat: 0)
        ]))
        var got = ""
        for (e in TarReader(buf).iterator()) {
            got = e.name
        }
        @Assert(got, "global_override.txt")
    }

    @TestCase
    func entryOverridesGlobal(): Unit {
        let gData = paxRecord("path", "global_name.txt").toArray()
        let eData = paxRecord("path", "entry_name.txt").toArray()
        let buf = ByteBuffer()
        buf.write(cat([
            makeHeader(name: "pax_global_header", size: Int64(gData.size), typeFlag: UInt8(103)),
            dataBlock(gData),
            makeHeader(name: "PaxHeaders/e", size: Int64(eData.size), typeFlag: UInt8(120)),
            dataBlock(eData),
            makeHeader(name: "dummy.txt", size: 3, typeFlag: UInt8(48)),
            dataBlock(Array<UInt8>(3, repeat: 88)),
            Array<UInt8>(1024, repeat: 0)
        ]))
        var got = ""
        for (e in TarReader(buf).iterator()) {
            got = e.name
        }
        @Assert(got, "entry_name.txt")
    }

    @TestCase
    func paxGlobalRecordsParses(): Unit {
        var count: Int64 = 0
        for (e in TarReader(File("pax-global-records.tar", Read)).iterator()) {
            count += 1
        }
        @Assert(count, 4)
    }
}
