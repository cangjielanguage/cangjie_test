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
import stdx.compress.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestTarGzipMultimember {
    @TestCase
    func multimemberTarGzipExtractsAll(): Unit {
        let s1 = Path("mg_src1")
        let s2 = Path("mg_src2")
        removeIfExists(s1, recursive: true)
        removeIfExists(s2, recursive: true)
        Directory.create(s1)
        File.writeTo(Path("mg_src1/a.txt"), "alpha".toArray())
        Directory.create(s2)
        File.writeTo(Path("mg_src2/c.txt"), "gamma".toArray())
        TarGzip.archive(fromDir: s1, destFile: Path("mg1.tar.gz"), includeBaseDirectory: true)
        TarGzip.archive(fromDir: s2, destFile: Path("mg2.tar.gz"), includeBaseDirectory: true)
        let m1 = File.readFrom(Path("mg1.tar.gz"))
        let m2 = File.readFrom(Path("mg2.tar.gz"))
        let combo = File.create("mg_combo.tar.gz")
        combo.write(m1)
        combo.write(m2)
        combo.close()
        let out = Path("mg_out")
        removeIfExists(out, recursive: true)
        Directory.create(out)
        var r = "OK"
        try {
            TarGzip.extract(fromTarGzip: Path("mg_combo.tar.gz"), destDir: out, overwrite: false)
        } catch (e: TarException) {
            r = "TAREX"
        } catch (e: Exception) {
            r = "OTHER"
        }
        let got1 = exists(Path("mg_out/mg_src1/a.txt"))
        let got2 = exists(Path("mg_out/mg_src2/c.txt"))
        removeIfExists(s1, recursive: true)
        removeIfExists(s2, recursive: true)
        removeIfExists(Path("mg1.tar.gz"))
        removeIfExists(Path("mg2.tar.gz"))
        removeIfExists(Path("mg_combo.tar.gz"))
        removeIfExists(out, recursive: true)
        @Assert(r, "OK")
        @Assert(got1 && got2)
    }
}
