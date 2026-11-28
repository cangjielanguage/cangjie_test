/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: go_testdata_list.txt, file-and-dir.tar, gnu-incremental.tar, gnu-long-nul.tar, gnu-multi-hdrs.tar, gnu-nil-sparse-data.tar, gnu-nil-sparse-hole.tar, gnu-not-utf8.tar, gnu-sparse-big.tar, gnu-sparse-many-zeros.tar, gnu-utf8.tar, gnu.tar, hardlink.tar, hdr-only.tar, invalid-go17.tar, issue10968.tar, issue11169.tar, issue12435.tar, neg-size.tar, nil-uid.tar, pax-bad-hdr-file.tar, pax-bad-hdr-large.tar, pax-bad-mtime-file.tar, pax-global-records.tar, pax-multi-hdrs.tar, pax-nil-sparse-data.tar, pax-nil-sparse-hole.tar, pax-nul-path.tar, pax-nul-xattrs.tar, pax-path-hdr.tar, pax-pos-size-file.tar, pax-records.tar, pax-sparse-big.tar, pax.tar, sparse-formats.tar, star.tar, trailing-slash.tar, ustar-file-devs.tar, ustar-file-reg.tar, ustar.tar, v7.tar, writer-big-long.tar, writer-big.tar, writer.tar, xattrs.tar
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.collection.*
import std.fs.*
import std.io.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

func drainCount(s: InputStream): Int64 {
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

func countEntries(path: String): Int64 {
    var count: Int64 = 0
    for (e in TarReader(File(path, Read)).iterator()) {
        count += 1
        if (let Some(s) <- e.stream) {
            let _ = drainCount(s)
        }
    }
    return count
}

@Test
class TestGoCorpus {
    @TestCase
    func knownGoodArchivesParse(): Unit {
        @Assert(countEntries("ustar.tar"), 1)
        @Assert(countEntries("v7.tar"), 2)
        @Assert(countEntries("gnu.tar"), 2)
        @Assert(countEntries("pax.tar"), 2)
        @Assert(countEntries("star.tar"), 2)
        @Assert(countEntries("writer.tar"), 3)
        @Assert(countEntries("file-and-dir.tar"), 2)
        @Assert(countEntries("hardlink.tar"), 2)
        @Assert(countEntries("hdr-only.tar"), 13)
        @Assert(countEntries("pax-global-records.tar"), 4)
        @Assert(countEntries("xattrs.tar"), 2)
        @Assert(countEntries("gnu-long-nul.tar"), 1)
        @Assert(countEntries("pax-records.tar"), 1)
    }

    @TestCase
    func corpusYieldsOnlyTarExceptionOrSuccess(): Unit {
        let raw = String.fromUtf8(readToEnd(File("go_testdata_list.txt", Read)))
        let others = ArrayList<String>()
        for (line in raw.split("\n")) {
            let name = if (line.endsWith("\r")) { line[0..line.size - 1].toString() } else { line }
            if (name.size == 0) {
                continue
            }
            try {
                let _ = countEntries(name)
            } catch (e: TarException) {
            } catch (e: Exception) {
                others.add("${name}: ${e.message}")
            }
        }
        for (o in others) {
        }
        @Assert(others.size, 0)
    }
}
