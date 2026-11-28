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

func drain(s: InputStream): Int64 {
    let buf = Array<UInt8>(4096, repeat: 0)
    var total: Int64 = 0
    while (true) {
        let n = s.read(buf)
        if (n == 0) {
            break
        }
        total += n
    }
    return total
}

func parseKind(path: String): String {
    var kind = "OK"
    try {
        for (e in TarReader(File(path, Read)).iterator()) {
            if (let Some(s) <- e.stream) {
                let _ = drain(s)
            }
        }
    } catch (e: TarException) {
        kind = "TAREX"
    } catch (e: Exception) {
        kind = "OTHER"
        println("[OTHER] ${path}: ${e.message}")
    }
    return kind
}

func entryCount(path: String): Int64 {
    var count: Int64 = 0
    for (e in TarReader(File(path, Read)).iterator()) {
        count += 1
        if (let Some(s) <- e.stream) {
            let _ = drain(s)
        }
    }
    return count
}

@Test
class TestGnuNativeMatrix {
    @TestCase
    func gnuNativeBasicsParse(): Unit {
        @Assert(entryCount("m_gnu.tar"), 4)
        @Assert(entryCount("m_ustar.tar"), 4)
        @Assert(entryCount("m_posix.tar"), 4)
        @Assert(entryCount("m_split.tar"), 1)
        @Assert(entryCount("m_vol_gnu.tar"), 1)
        @Assert(entryCount("m_vol_posix.tar"), 1)
        var cjkSeen = false
        for (e in TarReader(File("m_gnu.tar", Read)).iterator()) {
            if (e.name == "cjk_中文名.txt") {
                cjkSeen = true
            }
        }
        @Assert(cjkSeen)
        var v7Typed = false
        for (e in TarReader(File("m_v7.tar", Read)).iterator()) {
            if (e.name == "a.txt" && e.entryType == TarEntryType.V7RegularFile) {
                v7Typed = true
            }
        }
        @Assert(v7Typed)
    }

    @TestCase
    func gnuKLonglinkLinkNameExact(): Unit {
        let expect = "H" + "l" * 148 + ".txt"
        var got = ""
        var gotType = ""
        for (e in TarReader(File("mh_gnu.tar", Read)).iterator()) {
            if (e.entryType == TarEntryType.HardLink) {
                got = e.linkName
                gotType = "${e.entryType}"
            }
        }
        @Assert(gotType, "TarEntryType.HardLink")
        @Assert(got, expect)
    }

    @TestCase
    func gnuLLongnameNoTrailingByte(): Unit {
        let expect = "L" + "n" * 148 + ".txt"
        var got = ""
        for (e in TarReader(File("ml_gnu.tar", Read)).iterator()) {
            got = e.name
            break
        }
        @Assert(got, expect)
    }

    @TestCase
    func incrementalArchiveYieldsEntries(): Unit {
        @Assert(entryCount("m_inc0.tar") >= 2)
        @Assert(entryCount("m_inc1.tar") >= 2)
    }

    @TestCase
    func paxSparseNameRealsizeApplied(): Unit {
        for (e in TarReader(File("m_sp_pos.tar", Read)).iterator()) {
            @Assert(e.name, "sp.bin")
            @Assert(e.size, 1048579)
        }
    }

    @TestCase
    func multivolumeCleanRejection(): Unit {
        @Assert(parseKind("m_mv1.tar"), "TAREX")
        @Assert(parseKind("m_mv2.tar"), "TAREX")
    }

    @TestCase
    func gnuBase256UidAccepted(): Unit {
        @Assert(parseKind("mu_gnu.tar"), "OK")
    }

    @TestCase
    func oldSparseRejectedCleanly(): Unit {
        @Assert(parseKind("m_sp_def.tar"), "TAREX")
        @Assert(parseKind("m_sp_gnu.tar"), "TAREX")
    }
}
