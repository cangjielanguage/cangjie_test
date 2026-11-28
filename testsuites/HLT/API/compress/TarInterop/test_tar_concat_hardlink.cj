/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: hardlink.tar
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestTarConcatHardlink {
    @TestCase
    func concatenatedTarsFullyRead(): Unit {
        let src = Path("ch_src.txt")
        File.writeTo(src, "PAYLOAD-DATA".toArray())
        let a = ByteBuffer()
        let wa = TarWriter(a, TarEntryFormat.Gnu)
        wa.write(src, entryName: "a_only.txt")
        wa.finish()
        let b = ByteBuffer()
        let wb = TarWriter(b, TarEntryFormat.Gnu)
        wb.write(src, entryName: "b_only.txt")
        wb.finish()
        let both = ByteBuffer()
        both.write(readToEnd(a))
        both.write(readToEnd(b))
        var count: Int64 = 0
        var sawB = false
        for (e in TarReader(both).iterator()) {
            count += 1
            if (e.name == "b_only.txt") {
                sawB = true
            }
            if (let Some(s) <- e.stream) {
                let one = Array<UInt8>(4096, repeat: 0)
                while (true) {
                    let n = s.read(one)
                    if (n == 0) {
                        break
                    }
                }
            }
        }
        removeIfExists(src)
        @Assert(count, 2)
        @Assert(sawB, true)
    }

    @TestCase
    func hardlinkExtractCreatesRealHardlink(): Unit {
        removeIfExists(Path("ch_hl"), recursive: true)
        var ok = false
        try {
            Tar.extract(fromTar: Path("hardlink.tar"), destDir: Path("ch_hl"), overwrite: true)
            let f1 = Path("ch_hl/file.txt")
            let f2 = Path("ch_hl/hard.txt")
            if (exists(f1) && exists(f2)) {
                File.writeTo(f1, "CHANGED".toArray())
                ok = String.fromUtf8(File.readFrom(f2)) == "CHANGED"
            }
        } catch (e: Exception) {
            ok = false
        }
        removeIfExists(Path("ch_hl"), recursive: true)
        @Assert(ok)
    }
}
