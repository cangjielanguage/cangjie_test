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

func buildHeader(name: String, size: Int64, flag: UInt8): Array<UInt8> {
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
    var sum: Int64 = 0
    i = 0
    while (i < 512) { sum += if (i >= 148 && i < 156) { 32 } else { Int64(h[i]) }; i += 1 }
    fillOctal(h, 148, sum, 7)
    h[154] = 0
    h[155] = 32
    return h
}

func drain(s: InputStream): Int64 {
    let buf = Array<UInt8>(4096, repeat: 0)
    var total: Int64 = 0
    while (true) { let n = s.read(buf); if (n == 0) { break }; total += n }
    return total
}

@Test
class TestTarApiSurface {
    @TestCase
    func modeRoundtrip(): Unit {
        let src = Path("api_src.txt")
        File.writeTo(src, "x".toArray())
        var got: Int32 = -1
        try {
            let buf = ByteBuffer()
            let w = TarWriter(buf, TarEntryFormat.Gnu)
            let e = GnuTarEntry(src)
            e.mode = 0o640
            w.write(e)
            w.finish()
            for (r in TarReader(buf).iterator()) {
                got = r.mode
            }
        } catch (e: TarException) {
            got = -1
        }
        removeIfExists(src)
        @Assert(got, 0o640)
    }

    @TestCase
    func defaultInitIsPaxAndWorks(): Unit {
        let src = Path("api_src2.txt")
        File.writeTo(src, "y".toArray())
        var format = TarEntryFormat.V7
        var name = ""
        let buf = ByteBuffer()
        let w = TarWriter(buf)
        format = w.format
        w.write(src, entryName: "renamed.txt")
        w.finish()
        for (r in TarReader(buf).iterator()) {
            name = r.name
        }
        removeIfExists(src)
        @Assert(format, TarEntryFormat.Pax)
        @Assert(name, "renamed.txt")
    }

    @TestCase
    func unknownTypeflagYielded(): Unit {
        let buf = ByteBuffer()
        buf.write(buildHeader("vnd.txt", 3, UInt8(0x41)))
        buf.write("abc".toArray())
        buf.write(Array<UInt8>(1024, repeat: 0))
        var gotType = ""
        var gotName = ""
        var gotSize: Int64 = -1
        try {
            for (e in TarReader(buf).iterator()) {
                gotType = "${e.entryType}"
                gotName = e.name
                gotSize = e.size
            }
        } catch (e: TarException) {
            gotType = "TAREX"
        }
        @Assert(gotType, "TarEntryType.Unknown(65)")
        @Assert(gotName, "vnd.txt")
        @Assert(gotSize, 3)
    }

    @TestCase
    func checksumPropMatchesHeader(): Unit {
        let h = buildHeader("chk.txt", 3, UInt8(0x30))
        var sum: Int64 = 0
        var i = 0
        while (i < 512) { sum += if (i >= 148 && i < 156) { 32 } else { Int64(h[i]) }; i += 1 }
        let buf = ByteBuffer()
        buf.write(h)
        buf.write("abc".toArray())
        buf.write(Array<UInt8>(1024, repeat: 0))
        var cs: Int64 = -1
        try {
            for (e in TarReader(buf).iterator()) {
                cs = Int64(e.checksum)
            }
        } catch (e: TarException) {
            cs = -1
        }
        @Assert(cs, sum)
    }

    @TestCase
    func archiveToStreamRoundtrip(): Unit {
        let dir = Path("api_stream_dir")
        removeIfExists(dir, recursive: true)
        Directory.create(dir)
        Directory.create(Path("api_stream_dir/d"))
        File.writeTo(Path("api_stream_dir/a.txt"), "alpha payload".toArray())
        File.writeTo(Path("api_stream_dir/d/b.txt"), "beta payload".toArray())
        let out = ByteBuffer()
        Tar.archive(fromDir: dir, destStream: out, includeBaseDirectory: false)
        var names = ArrayList<String>()
        for (e in TarReader(out).iterator()) {
            names.add(e.name)
            if (let Some(s) <- e.stream) {
                let _ = drain(s)
            }
        }
        removeIfExists(dir, recursive: true)
        @Assert(names.size, 3)
        @Assert(names.contains("a.txt") && names.contains("d") && names.contains("d/b.txt"))
    }
}
