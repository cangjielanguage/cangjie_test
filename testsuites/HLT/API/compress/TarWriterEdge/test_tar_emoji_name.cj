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
class TestTarEmojiName {
    @TestCase
    func emojiNamePaxRoundtrip(): Unit {
        File.writeTo(Path("em_src.txt"), "ok".toArray())
        let emoji = "dir/\u{1F600}\u{1F4C4}.txt"
        let buf = ByteBuffer()
        let w = TarWriter(buf, TarEntryFormat.Pax)
        w.write(Path("em_src.txt"), entryName: emoji)
        w.finish()
        var got = ""
        for (e in TarReader(buf).iterator()) {
            got = e.name
            break
        }
        removeIfExists(Path("em_src.txt"))
        @Assert(got, emoji)
    }

    @TestCase
    func emojiNameTarGzipRoundtrip(): Unit {
        Directory.create(Path("em_gz_src"))
        File.writeTo(Path("em_gz_src/\u{1F600}.txt"), "ok".toArray())
        var ok = false
        try {
            TarGzip.archive(fromDir: Path("em_gz_src"), destFile: Path("em.tar.gz"),
                includeBaseDirectory: false)
            TarGzip.extract(fromTarGzip: Path("em.tar.gz"), destDir: Path("em_out"),
                overwrite: true)
            let data = File.readFrom(Path("em_out/\u{1F600}.txt"))
            ok = data == "ok".toArray()
        } catch (e: Exception) {
            ok = false
        }
        removeIfExists(Path("em_gz_src"), recursive: true)
        removeIfExists(Path("em_out"), recursive: true)
        removeIfExists(Path("em.tar.gz"))
        @Assert(ok)
    }
}
