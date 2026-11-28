/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: gnu-nil-sparse-data.tar, gnu-nil-sparse-hole.tar, gnu-sparse-big.tar, sparse-formats.tar, pax-nil-sparse-data.tar, pax-nil-sparse-hole.tar, pax-sparse-big.tar, gnu-sparse-many-zeros.tar
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

func parseKind(path: String): String {
    var kind = "OK"
    try {
        for (e in TarReader(File(path, Read)).iterator()) {
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
    } catch (e: TarException) {
        kind = "TAREX"
    } catch (e: Exception) {
        kind = "OTHER"
    }
    return kind
}

@Test
class TestGoSparseFormats {
    @TestCase
    func gnuSparseMustParse(): Unit {
        @Assert(parseKind("gnu-nil-sparse-data.tar"), "OK")
        @Assert(parseKind("gnu-nil-sparse-hole.tar"), "OK")
        @Assert(parseKind("gnu-sparse-big.tar"), "OK")
        @Assert(parseKind("sparse-formats.tar"), "OK")
    }

    @TestCase
    func paxSparseParses(): Unit {
        @Assert(parseKind("pax-nil-sparse-data.tar"), "OK")
        @Assert(parseKind("pax-nil-sparse-hole.tar"), "OK")
        @Assert(parseKind("pax-sparse-big.tar"), "OK")
        @Assert(parseKind("gnu-sparse-many-zeros.tar"), "OK")
    }
}
