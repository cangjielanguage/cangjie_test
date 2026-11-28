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

import std.collection.*
import std.fs.*
import std.io.*
import stdx.compress.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestTarMiscEdges {
    @TestCase
    func writeIterableEntries(): Unit {
        let src = Path("we_src.txt")
        File.writeTo(src, "x".toArray())
        let buf = ByteBuffer()
        let w = TarWriter(buf, TarEntryFormat.Pax)
        let arr = ArrayList<TarEntry>()
        arr.add(PaxTarEntry(src))
        arr.add(PaxTarEntry(src))
        w.write(arr)
        w.finish()
        var count: Int64 = 0
        for (e in TarReader(buf).iterator()) {
            count += 1
        }
        removeIfExists(src)
        @Assert(count, 2)
    }

    @TestCase
    func tarWriterDoubleCloseSilent(): Unit {
        let f = File("we_dc.tar", Write)
        let w = TarWriter(f, TarEntryFormat.Ustar)
        w.close()
        var secondThrew = false
        try {
            w.close()
        } catch (e: Exception) {
            secondThrew = true
        }
        f.close()
        removeIfExists(Path("we_dc.tar"))
        @Assert(!secondThrew)
    }

    @TestCase
    func filterAllEmptyArchiveExtractable(): Unit {
        Directory.create(Path("we_gzdir"))
        File.writeTo(Path("we_gzdir/a.txt"), "x".toArray())
        var ok = false
        try {
            TarGzip.archive(fromDir: Path("we_gzdir"), filter: { _: Path => false },
                destFile: Path("we_empty.tar.gz"), includeBaseDirectory: true)
            TarGzip.extract(fromTarGzip: Path("we_empty.tar.gz"), destDir: Path("we_gz_out"),
                overwrite: true)
            ok = true
        } catch (e: Exception) {
            ok = false
        }
        removeIfExists(Path("we_gzdir"), recursive: true)
        removeIfExists(Path("we_gz_out"), recursive: true)
        removeIfExists(Path("we_empty.tar.gz"))
        @Assert(ok)
    }

    @TestCase
    func includeBaseDirectoryBothLayouts(): Unit {
        Directory.create(Path("we_gzdir"))
        File.writeTo(Path("we_gzdir/a.txt"), "x".toArray())
        var flat = false
        var nested = false
        try {
            TarGzip.archive(fromDir: Path("we_gzdir"), destFile: Path("we_nb.tar.gz"),
                includeBaseDirectory: false)
            TarGzip.extract(fromTarGzip: Path("we_nb.tar.gz"), destDir: Path("we_nb_out"),
                overwrite: true)
            flat = exists(Path("we_nb_out/a.txt"))
            TarGzip.archive(fromDir: Path("we_gzdir"), destFile: Path("we_wb.tar.gz"),
                includeBaseDirectory: true)
            TarGzip.extract(fromTarGzip: Path("we_wb.tar.gz"), destDir: Path("we_wb_out"),
                overwrite: true)
            nested = exists(Path("we_wb_out/we_gzdir/a.txt"))
        } catch (e: Exception) {
            flat = false
            nested = false
        }
        removeIfExists(Path("we_gzdir"), recursive: true)
        removeIfExists(Path("we_nb_out"), recursive: true)
        removeIfExists(Path("we_wb_out"), recursive: true)
        removeIfExists(Path("we_nb.tar.gz"))
        removeIfExists(Path("we_wb.tar.gz"))
        @Assert(flat && nested)
    }
}
