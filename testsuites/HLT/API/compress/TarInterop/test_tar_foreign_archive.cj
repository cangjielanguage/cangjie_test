/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: tar_ustar.tar, tar_gnu.tar, tar_pax.tar, tar_ustar_prefix.tar, tar_v7.tar, tar_gnu_traversal.tar, tar_abs_path.tar, targzip_py.tar.gz, bsdtar.tar.gz, gzip_src.bin
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.collection.*
import std.fs.*
import std.io.*
import stdx.compress.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

func drain(s: InputStream): Array<UInt8> {
    let buf = Array<UInt8>(4096, repeat: 0)
    let acc = ArrayList<UInt8>()
    while (true) {
        let n = s.read(buf)
        if (n == 0) {
            break
        }
        var i = 0
        while (i < n) {
            acc.add(buf[i])
            i += 1
        }
    }
    return acc.toArray()
}

func collect(buf: ByteBuffer): ArrayList<(String, Int64, Array<UInt8>)> {
    let out = ArrayList<(String, Int64, Array<UInt8>)>()
    for (e in TarReader(buf).iterator()) {
        var data: Array<UInt8> = []
        if (let Some(s) <- e.stream) {
            data = drain(s)
        }
        out.add((e.name, e.size, data))
    }
    return out
}

func readFixture(path: String): Array<UInt8> {
    return File.readFrom(Path(path))
}

func bufOf(bytes: Array<UInt8>): ByteBuffer {
    let b = ByteBuffer()
    b.write(bytes)
    return b
}

@Test
class TestTarForeignArchive {
    @TestCase
    func x01PythonUstarTar(): Unit {
        let entries = collect(bufOf(readFixture("tar_ustar.tar")))
        @Assert(entries.size, 2)
        let text = readFixture("gzip_src.bin")
        @Assert(entries[0][0], "dir_a/hello.txt")
        @Assert(entries[0][1], 1024)
        @Assert(entries[0][2] == text[0..1024], true)
        @Assert(entries[1][1], 4)
    }

    @TestCase
    func x02PythonGnuLongname(): Unit {
        let entries = collect(bufOf(readFixture("tar_gnu.tar")))
        @Assert(entries.size, 1)
        @Assert(entries[0][0].size, 138)
        @Assert(entries[0][2].size, 21)
    }

    @TestCase
    func x03PythonPaxTar(): Unit {
        let buf = ByteBuffer()
        buf.write(readFixture("tar_pax.tar"))
        var nameLen = 0
        var mykey = "?"
        var count = 0
        for (e in TarReader(buf).iterator()) {
            count += 1
            if (nameLen == 0) {
                nameLen = e.name.size
            }
            if (let Some(p) <- (e as PaxTarEntry)) {
                if (let Some(v) <- p.getPaxData("mykey")) {
                    mykey = v
                }
            }
        }
        @Assert(count, 2)
        @Assert(nameLen, 158)
        @Assert(mykey, "myvalue123")
    }

    @TestCase
    func x04PythonUstarPrefixSplit(): Unit {
        let entries = collect(bufOf(readFixture("tar_ustar_prefix.tar")))
        @Assert(entries.size, 1)
        @Assert(entries[0][0], "p/" * 80 + "leaf.txt")
        @Assert(entries[0][2], "prefixed".toArray())
    }

    @TestCase
    func x05BsdtarV7Tar(): Unit {
        let entries = collect(bufOf(readFixture("tar_v7.tar")))
        var dataLen: Int64 = -1
        for (e in entries) {
            if (e[0].endsWith("one.txt")) {
                dataLen = e[2].size
            }
        }
        @Assert(dataLen, 10)
    }

    @TestCase
    func x06PythonTraversalRejected(): Unit {
        cleanupDir0("hlt_x6")
        removeIfExists(Path("evil_traversal.txt"))
        removeIfExists(Path("evil_dotdot.txt"))
        var threw = false
        var leaked = false
        try {
            Tar.extract(fromTar: Path("tar_gnu_traversal.tar"), destDir: Path("hlt_x6"), overwrite: true)
            if (exists(Path("evil_traversal.txt")) || exists(Path("evil_dotdot.txt"))) {
                leaked = true
            }
        } catch (e: TarException) {
            threw = true
        }
        removeIfExists(Path("evil_traversal.txt"))
        removeIfExists(Path("evil_dotdot.txt"))
        cleanupDir0("hlt_x6")
        @Assert(threw || !leaked)
        @Assert(threw)
    }

    @TestCase
    func x07PythonAbsPathTarException(): Unit {
        cleanupDir0("hlt_x7")
        removeIfExists(Path("abs_evil_posix.txt"))
        var isTarEx = false
        var leaked = false
        try {
            Tar.extract(fromTar: Path("tar_abs_path.tar"), destDir: Path("hlt_x7"), overwrite: true)
            if (exists(Path("abs_evil_posix.txt"))) {
                leaked = true
            }
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
        }
        removeIfExists(Path("abs_evil_posix.txt"))
        cleanupDir0("hlt_x7")
        @Assert(!leaked)
        @Assert(isTarEx)
    }

    @TestCase
    func x08PythonTarGz(): Unit {
        cleanupDir0("hlt_x8")
        TarGzip.extract(fromTarGzip: Path("targzip_py.tar.gz"), destDir: Path("hlt_x8"), overwrite: true)
        let one = File.readFrom(Path("hlt_x8/tgz/one.txt"))
        let two = File.readFrom(Path("hlt_x8/tgz/two.txt"))
        let emptyIsDir = exists(Path("hlt_x8/tgz/empty_dir"))
        cleanupDir0("hlt_x8")
        @Assert(one.size, 2048)
        @Assert(two, "two".toArray())
        @Assert(emptyIsDir, true)
    }

    @TestCase
    func x09BsdtarTarGz(): Unit {
        cleanupDir0("hlt_x9")
        TarGzip.extract(fromTarGzip: Path("bsdtar.tar.gz"), destDir: Path("hlt_x9"), overwrite: true)
        let one = File.readFrom(Path("hlt_x9/one.txt"))
        let two = File.readFrom(Path("hlt_x9/sub/two.txt"))
        cleanupDir0("hlt_x9")
        @Assert(one, "bsdtar one".toArray())
        @Assert(two, "bsdtar two".toArray())
    }
}

func cleanupDir0(dir: String): Unit {
    removeIfExists(Path(dir), recursive: true)
}
