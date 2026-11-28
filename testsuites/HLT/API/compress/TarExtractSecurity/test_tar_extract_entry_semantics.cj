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

func fillStr(dst: Array<UInt8>, off: Int64, s: String): Unit {
    let b = s.toArray()
    var i = 0
    while (i < b.size) { dst[off + i] = b[i]; i += 1 }
}

func fillOctal(dst: Array<UInt8>, off: Int64, v: Int64, width: Int64): Unit {
    var i = width - 2
    var x = v
    while (i >= 0) { dst[off + i] = UInt8(48 + (x % 8)); x = x / 8; i -= 1 }
    dst[off + width - 1] = 0
}

func header(name: String, size: Int64, flag: UInt8, linkName!: String = ""): Array<UInt8> {
    let h = Array<UInt8>(512, repeat: 0)
    fillStr(h, 0, name)
    fillOctal(h, 100, 0o644, 8)
    fillOctal(h, 108, 1001, 8)
    fillOctal(h, 116, 1002, 8)
    fillOctal(h, 124, size, 12)
    fillOctal(h, 136, 1700000000, 12)
    if (linkName.size > 0) { fillStr(h, 157, linkName) }
    var i = 148
    while (i < 156) { h[i] = 32; i += 1 }
    h[156] = flag
    fillStr(h, 257, "ustar\0")
    h[263] = 48
    h[264] = 48
    var sum: Int64 = 0
    i = 0
    while (i < 512) { sum += if (i >= 148 && i < 156) { 32 } else { Int64(h[i]) }; i += 1 }
    fillOctal(h, 148, sum, 7)
    h[154] = 0
    h[155] = 32
    return h
}

func dataBlock(s: String): Array<UInt8> {
    let raw = s.toArray()
    let b = Array<UInt8>((raw.size + 511) / 512 * 512, repeat: 0)
    var i = 0
    while (i < raw.size) { b[i] = raw[i]; i += 1 }
    return b
}

func writeArchive(name: String, parts: Array<Array<UInt8>>): Unit {
    let f = File.create(name)
    for (p in parts) { f.write(p) }
    f.close()
}

func extractTo(arch: String, dest: String, overwrite: Bool): String {
    let d = Path(dest)
    removeIfExists(d, recursive: true)
    Directory.create(d)
    var r = "OK"
    try {
        Tar.extract(fromTar: Path(arch), destDir: d, overwrite: overwrite)
    } catch (e: TarException) {
        r = "TAREX"
    } catch (e: Exception) {
        r = "OTHER"
    }
    return r
}

func fileContent(dir: String, rel: String): String {
    let p = Path(dir + "/" + rel)
    if (!exists(p)) {
        return "(absent)"
    }
    return String.fromUtf8(File.readFrom(p))
}

@Test
class TestTarExtractEntrySemantics {
    @TestCase
    func dirsAfterFileAccepted(): Unit {
        writeArchive("es_dirafter.tar", [
            header("a/b.txt", 5, UInt8(0x30)), dataBlock("hello"),
            header("a/", 0, UInt8(0x35)),
            Array<UInt8>(1024, repeat: 0)
        ])
        let r = extractTo("es_dirafter.tar", "es_x1", false)
        removeIfExists(Path("es_dirafter.tar"))
        removeIfExists(Path("es_x1"), recursive: true)
        @Assert(r, "OK")
    }

    @TestCase
    func parentDirsAutoCreated(): Unit {
        writeArchive("es_nodir.tar", [
            header("a/b.txt", 5, UInt8(0x30)), dataBlock("hello"),
            Array<UInt8>(1024, repeat: 0)
        ])
        let r = extractTo("es_nodir.tar", "es_x1b", false)
        let c = fileContent("es_x1b", "a/b.txt")
        removeIfExists(Path("es_nodir.tar"))
        removeIfExists(Path("es_x1b"), recursive: true)
        @Assert(r, "OK")
        @Assert(c, "hello")
    }

    @TestCase
    func duplicateLastWinsWithOverwrite(): Unit {
        writeArchive("es_dup.tar", [
            header("dup.txt", 5, UInt8(0x30)), dataBlock("first"),
            header("dup.txt", 7, UInt8(0x30)), dataBlock("second!"),
            Array<UInt8>(1024, repeat: 0)
        ])
        let r = extractTo("es_dup.tar", "es_x2", true)
        let c = fileContent("es_x2", "dup.txt")
        removeIfExists(Path("es_dup.tar"))
        removeIfExists(Path("es_x2"), recursive: true)
        @Assert(r, "OK")
        @Assert(c, "second!")
    }

    @TestCase
    func duplicateRejectedWithoutOverwrite(): Unit {
        writeArchive("es_dup.tar", [
            header("dup.txt", 5, UInt8(0x30)), dataBlock("first"),
            header("dup.txt", 7, UInt8(0x30)), dataBlock("second!"),
            Array<UInt8>(1024, repeat: 0)
        ])
        let r = extractTo("es_dup.tar", "es_x2b", false)
        removeIfExists(Path("es_dup.tar"))
        removeIfExists(Path("es_x2b"), recursive: true)
        @Assert(r, "TAREX")
    }

    @TestCase
    func danglingHardlinkNoEscape(): Unit {
        writeArchive("es_dang.tar", [
            header("h.txt", 0, UInt8(0x31), linkName: "missing.txt"),
            Array<UInt8>(1024, repeat: 0)
        ])
        let r = extractTo("es_dang.tar", "es_x3", false)
        removeIfExists(Path("es_dang.tar"))
        removeIfExists(Path("es_x3"), recursive: true)
        @Assert(r != "OTHER", true)
    }

    @TestCase
    func symlinkEntryNoEscape(): Unit {
        writeArchive("es_sym.tar", [
            header("s.txt", 0, UInt8(0x32), linkName: "target.txt"),
            Array<UInt8>(1024, repeat: 0)
        ])
        let r = extractTo("es_sym.tar", "es_x4", false)
        removeIfExists(Path("es_sym.tar"))
        removeIfExists(Path("es_x4"), recursive: true)
        @Assert(r != "OTHER", true)
    }

    @TestCase
    func reservedNamesWithExtensionExtract(): Unit {
        writeArchive("es_resext.tar", [
            header("NUL.txt", 3, UInt8(0x30)), dataBlock("abc"),
            header("COM1.zip", 3, UInt8(0x30)), dataBlock("abc"),
            header("AUX.ini", 3, UInt8(0x30)), dataBlock("abc"),
            Array<UInt8>(1024, repeat: 0)
        ])
        let r = extractTo("es_resext.tar", "es_x5", false)
        let n1 = fileContent("es_x5", "NUL.txt")
        let n2 = fileContent("es_x5", "COM1.zip")
        let n3 = fileContent("es_x5", "AUX.ini")
        removeIfExists(Path("es_resext.tar"))
        removeIfExists(Path("es_x5"), recursive: true)
        @Assert(r, "OK")
        @Assert(n1, "abc")
        @Assert(n2, "abc")
        @Assert(n3, "abc")
    }
}
