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

func writeOne(format!: TarEntryFormat, entryName!: String): ByteBuffer {
    let src = Path("w_src.txt")
    File.writeTo(src, "payload".toArray())
    let buf = ByteBuffer()
    let w = TarWriter(buf, format)
    w.write(src, entryName: entryName)
    w.finish()
    return buf
}

func firstNameOf(buf: ByteBuffer): String {
    var n = ""
    for (e in TarReader(buf).iterator()) {
        n = e.name
        break
    }
    return n
}

@Test
class TestTarWriteEdge {
    @TestCase
    func w01UstarName99And100(): Unit {
        @Assert(firstNameOf(writeOne(format: TarEntryFormat.Ustar, entryName: "a" * 99)).size, 99)
        @Assert(firstNameOf(writeOne(format: TarEntryFormat.Ustar, entryName: "b" * 100)).size, 100)
    }

    @TestCase
    func w03UstarName101Rejected(): Unit {
        var threw = false
        try {
            let _ = writeOne(format: TarEntryFormat.Ustar, entryName: "c" * 101)
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func w04UstarPrefixSplit(): Unit {
        let prefixed = "d" * 150 + "/" + "e" * 9 + ".txt"
        var ok = false
        try {
            let buf = writeOne(format: TarEntryFormat.Ustar, entryName: prefixed)
            ok = firstNameOf(buf) == prefixed
        } catch (e: TarException) {
            ok = false
        }
        @Assert(ok)
    }

    @TestCase
    func w05V7Name100Rejected(): Unit {
        var threw = false
        try {
            let _ = writeOne(format: TarEntryFormat.V7, entryName: "f" * 100)
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func w06WriteAfterFinishThrows(): Unit {
        let src = Path("w_src.txt")
        File.writeTo(src, "x".toArray())
        let buf = ByteBuffer()
        let w = TarWriter(buf, TarEntryFormat.Ustar)
        w.write(src, entryName: "ok.txt")
        w.finish()
        var threw = false
        try {
            w.write(src, entryName: "late.txt")
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func w07FlushAfterFinishThrows(): Unit {
        let src = Path("w_src.txt")
        File.writeTo(src, "x".toArray())
        let buf = ByteBuffer()
        let w = TarWriter(buf, TarEntryFormat.Ustar)
        w.write(src, entryName: "ok.txt")
        w.finish()
        var threw = false
        try {
            w.flush()
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func w08DuplicateNameReadable(): Unit {
        let src = Path("w_src.txt")
        File.writeTo(src, "x".toArray())
        let buf = ByteBuffer()
        let w = TarWriter(buf, TarEntryFormat.Ustar)
        w.write(src, entryName: "dup.txt")
        w.write(src, entryName: "dup.txt")
        w.finish()
        var count = 0
        for (e in TarReader(buf).iterator()) {
            count += 1
        }
        @Assert(count, 2)
    }

    @TestCase
    func w09EmptyNameRejected(): Unit {
        var threw = false
        try {
            let _ = writeOne(format: TarEntryFormat.Ustar, entryName: "")
        } catch (e: TarException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func w10NulInNameNoCrash(): Unit {
        let n = firstNameOf(writeOne(format: TarEntryFormat.Ustar, entryName: "bad\u{0000}name.txt"))
        @Assert(n.size, 12)
    }

    @TestCase
    func w11UnicodeNamePax(): Unit {
        let uni = "dir/\u{4f60}\u{597d} \u{4e16}\u{754c}.txt"
        @Assert(firstNameOf(writeOne(format: TarEntryFormat.Pax, entryName: uni)), uni)
    }

    @TestCase
    func w12GnuWriterLongnameRoundtrip(): Unit {
        let longName = "gnu/" + "g" * 140 + ".txt"
        let buf = writeOne(format: TarEntryFormat.Gnu, entryName: longName)
        var count = 0
        var got = ""
        for (e in TarReader(buf).iterator()) {
            count += 1
            if (got == "") {
                got = e.name
            }
        }
        @Assert(count, 1)
        @Assert(got, longName)
    }

    @TestCase
    func w13PaxWriterLongnameRoundtrip(): Unit {
        let longName = "pax/" + "q" * 140 + ".txt"
        let buf = writeOne(format: TarEntryFormat.Pax, entryName: longName)
        var count = 0
        var got = ""
        for (e in TarReader(buf).iterator()) {
            count += 1
            if (got == "") {
                got = e.name
            }
        }
        @Assert(count, 1)
        @Assert(got, longName)
    }

    @TestCase
    func w14PaxHugeUidGid(): Unit {
        let src = Path("w_src.txt")
        File.writeTo(src, "payload".toArray())
        var gotUid: Int32 = -1
        var gotGid: Int32 = -1
        var ok = false
        try {
            let buf = ByteBuffer()
            let w = TarWriter(buf, TarEntryFormat.Pax)
            let entry = PaxTarEntry(src)
            entry.uid = 2147483647
            entry.gid = 2147483646
            w.write(entry)
            w.finish()
            for (e in TarReader(buf).iterator()) {
                gotUid = e.uid
                gotGid = e.gid
            }
            ok = gotUid == 2147483647 && gotGid == 2147483646
        } catch (e: TarException) {
            ok = false
        }
        @Assert(ok)
    }
}
