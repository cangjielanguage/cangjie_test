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
        var count: Int64 = 0
        for (e in TarReader(File(path, Read)).iterator()) {
            count += 1
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
class TestLibarchiveCorpus {
    @TestCase
    func knownGoodSubsetParses(): Unit {
        @Assert(entryCount("test_acl_pax_nfs4.tar"), 3)
        @Assert(entryCount("test_compat_gtar_1.tar"), 2)
        @Assert(entryCount("test_compat_solaris_tar_acl.tar"), 8)
        @Assert(entryCount("test_compat_star_acl_nfs4.tar"), 3)
        @Assert(entryCount("test_compat_tar_directory_1.tar"), 1)
        @Assert(entryCount("test_compat_perl_archive_tar.tar"), 1)
        @Assert(entryCount("test_pax_xattr_header_all.tar"), 1)
        @Assert(entryCount("test_read_format_gtar_sparse_1_17_posix00.tar"), 3)
    }

    @TestCase
    func sparseRejectedCleanly(): Unit {
        @Assert(parseKind("test_read_format_gtar_sparse_1_13.tar"), "TAREX")
        @Assert(parseKind("test_read_format_gtar_sparse_reuse.tar"), "TAREX")
    }

    @TestCase
    func malformedFixturesThrowTarException(): Unit {
        @Assert(parseKind("test_read_format_tar_acl_oob_read.tar"), "TAREX")
        @Assert(parseKind("test_read_format_tar_invalid_pax_size.tar"), "TAREX")
        @Assert(parseKind("test_read_format_tar_pax_timestamps.tar"), "TAREX")
        @Assert(parseKind("test_read_pax_empty_val_no_nl.tar"), "TAREX")
    }

    @TestCase
    func corpusYieldsOnlyTarExceptionOrSuccess(): Unit {
        let list = String.fromUtf8(readToEnd(File("libarchive_list.txt", Read)))
        let others = ArrayList<String>()
        for (line in list.split("\n")) {
            let name = if (line.endsWith("\r")) { line[0..line.size - 1].toString() } else { line }
            if (name.size == 0) {
                continue
            }
            var kind = "OK"
            try {
                let _ = entryCount(name)
            } catch (e: TarException) {
                kind = "TAREX"
            } catch (e: Exception) {
                kind = "OTHER|${e.message}"
            }
            if (kind.startsWith("OTHER")) {
                others.add("${name}")
            }
        }
        for (o in others) {
            println("[OTHER-CORPUS] ${o}")
        }
        @Assert(others.size, 0)
    }

    @TestCase
    func plexusArchiverTarAccepted(): Unit {
        @Assert(parseKind("test_compat_plexus_archiver_tar.tar"), "OK")
    }

    @TestCase
    func hardlinkWithSizeAccepted(): Unit {
        @Assert(parseKind("test_compat_tar_hardlink_1.tar"), "OK")
    }

    @TestCase
    func libarchiveConcatenatedFullyRead(): Unit {
        let n = entryCount("test_read_format_tar_concatenated.tar")
        println("[issue85] concatenated entries=${n}")
        @Assert(n >= 2)
    }

    @TestCase
    func negativeTimePaxNoCrash(): Unit {
        @Assert(parseKind("test_read_format_tar_pax_negative_time.tar") != "OTHER", true)
    }
}
