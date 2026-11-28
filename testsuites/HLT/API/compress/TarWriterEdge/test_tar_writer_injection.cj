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
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

class FailAfter <: OutputStream {
    var written: Int64 = 0
    let limit: Int64
    init(limit: Int64) { this.limit = limit }
    public func write(buffer: Array<Byte>): Unit {
        written += buffer.size
        if (written > limit) {
            throw IOException("injected failure")
        }
    }
}

func classifyWriter(): String {
    let sink = FailAfter(1024)
    let w = TarWriter(sink, TarEntryFormat.Gnu)
    let src = Path("wi_src.txt")
    File.writeTo(src, "alpha payload for injection".toArray())
    var r = "OK"
    try {
        w.write(GnuTarEntry(src))
        w.finish()
    } catch (e: TarException) {
        r = "TAREX"
    } catch (e: Exception) {
        r = "OTHER"
    }
    removeIfExists(src)
    return r
}

func classifyArchive(): String {
    let sink = FailAfter(512)
    let dir = Path("wi_dir")
    removeIfExists(dir, recursive: true)
    Directory.create(dir)
    Directory.create(Path("wi_dir/d"))
    File.writeTo(Path("wi_dir/a.txt"), "alpha".toArray())
    File.writeTo(Path("wi_dir/d/b.txt"), "beta".toArray())
    var r = "OK"
    try {
        Tar.archive(fromDir: dir, destStream: sink, includeBaseDirectory: false)
    } catch (e: TarException) {
        r = "TAREX"
    } catch (e: Exception) {
        r = "OTHER"
    }
    removeIfExists(dir, recursive: true)
    return r
}

@Test
class TestTarWriterInjection {
    @TestCase
    func writerDestStreamFailureDocumentedType(): Unit {
        @Assert(classifyWriter(), "TAREX")
    }

    @TestCase
    func archiveDestStreamFailureDocumentedType(): Unit {
        @Assert(classifyArchive(), "TAREX")
    }
}
