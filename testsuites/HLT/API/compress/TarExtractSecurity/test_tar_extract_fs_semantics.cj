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
class TestTarExtractFsSemantics {
    @TestCase
    func readOnlyOverwriteThrowsTarException(): Unit {
        removeIfExists(Path("fs_ro_dest"), recursive: true)
        Directory.create(Path("fs_ro_dest"))
        File.writeTo(Path("fs_ro_dest/ro.txt"), "old".toArray())
        FileInfo("fs_ro_dest/ro.txt").setWritable(false)
        let src = Path("fs_ro_src.txt")
        File.writeTo(src, "new".toArray())
        let buf = ByteBuffer()
        let w = TarWriter(buf, TarEntryFormat.Gnu)
        w.write(src, entryName: "ro.txt")
        w.finish()
        var isTarEx = false
        try {
            Tar.extract(fromStream: buf, destDir: Path("fs_ro_dest"), overwrite: true)
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
        }
        FileInfo("fs_ro_dest/ro.txt").setWritable(true)
        removeIfExists(Path("fs_ro_dest"), recursive: true)
        removeIfExists(src)
        @Assert(isTarEx)
    }

    @TestCase
    func zeroByteGzThrowsTarException(): Unit {
        File.create(Path("fs_zero.tar.gz")).close()
        removeIfExists(Path("fs_zdest"), recursive: true)
        Directory.create(Path("fs_zdest"))
        var isTarEx = false
        try {
            TarGzip.extract(fromTarGzip: Path("fs_zero.tar.gz"), destDir: Path("fs_zdest"),
                overwrite: true)
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
        }
        removeIfExists(Path("fs_zdest"), recursive: true)
        removeIfExists(Path("fs_zero.tar.gz"))
        @Assert(isTarEx)
    }

    @TestCase
    func emptyTarThrowsTarException(): Unit {
        File.create(Path("fs_empty.tar")).close()
        removeIfExists(Path("fs_edest"), recursive: true)
        Directory.create(Path("fs_edest"))
        var isTarEx = false
        try {
            Tar.extract(fromTar: Path("fs_empty.tar"), destDir: Path("fs_edest"), overwrite: true)
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
        }
        removeIfExists(Path("fs_edest"), recursive: true)
        removeIfExists(Path("fs_empty.tar"))
        @Assert(isTarEx)
    }
}
