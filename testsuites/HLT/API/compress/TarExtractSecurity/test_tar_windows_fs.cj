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
    let src = Path("wfs_src.txt")
    File.writeTo(src, "x".toArray())
    for ((name, _) in entries) {
        w.write(src, entryName: name)
    }
    w.finish()
    return buf
}

@Test
class TestTarWindowsFs {
    @TestCase
    func adsColonNameMustNotCreateHiddenStream(): Unit {
        removeIfExists(Path("wfs_ads_dest"), recursive: true)
        var threw = false
        try {
            let buf = buildTar([("file.txt:ads", "x")])
            Tar.extract(fromStream: buf, destDir: Path("wfs_ads_dest"), overwrite: true)
        } catch (e: TarException) {
            threw = true
        }
        var hidden = false
        try {
            let data = File.readFrom(Path("wfs_ads_dest/file.txt:ads"))
            if (data.size > 0) {
                hidden = true
            }
        } catch (e: Exception) {
            hidden = false
        }
        removeIfExists(Path("wfs_ads_dest"), recursive: true)
        removeIfExists(Path("wfs_src.txt"))
        @Assert(threw || !hidden)
    }

    @TestCase
    func conReservedNameExtracts(): Unit {
        removeIfExists(Path("wfs_con_dest"), recursive: true)
        var ok = false
        try {
            let buf = buildTar([("CON.txt", "x")])
            Tar.extract(fromStream: buf, destDir: Path("wfs_con_dest"), overwrite: true)
            let data = File.readFrom(Path("wfs_con_dest/CON.txt"))
            ok = data.size == 1
        } catch (e: Exception) {
            ok = false
        }
        removeIfExists(Path("wfs_con_dest"), recursive: true)
        removeIfExists(Path("wfs_src.txt"))
        @Assert(ok)
    }

    @TestCase
    func bareConEntryExtracts(): Unit {
        removeIfExists(Path("wfs_bcon_dest"), recursive: true)
        var ok = false
        try {
            let buf = buildTar([("CON", "x")])
            Tar.extract(fromStream: buf, destDir: Path("wfs_bcon_dest"), overwrite: true)
            let data = File.readFrom(Path("wfs_bcon_dest/CON"))
            ok = data.size == 1
        } catch (e: Exception) {
            ok = false
        }
        removeIfExists(Path("wfs_bcon_dest"), recursive: true)
        removeIfExists(Path("wfs_src.txt"))
        @Assert(ok)
    }

    @TestCase
    func bareNulEntryThrowsTarException(): Unit {
        removeIfExists(Path("wfs_bnul_dest"), recursive: true)
        Directory.create(Path("wfs_bnul_dest"))
        var isTarEx = false
        try {
            let buf = buildTar([("NUL", "x")])
            Tar.extract(fromStream: buf, destDir: Path("wfs_bnul_dest"), overwrite: true)
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
        }
        removeIfExists(Path("wfs_bnul_dest"), recursive: true)
        removeIfExists(Path("wfs_src.txt"))
        @Assert(isTarEx)
    }

    @TestCase
    func bareDotEntryThrowsTarException(): Unit {
        removeIfExists(Path("wfs_bdot_dest"), recursive: true)
        Directory.create(Path("wfs_bdot_dest"))
        var isTarEx = false
        try {
            let buf = buildTar([(".", "x")])
            Tar.extract(fromStream: buf, destDir: Path("wfs_bdot_dest"), overwrite: true)
        } catch (e: TarException) {
            isTarEx = true
        } catch (e: Exception) {
            isTarEx = false
        }
        removeIfExists(Path("wfs_bdot_dest"), recursive: true)
        removeIfExists(Path("wfs_src.txt"))
        @Assert(isTarEx)
    }

    @TestCase
    func caseCollisionOverwriteFalseRejected(): Unit {
        removeIfExists(Path("wfs_cc_dest"), recursive: true)
        var threw = false
        try {
            let buf = buildTar([("A.txt", "one"), ("a.txt", "two")])
            Tar.extract(fromStream: buf, destDir: Path("wfs_cc_dest"), overwrite: false)
        } catch (e: TarException) {
            threw = true
        }
        removeIfExists(Path("wfs_cc_dest"), recursive: true)
        removeIfExists(Path("wfs_src.txt"))
        @Assert(threw)
    }

    @TestCase
    func driveRelativeNameHandledCorrectly(): Unit {
        removeIfExists(Path("wfs_drv_dest"), recursive: true)
        var threw = false
        var intact = false
        try {
            let buf = buildTar([("C:evil.txt", "x")])
            Tar.extract(fromStream: buf, destDir: Path("wfs_drv_dest"), overwrite: true)
        } catch (e: TarException) {
            threw = true
        }
        if (!threw) {
            try {
                let data = File.readFrom(Path("wfs_drv_dest/C:evil.txt"))
                intact = data.size == 1
            } catch (e: Exception) {
                intact = false
            }
        }
        var strayC = false
        try {
            let data = File.readFrom(Path("wfs_drv_dest/C"))
            strayC = true
        } catch (e: Exception) {
            strayC = false
        }
        removeIfExists(Path("wfs_drv_dest"), recursive: true)
        removeIfExists(Path("wfs_src.txt"))
        @Assert((threw || intact) && !strayC)
    }
}
