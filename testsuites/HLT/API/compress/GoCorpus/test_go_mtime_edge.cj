/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: negmtime.tar, floatmtime.tar
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
class TestGoMtimeEdge {
    @TestCase
    func negativeMtimeParsesOrTarException(): Unit {
        @Assert(parseKind("negmtime.tar") != "OTHER", true)
    }

    @TestCase
    func floatMtimeSubSecondKept(): Unit {
        var got = ""
        for (e in TarReader(File("floatmtime.tar", Read)).iterator()) {
            got = e.modificationTime.toString()
        }
        @Assert(got, "2023-11-14T22:13:20.5Z")
    }
}
