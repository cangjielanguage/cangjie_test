/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: gnu-multi-hdrs.tar, nil-uid.tar, pax-multi-hdrs.tar, pax-path-hdr.tar, pax-pos-size-file.tar, ustar-file-reg.tar
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

func parseEntries(path: String): Int64 {
    var count: Int64 = 0
    for (e in TarReader(File(path, Read)).iterator()) {
        count += 1
        if (let Some(s) <- e.stream) {
            let buf = Array<UInt8>(4096, repeat: 0)
            while (true) {
                let n = s.read(buf)
                if (n == 0) {
                    break
                }
            }
        }
    }
    return count
}

func parses(path: String): Bool {
    var ok = false
    try {
        let _ = parseEntries(path)
        ok = true
    } catch (e: TarException) {
        ok = false
    }
    return ok
}

@Test
class TestGoNoEndBlocks {
    @TestCase
    func withEndBlocksStillParses(): Unit {
        @Assert(parses("ustar.tar"), true)
    }

    @TestCase
    func missingEndBlocksTolerated(): Unit {
        @Assert(parses("gnu-multi-hdrs.tar"), true)
        @Assert(parses("nil-uid.tar"), true)
        @Assert(parses("pax-multi-hdrs.tar"), true)
        @Assert(parses("pax-path-hdr.tar"), true)
        @Assert(parses("pax-pos-size-file.tar"), true)
        @Assert(parses("ustar-file-reg.tar"), true)
    }
}
