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

func buildTar(entries: Array<(String, String)>): ByteBuffer {
    let buf = ByteBuffer()
    let w = TarWriter(buf, TarEntryFormat.Gnu)
    let src = Path("sec_src.txt")
    File.writeTo(src, "sec".toArray())
    for ((name, _) in entries) {
        w.write(src, entryName: name)
    }
    w.finish()
    return buf
}

func cleanupDir(dir: String): Unit {
    removeIfExists(Path(dir), recursive: true)
}

@Test
class TestTarExtractSecurity {
    @TestCase
    func s01DotdotEscapeRejected(): Unit {
        cleanupDir("hlt_s1")
        removeIfExists(Path("evil_esc.txt"))
        var threw = false
        var leaked = false
        try {
            let buf = buildTar([("../evil_esc.txt", "x")])
            Tar.extract(fromStream: buf, destDir: "hlt_s1", overwrite: true)
            if (exists(Path("evil_esc.txt"))) {
                leaked = true
            }
        } catch (e: TarException) {
            threw = true
        }
        removeIfExists(Path("evil_esc.txt"))
        cleanupDir("hlt_s1")
        @Assert(threw || !leaked)
        @Assert(threw)
    }

    @TestCase
    func s02NestedDotdotRejected(): Unit {
        cleanupDir("hlt_s2")
        removeIfExists(Path("evil2.txt"))
        var threw = false
        var leaked = false
        try {
            let buf = buildTar([("a/../../evil2.txt", "x")])
            Tar.extract(fromStream: buf, destDir: "hlt_s2", overwrite: true)
            if (exists(Path("evil2.txt"))) {
                leaked = true
            }
        } catch (e: TarException) {
            threw = true
        }
        removeIfExists(Path("evil2.txt"))
        cleanupDir("hlt_s2")
        @Assert(threw || !leaked)
        @Assert(threw)
    }

    @TestCase
    func s03AbsolutePathTarException(): Unit {
        cleanupDir("hlt_s3")
        removeIfExists(Path("abs_evil_posix.txt"))
        var isTarEx = false
        var leaked = false
        try {
            let buf = buildTar([("/abs_evil_posix.txt", "a")])
            Tar.extract(fromStream: buf, destDir: "hlt_s3", overwrite: true)
            if (exists(Path("abs_evil_posix.txt"))) {
                leaked = true
            }
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
        }
        removeIfExists(Path("abs_evil_posix.txt"))
        cleanupDir("hlt_s3")
        @Assert(!leaked)
        @Assert(isTarEx)
    }

    @TestCase
    func s04FileDirClashThrows(): Unit {
        cleanupDir("hlt_s4")
        var threw = false
        try {
            let buf = buildTar([("clash", "x"), ("clash/sub.txt", "y")])
            Tar.extract(fromStream: buf, destDir: "hlt_s4", overwrite: false)
        } catch (e: Exception) {
            threw = true
        }
        cleanupDir("hlt_s4")
        @Assert(threw)
    }

    @TestCase
    func s05OverwriteSemantics(): Unit {
        cleanupDir("hlt_s5")
        let buf = buildTar([("ok1.txt", "x"), ("sub/ok2.txt", "y")])
        buf.seek(Begin(0))
        Tar.extract(fromStream: buf, destDir: "hlt_s5", overwrite: true)
        var firstThrew = false
        buf.seek(Begin(0))
        try {
            Tar.extract(fromStream: buf, destDir: "hlt_s5", overwrite: false)
        } catch (e: TarException) {
            firstThrew = true
        }
        buf.seek(Begin(0))
        Tar.extract(fromStream: buf, destDir: "hlt_s5", overwrite: true)
        let ok = firstThrew && exists(Path("hlt_s5/ok1.txt")) && exists(Path("hlt_s5/sub/ok2.txt"))
        cleanupDir("hlt_s5")
        @Assert(ok)
    }

    @TestCase
    func s06BackslashNameNoCrash(): Unit {
        cleanupDir("hlt_s6")
        var ok = false
        try {
            let buf = buildTar([("dir\\evil_bslash.txt", "x")])
            Tar.extract(fromStream: buf, destDir: "hlt_s6", overwrite: true)
            ok = true
        } catch (e: Exception) {
            ok = false
        }
        cleanupDir("hlt_s6")
        @Assert(ok)
    }

    @TestCase
    func s07DeepSubdirsCreated(): Unit {
        cleanupDir("hlt_s7")
        let buf = buildTar([("deep/a/b/c/d.txt", "x")])
        Tar.extract(fromStream: buf, destDir: "hlt_s7", overwrite: true)
        let ok = exists(Path("hlt_s7/deep/a/b/c/d.txt"))
        cleanupDir("hlt_s7")
        @Assert(ok)
    }
}
