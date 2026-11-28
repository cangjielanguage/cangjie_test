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
// TIMEOUT: 60

import std.fs.*
import std.io.*
import stdx.compress.*
import stdx.compress.tar.*
import std.time.*
import std.env.*
import std.unittest.*
import std.unittest.testmacro.*

func startWatchdog(file: String, limitMb: Int64): Unit {
    spawn {
        while (true) {
            sleep(Duration.millisecond * 200)
            var sz: Int64 = -1
            try {
                sz = FileInfo(Path(file)).size
            } catch (e: Exception) {
                sz = -1
            }
            if (sz > limitMb * 1024 * 1024) {
                exit(9)
            }
        }
    }
}

@Test
class TestTarSelfInclusion {
    @TestCase
    func tarGzipSelfInclusionExcluded(): Unit {
        removeIfExists(Path("si_gz"), recursive: true)
        Directory.create(Path("si_gz"))
        File.writeTo(Path("si_gz/a.txt"), "payload0".toArray())
        var ok = false
        try {
            TarGzip.archive(fromDir: Path("si_gz"), destFile: Path("si_gz/out.tar.gz"),
                includeBaseDirectory: false)
            let sz = FileInfo(Path("si_gz/out.tar.gz")).size
            ok = sz > 0 && sz < 1024 * 1024
        } catch (e: Exception) {
            ok = false
        }
        removeIfExists(Path("si_gz"), recursive: true)
        @Assert(ok)
    }

    @TestCase
    func tarArchiveSelfInclusionTerminates(): Unit {
        removeIfExists(Path("si_tar"), recursive: true)
        Directory.create(Path("si_tar"))
        File.writeTo(Path("si_tar/a.txt"), "payload0".toArray())
        startWatchdog("si_tar/out.tar", 20)
        var finished = false
        var threw = false
        try {
            Tar.archive(fromDir: Path("si_tar"), destFile: Path("si_tar/out.tar"),
                includeBaseDirectory: false)
            finished = true
        } catch (e: TarException) {
            threw = true
        }
        var sz: Int64 = -1
        try {
            sz = FileInfo(Path("si_tar/out.tar")).size
        } catch (e: Exception) {
            sz = -1
        }
        removeIfExists(Path("si_tar"), recursive: true)
        @Assert((finished || threw) && sz < 1024 * 1024)
    }
}
