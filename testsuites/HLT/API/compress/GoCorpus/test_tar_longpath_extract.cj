/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pax_deep260.tar.gz
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestTarLongpathExtract {
    @TestCase
    func longpathExtractViaNormalizationOrTarException(): Unit {
        removeIfExists(Path("lp_dest"), recursive: true)
        Directory.create(Path("lp_dest"))
        var isTarEx = false
        var extracted = false
        try {
            TarGzip.extract(fromTarGzip: Path("pax_deep260.tar.gz"),
                destDir: Path("lp_dest"), overwrite: true)
            extracted = true
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
            println("[issue84] wrong-type exception: ${e.message}")
        }
        var leaf = false
        if (extracted) {
            try {
                let p = Path("lp_dest/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/d/LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
                leaf = exists(p)
            } catch (e: Exception) {
                leaf = false
            }
        }
        removeIfExists(Path("lp_dest"), recursive: true)
        @Assert(isTarEx || (extracted && leaf))
    }
}
