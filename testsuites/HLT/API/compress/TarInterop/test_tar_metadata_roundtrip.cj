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
class TestTarMetadataRoundtrip {
    @TestCase
    func mtimePreservedThroughTarRoundtrip(): Unit {
        Directory.create(Path("mr_src"))
        File.writeTo(Path("mr_src/m.txt"), "meta".toArray())
        let before = FileInfo("mr_src/m.txt").lastModificationTime
        Tar.archive(fromDir: Path("mr_src"), destFile: Path("mr.tar"), includeBaseDirectory: false)
        Tar.extract(fromTar: Path("mr.tar"), destDir: Path("mr_out"), overwrite: true)
        let after = FileInfo("mr_out/m.txt").lastModificationTime
        removeIfExists(Path("mr_src"), recursive: true)
        removeIfExists(Path("mr_out"), recursive: true)
        removeIfExists(Path("mr.tar"))
        @Assert(after, before)
    }

    @TestCase
    func cjkNamesThroughTarGzip(): Unit {
        Directory.create(Path("mg_src"))
        Directory.create(Path("mg_src/\u{4e2d}\u{6587}\u{76ee}\u{5f55}"))
        File.writeTo(Path("mg_src/\u{4e2d}\u{6587}\u{76ee}\u{5f55}/\u{6587}\u{4ef6}.txt"), "ok".toArray())
        var ok = false
        try {
            TarGzip.archive(fromDir: Path("mg_src"), destFile: Path("mg.tar.gz"),
                includeBaseDirectory: false)
            TarGzip.extract(fromTarGzip: Path("mg.tar.gz"), destDir: Path("mg_out"),
                overwrite: true)
            let data = File.readFrom(Path("mg_out/\u{4e2d}\u{6587}\u{76ee}\u{5f55}/\u{6587}\u{4ef6}.txt"))
            ok = data == "ok".toArray()
        } catch (e: Exception) {
            ok = false
        }
        removeIfExists(Path("mg_src"), recursive: true)
        removeIfExists(Path("mg_out"), recursive: true)
        removeIfExists(Path("mg.tar.gz"))
        @Assert(ok)
    }

    @TestCase
    func emptyFileAndDirRoundtrip(): Unit {
        Directory.create(Path("me_src"))
        Directory.create(Path("me_src/empty_dir"))
        File.create(Path("me_src/empty.txt")).close()
        var emptyOk = false
        var dirOk = false
        try {
            TarGzip.archive(fromDir: Path("me_src"), destFile: Path("me.tar.gz"),
                includeBaseDirectory: false)
            TarGzip.extract(fromTarGzip: Path("me.tar.gz"), destDir: Path("me_out"),
                overwrite: true)
            emptyOk = exists(Path("me_out/empty.txt")) &&
                File.readFrom(Path("me_out/empty.txt")).size == 0
            dirOk = exists(Path("me_out/empty_dir"))
        } catch (e: Exception) {
            emptyOk = false
            dirOk = false
        }
        removeIfExists(Path("me_src"), recursive: true)
        removeIfExists(Path("me_out"), recursive: true)
        removeIfExists(Path("me.tar.gz"))
        @Assert(emptyOk && dirOk)
    }
}
