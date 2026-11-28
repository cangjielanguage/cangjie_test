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

import std.collection.*
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

func fillStr(dst: Array<UInt8>, off: Int64, s: String): Unit {
    fillBytes(dst, off, s.toArray())
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

func makeHeader(name!: String, size!: Int64, typeFlag!: UInt8, magicVer!: String,
    badChecksum!: Bool, base256Size!: Bool): Array<UInt8> {
    let h = Array<UInt8>(512, repeat: 0)
    fillStr(h, 0, name)
    fillOctal(h, 100, 420, 8)
    fillOctal(h, 108, 1000, 8)
    fillOctal(h, 116, 1000, 8)
    if (base256Size) {
        h[124] = 0x80
        var i = 11
        var x = size
        while (i > 0) {
            i -= 1
            h[125 + i] = UInt8(x % 256)
            x = x / 256
        }
    } else {
        fillOctal(h, 124, size, 12)
    }
    fillOctal(h, 136, 1700000000, 12)
    var i = 148
    while (i < 156) {
        h[i] = 32
        i += 1
    }
    h[156] = typeFlag
    fillStr(h, 257, magicVer)
    var sum = 0
    i = 0
    while (i < 512) {
        if (i < 148 || i >= 156) {
            sum += Int64(h[i])
        } else {
            sum += 32
        }
        i += 1
    }
    if (badChecksum) {
        sum += 12345
    }
    fillOctal(h, 148, sum, 7)
    h[155] = 32
    return h
}

func endBlocks(): Array<UInt8> {
    return Array<UInt8>(1024, repeat: 0)
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

func drain(s: InputStream): Array<UInt8> {
    let buf = Array<UInt8>(4096, repeat: 0)
    let acc = ArrayList<UInt8>()
    while (true) {
        let n = s.read(buf)
        if (n == 0) {
            break
        }
        var i = 0
        while (i < n) {
            acc.add(buf[i])
            i += 1
        }
    }
    return acc.toArray()
}

func entryCount(buf: ByteBuffer): Int64 {
    var count = 0
    for (e in TarReader(buf).iterator()) {
        count += 1
        if (let Some(s) <- e.stream) {
            let _ = drain(s)
        }
    }
    return count
}

@Test
class TestTarMalformed {
    @TestCase
    func t01BadChecksumRejected(): Unit {
        let buf = ByteBuffer()
        buf.write(cat([makeHeader(name: "a.txt", size: 5, typeFlag: UInt8(48),
            magicVer: "ustar\u{0000}00", badChecksum: true, base256Size: false),
            dataBlock(Array<UInt8>(5, repeat: 65)), endBlocks()]))
        var threw = false
        try {
            entryCount(buf)
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func t02TruncatedHeaderRejected(): Unit {
        let full = makeHeader(name: "a.txt", size: 5, typeFlag: UInt8(48),
            magicVer: "ustar\u{0000}00", badChecksum: false, base256Size: false)
        let cut = Array<UInt8>(100, repeat: 0)
        fillBytes(cut, 0, full[0..100])
        let buf = ByteBuffer()
        buf.write(cut)
        var threw = false
        try {
            entryCount(buf)
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func t03TruncatedDataRejected(): Unit {
        let buf = ByteBuffer()
        buf.write(cat([makeHeader(name: "a.txt", size: 100, typeFlag: UInt8(48),
            magicVer: "ustar\u{0000}00", badChecksum: false, base256Size: false),
            Array<UInt8>(10, repeat: 65)]))
        var threw = false
        try {
            entryCount(buf)
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func t04NoEndBlocksErrors(): Unit {
        let buf = ByteBuffer()
        buf.write(cat([makeHeader(name: "a.txt", size: 5, typeFlag: UInt8(48),
            magicVer: "ustar\u{0000}00", badChecksum: false, base256Size: false),
            dataBlock(Array<UInt8>(5, repeat: 65))]))
        var threw = false
        try {
            entryCount(buf)
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func t05TrailingGarbageIgnored(): Unit {
        let buf = ByteBuffer()
        buf.write(cat([makeHeader(name: "a.txt", size: 5, typeFlag: UInt8(48),
            magicVer: "ustar\u{0000}00", badChecksum: false, base256Size: false),
            dataBlock(Array<UInt8>(5, repeat: 65)), endBlocks(),
            Array<UInt8>(512, repeat: 0x61)]))
        @Assert(entryCount(buf), 1)
    }

    @TestCase
    func t06GnuLongnameRoundtrip(): Unit {
        let longName = "gnu/" + "l" * 140 + ".txt"
        let longBytes = longName.toArray()
        let longData = Array<UInt8>(longBytes.size + 1, repeat: 0)
        fillBytes(longData, 0, longBytes)
        let buf = ByteBuffer()
        buf.write(cat([
            makeHeader(name: "././@LongLink", size: Int64(longName.size) + 1, typeFlag: UInt8(76),
                magicVer: "ustar  \u{0000}", badChecksum: false, base256Size: false),
            dataBlock(longData),
            makeHeader(name: longName[0..90].toString(), size: 3, typeFlag: UInt8(48),
                magicVer: "ustar  \u{0000}", badChecksum: false, base256Size: false),
            dataBlock(Array<UInt8>(3, repeat: 71)),
            endBlocks()
        ]))
        var got = ""
        for (e in TarReader(buf).iterator()) {
            got = e.name
            break
        }
        @Assert(got, longName)
    }

    @TestCase
    func t07PaxHeaderApplied(): Unit {
        let longName = "pax/" + "p" * 120 + ".txt"
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
        let paxData = (paxRecord("path", longName) + paxRecord("cjkey", "abcde")).toArray()
        let buf = ByteBuffer()
        buf.write(cat([
            makeHeader(name: "PaxHeaders/x", size: Int64(paxData.size), typeFlag: UInt8(120),
                magicVer: "ustar\u{0000}00", badChecksum: false, base256Size: false),
            dataBlock(paxData),
            makeHeader(name: "pax_tmp.txt", size: 3, typeFlag: UInt8(48),
                magicVer: "ustar\u{0000}00", badChecksum: false, base256Size: false),
            dataBlock(Array<UInt8>(3, repeat: 80)),
            endBlocks()
        ]))
        var got = ""
        var gotKey = "?"
        for (e in TarReader(buf).iterator()) {
            got = e.name
            if (let Some(p) <- (e as PaxTarEntry)) {
                if (let Some(v) <- p.getPaxData("cjkey")) {
                    gotKey = v
                }
            }
        }
        @Assert(got, longName)
        @Assert(gotKey, "abcde")
    }

    @TestCase
    func t08Base256SizeParsed(): Unit {
        let buf = ByteBuffer()
        buf.write(cat([makeHeader(name: "b256.txt", size: 10, typeFlag: UInt8(48),
            magicVer: "ustar  \u{0000}", badChecksum: false, base256Size: true),
            dataBlock(Array<UInt8>(10, repeat: 66)), endBlocks()]))
        var gotSize: Int64 = -1
        for (e in TarReader(buf).iterator()) {
            gotSize = e.size
        }
        @Assert(gotSize, 10)
    }

    @TestCase
    func t09MagicVariants(): Unit {
        let buf = ByteBuffer()
        buf.write(cat([makeHeader(name: "g.txt", size: 2, typeFlag: UInt8(48),
            magicVer: "ustar  \u{0000}", badChecksum: false, base256Size: false),
            dataBlock(Array<UInt8>(2, repeat: 67)), endBlocks()]))
        @Assert(entryCount(buf), 1)
        let buf2 = ByteBuffer()
        buf2.write(cat([makeHeader(name: "x.txt", size: 2, typeFlag: UInt8(48),
            magicVer: "xxxxxx\u{0000}", badChecksum: false, base256Size: false),
            dataBlock(Array<UInt8>(2, repeat: 67)), endBlocks()]))
        var threw = false
        try {
            entryCount(buf2)
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func t10Name100NoNul(): Unit {
        let name100 = "n" * 100
        let buf = ByteBuffer()
        buf.write(cat([makeHeader(name: name100, size: 1, typeFlag: UInt8(48),
            magicVer: "ustar\u{0000}00", badChecksum: false, base256Size: false),
            dataBlock(Array<UInt8>(1, repeat: 90)), endBlocks()]))
        var got = ""
        for (e in TarReader(buf).iterator()) {
            got = e.name
            break
        }
        @Assert(got, name100)
    }
}
