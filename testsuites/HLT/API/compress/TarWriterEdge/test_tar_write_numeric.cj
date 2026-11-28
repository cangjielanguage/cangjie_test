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

@Test
class TestTarWriteNumeric {
    @TestCase
    func gnuHugeUidEncodedAsBase256(): Unit {
        let src = Path("wn_src.txt")
        File.writeTo(src, "x".toArray())
        var ok = false
        try {
            let buf = ByteBuffer()
            let w = TarWriter(buf, TarEntryFormat.Gnu)
            let entry = GnuTarEntry(src)
            entry.uid = 2147483647
            w.write(entry)
            w.finish()
            var gotUid: Int32 = -1
            for (e in TarReader(buf).iterator()) {
                gotUid = e.uid
            }
            ok = gotUid == 2147483647
        } catch (e: TarException) {
            ok = false
        }
        removeIfExists(src)
        @Assert(ok)
    }

    @TestCase
    func ustarHugeUidRejected(): Unit {
        let src = Path("wn_src.txt")
        File.writeTo(src, "x".toArray())
        var threw = false
        try {
            let buf = ByteBuffer()
            let w = TarWriter(buf, TarEntryFormat.Ustar)
            let entry = UstarTarEntry(src)
            entry.uid = 2147483647
            w.write(entry)
            w.finish()
        } catch (e: TarException) {
            threw = true
        }
        removeIfExists(src)
        @Assert(threw)
    }

    @TestCase
    func gnuSmallUidGidRoundtrip(): Unit {
        let src = Path("wn_src.txt")
        File.writeTo(src, "x".toArray())
        var ok = false
        try {
            let buf = ByteBuffer()
            let w = TarWriter(buf, TarEntryFormat.Gnu)
            let entry = GnuTarEntry(src)
            entry.uid = 1001
            entry.gid = 1002
            w.write(entry)
            w.finish()
            var gotUid: Int32 = -1
            var gotGid: Int32 = -1
            for (e in TarReader(buf).iterator()) {
                gotUid = e.uid
                gotGid = e.gid
            }
            ok = gotUid == 1001 && gotGid == 1002
        } catch (e: TarException) {
            ok = false
        }
        removeIfExists(src)
        @Assert(ok)
    }

    @TestCase
    func paxSmallUidGidRoundtrip(): Unit {
        let src = Path("wn_src.txt")
        File.writeTo(src, "x".toArray())
        var ok = false
        try {
            let buf = ByteBuffer()
            let w = TarWriter(buf, TarEntryFormat.Pax)
            let entry = PaxTarEntry(src)
            entry.uid = 1001
            entry.gid = 1002
            w.write(entry)
            w.finish()
            var gotUid: Int32 = -1
            var gotGid: Int32 = -1
            for (e in TarReader(buf).iterator()) {
                gotUid = e.uid
                gotGid = e.gid
            }
            ok = gotUid == 1001 && gotGid == 1002
        } catch (e: TarException) {
            ok = false
        }
        removeIfExists(src)
        @Assert(ok)
    }
}
