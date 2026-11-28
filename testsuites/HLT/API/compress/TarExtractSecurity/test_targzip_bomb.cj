/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: gzip_bomb_1G.gz, targzip_many_entries.tar.gz, targzip_deep_nest.tar.gz
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args
// TIMEOUT: 300

import std.fs.*
import std.io.*
import stdx.compress.*
import stdx.compress.tar.*
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

func bufOf(bytes: Array<UInt8>): ByteBuffer {
    let b = ByteBuffer()
    b.write(bytes)
    return b
}

@Test
class TestTarGzipBomb {
    @TestCase
    func gzipBomb1GStreamsCorrectly(): Unit {
        var total: Int64 = -1
        var msg = ""
        try {
            let dis = DecompressInputStream(File("gzip_bomb_1G.gz", Read), wrap: GzipFormat)
            let buf = Array<UInt8>(65536, repeat: 0)
            total = 0
            while (true) {
                let n = dis.read(buf)
                if (n == 0) {
                    break
                }
                total += n
            }
            dis.close()
        } catch (e: ZlibException) {
            msg = e.message
        }
        @Assert(total, 1073741824)
    }

    @TestCase
    func manyEntriesReadable(): Unit {
        let dis = DecompressInputStream(File("targzip_many_entries.tar.gz", Read), wrap: GzipFormat)
        let tar = ByteBuffer()
        let chunk = Array<UInt8>(65536, repeat: 0)
        while (true) {
            let n = dis.read(chunk)
            if (n == 0) {
                break
            }
            tar.write(chunk[0..n])
        }
        dis.close()
        var count: Int64 = 0
        for (e in TarReader(tar).iterator()) {
            count += 1
            if (let Some(s) <- e.stream) {
                let buf = Array<UInt8>(4096, repeat: 0)
                while (true) {
                    let n = s.read(buf)
                    if (n == 0) {
                        break
                    }
                }
            }
        }
        @Assert(count, 10000)
    }

    @TestCase
    func deepNestExtracts(): Unit {
        removeIfExists(Path("bomb_deep_dest"), recursive: true)
        var leafPath = "bomb_deep_dest"
        var i = 0
        while (i < 120) {
            leafPath += "/a"
            i += 1
        }
        leafPath += "/leaf.txt"
        var ok = false
        var msg = ""
        try {
            TarGzip.extract(fromTarGzip: Path("targzip_deep_nest.tar.gz"),
                destDir: Path("bomb_deep_dest"), overwrite: true)
            ok = exists(Path(leafPath))
        } catch (e: TarException) {
            ok = false
        } catch (e: Exception) {
            msg = e.message
            ok = false
        }
        removeIfExists(Path("bomb_deep_dest"), recursive: true)
        @Assert(ok)
    }
}
