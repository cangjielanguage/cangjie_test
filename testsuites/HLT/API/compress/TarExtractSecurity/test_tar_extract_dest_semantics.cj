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
import stdx.compress.TarGzip
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestTarExtractDestSemantics {
    @TestCase
    func destDirIsFileThrowsTarException(): Unit {
        File.writeTo(Path("ds_destfile.txt"), "iamfile".toArray())
        let src = Path("ds_src.txt")
        File.writeTo(src, "x".toArray())
        let buf = ByteBuffer()
        let w = TarWriter(buf, TarEntryFormat.Gnu)
        w.write(src, entryName: "only.txt")
        w.finish()
        var isTarEx = false
        try {
            Tar.extract(fromStream: buf, destDir: Path("ds_destfile.txt"), overwrite: true)
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
        }
        removeIfExists(Path("ds_destfile.txt"))
        removeIfExists(src)
        @Assert(isTarEx)
    }

    @TestCase
    func emptyDirArchiveBothLayouts(): Unit {
        Directory.create(Path("ds_emptydir"))
        var incTrue = false
        var incFalse = false
        try {
            TarGzip.archive(fromDir: Path("ds_emptydir"), destFile: Path("ds_ed_true.tar.gz"),
                includeBaseDirectory: true)
            TarGzip.extract(fromTarGzip: Path("ds_ed_true.tar.gz"), destDir: Path("ds_ed_true_out"),
                overwrite: true)
            incTrue = exists(Path("ds_ed_true_out/ds_emptydir"))
            TarGzip.archive(fromDir: Path("ds_emptydir"), destFile: Path("ds_ed_false.tar.gz"),
                includeBaseDirectory: false)
            TarGzip.extract(fromTarGzip: Path("ds_ed_false.tar.gz"), destDir: Path("ds_ed_false_out"),
                overwrite: true)
            incFalse = exists(Path("ds_ed_false_out")) &&
                !exists(Path("ds_ed_false_out/ds_emptydir"))
        } catch (e: Exception) {
            incTrue = false
            incFalse = false
        }
        removeIfExists(Path("ds_emptydir"), recursive: true)
        removeIfExists(Path("ds_ed_true_out"), recursive: true)
        removeIfExists(Path("ds_ed_false_out"), recursive: true)
        removeIfExists(Path("ds_ed_true.tar.gz"))
        removeIfExists(Path("ds_ed_false.tar.gz"))
        @Assert(incTrue && incFalse)
    }
}
