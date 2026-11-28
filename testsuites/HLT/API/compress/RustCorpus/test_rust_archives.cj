/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: rust_archives_list.txt, 7z_long_path.tar, biguid_gnu.tar, biguid_pax.tar, directory.tar, duplicate_dirs.tar, empty_filename.tar, file_times.tar, link.tar, pax-overrides-extension-header.tar, pax.tar, pax2.tar, pax_size.tar, reading_files.tar, simple.tar, simple_missing_last_header.tar, spaces.tar, sparse-1.tar, sparse-large.tar, sparse.tar, xattrs.tar
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
    }
    return kind
}

@Test
class TestRustArchives {
    @TestCase
    func knownGoodArchivesParse(): Unit {
        @Assert(parseKind("simple.tar") == "OK", true)
        @Assert(parseKind("reading_files.tar") == "OK", true)
        @Assert(parseKind("directory.tar") == "OK", true)
        @Assert(parseKind("pax.tar") == "OK", true)
        @Assert(parseKind("pax2.tar") == "OK", true)
        @Assert(parseKind("link.tar") == "OK", true)
        @Assert(parseKind("file_times.tar") == "OK", true)
        @Assert(parseKind("pax_size.tar") == "OK", true)
        @Assert(parseKind("spaces.tar") == "OK", true)
        @Assert(parseKind("duplicate_dirs.tar") == "OK", true)
        @Assert(parseKind("7z_long_path.tar") == "OK", true)
        @Assert(parseKind("pax-overrides-extension-header.tar") == "OK", true)
        @Assert(parseKind("xattrs.tar") == "OK", true)
        @Assert(parseKind("simple_missing_last_header.tar") == "OK", true)
    }

    @TestCase
    func biguidParseOrTarException(): Unit {
        @Assert(parseKind("biguid_gnu.tar") != "OTHER", true)
        @Assert(parseKind("biguid_pax.tar") != "OTHER", true)
    }
}
