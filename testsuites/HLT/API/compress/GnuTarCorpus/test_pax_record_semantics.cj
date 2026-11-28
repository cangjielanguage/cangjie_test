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

func checksum(h: Array<UInt8>): Unit {
    fillOctal(h, 148, 0, 8)
    var sum: Int64 = 0
    var i = 0
    while (i < 512) { sum += if (i >= 148 && i < 156) { 32 } else { Int64(h[i]) }; i += 1 }
    fillOctal(h, 148, sum, 7)
    h[154] = 0
    h[155] = 32
}

func header(name: String, size: Int64, flag: UInt8): Array<UInt8> {
    let h = Array<UInt8>(512, repeat: 0)
    fillStr(h, 0, name)
    fillOctal(h, 100, 0o644, 8)
    fillOctal(h, 108, 1001, 8)
    fillOctal(h, 116, 1002, 8)
    fillOctal(h, 124, size, 12)
    fillOctal(h, 136, 1700000000, 12)
    var i = 148
    while (i < 156) { h[i] = 32; i += 1 }
    h[156] = flag
    fillStr(h, 257, "ustar\0")
    h[263] = 48
    h[264] = 48
    checksum(h)
    return h
}

func catBytes(parts: Array<Array<UInt8>>): Array<UInt8> {
    var total: Int64 = 0
    for (p in parts) { total += p.size }
    let out = Array<UInt8>(total, repeat: 0)
    var off: Int64 = 0
    for (p in parts) {
        var i: Int64 = 0
        while (i < p.size) { out[off + i] = p[i]; i += 1 }
        off += p.size
    }
    return out
}

func padTo(s: Array<UInt8>, total: Int64): Array<UInt8> {
    let b = Array<UInt8>(total, repeat: 0)
    var i = 0
    while (i < s.size && i < total) { b[i] = s[i]; i += 1 }
    return b
}

func mtimeRecord(v: String): Array<UInt8> {
    let body = " mtime=${v}\n"
    var len = body.size + 1
    while ("${len}${body}".size != len) { len = "${len}${body}".size }
    return padTo("${len}${body}".toArray(), len)
}

func drain2(s: InputStream): Int64 {
    let buf = Array<UInt8>(512, repeat: 0)
    return s.read(buf)
}

func entryMtime(records: Array<Array<UInt8>>, globalRecords!: Array<Array<UInt8>> = []): String {
    let buf = ByteBuffer()
    if (globalRecords.size > 0) {
        let all = catBytes(globalRecords)
        buf.write(header("GlobalHead", all.size, UInt8(0x67)))
        buf.write(padTo(all, 512))
    }
    if (records.size > 0) {
        let all = catBytes(records)
        buf.write(header("PaxHeaders/f", all.size, UInt8(0x78)))
        buf.write(padTo(all, 512))
    }
    buf.write(header("f.txt", 3, UInt8(0x30)))
    buf.write(padTo("abc".toArray(), 512))
    buf.write(Array<UInt8>(1024, repeat: 0))
    var mtime = ""
    try {
        for (e in TarReader(buf).iterator()) {
            mtime = e.modificationTime.toString()
            if (let Some(s) <- e.stream) { let _ = drain2(s) }
        }
    } catch (e: TarException) {
        mtime = "TAREX"
    } catch (e: Exception) {
        mtime = "OTHER"
    }
    return mtime
}

func parseKind(records: Array<Array<UInt8>>): String {
    let buf = ByteBuffer()
    let all = catBytes(records)
    buf.write(header("PaxHeaders/f", all.size, UInt8(0x78)))
    buf.write(padTo(all, 512))
    buf.write(header("f.txt", 3, UInt8(0x30)))
    buf.write(padTo("abc".toArray(), 512))
    buf.write(Array<UInt8>(1024, repeat: 0))
    var kind = "OK"
    try {
        for (e in TarReader(buf).iterator()) {
            if (let Some(s) <- e.stream) { let _ = drain2(s) }
        }
    } catch (e: TarException) {
        kind = "TAREX"
    } catch (e: Exception) {
        kind = "OTHER"
    }
    return kind
}

@Test
class TestPaxRecordSemantics {
    @TestCase
    func globalEntryMtimeEntryWins(): Unit {
        @Assert(entryMtime([mtimeRecord("1700000000.0")], globalRecords: [mtimeRecord("1600000000.0")]),
            "2023-11-14T22:13:20Z")
        @Assert(entryMtime([], globalRecords: [mtimeRecord("1600000000.0")]),
            "2020-09-13T12:26:40Z")
    }

    @TestCase
    func multiRecordLastWins(): Unit {
        @Assert(entryMtime([mtimeRecord("1600000000.0"), mtimeRecord("1700000000.0")]),
            "2023-11-14T22:13:20Z")
        @Assert(entryMtime([mtimeRecord("1600000000.0"), mtimeRecord("1700000000.0"), mtimeRecord("1700000001.0")]),
            "2023-11-14T22:13:21Z")
    }

    @TestCase
    func emptyValueRecordAccepted(): Unit {
        @Assert(parseKind([padTo("7 key=\n".toArray(), 7)]), "OK")
    }

    @TestCase
    func malformedRecordsCleanlyRejected(): Unit {
        @Assert(parseKind([padTo("19 malformedrecord\n".toArray(), 19)]), "TAREX")
        @Assert(parseKind([padTo("17 mtime=1700000000.0\n".toArray(), 22)]), "TAREX")
        @Assert(parseKind([padTo("50 mtime=1700000000.0\n".toArray(), 22)]), "TAREX")
    }

    @TestCase
    func paxTimeExtremesApplied(): Unit {
        @Assert(entryMtime([mtimeRecord("1700000000.999999999")]), "2023-11-14T22:13:20.999999999Z")
        @Assert(entryMtime([mtimeRecord("253402300799")]), "9999-12-31T23:59:59Z")
    }
}
