/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: hardlink.tar, ustar-file-devs.tar, xattrs.tar
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.tar.*
import std.unittest.*
import std.unittest.testmacro.*

func drain(s: InputStream): Int64 {
    let buf = Array<UInt8>(4096, repeat: 0)
    var total: Int64 = 0
    while (true) {
        let n = s.read(buf)
        if (n == 0) {
            break
        }
        total += n
    }
    return total
}

@Test
class TestTarEntryTypes {
    @TestCase
    func hardlinkTypeAndLinkName(): Unit {
        var hardName = ""
        var linkName = ""
        for (e in TarReader(File("hardlink.tar", Read)).iterator()) {
            if (e.entryType == TarEntryType.HardLink) {
                hardName = e.name
                linkName = e.linkName
            }
            if (let Some(s) <- e.stream) {
                let _ = drain(s)
            }
        }
        @Assert(hardName, "hard.txt")
        @Assert(linkName, "file.txt")
    }

    @TestCase
    func ustarDevFieldsParsed(): Unit {
        var dm: Int32 = -1
        var dn: Int32 = -1
        for (e in TarReader(File("ustar-file-devs.tar", Read)).iterator()) {
            if (let Some(p) <- (e as PosixTarEntry)) {
                dm = p.deviceMajor
                dn = p.deviceMinor
            }
        }
        @Assert(dm, 1)
        @Assert(dn, 1)
    }

    @TestCase
    func xattrPaxRecordsAndNsTime(): Unit {
        var key: ?String = None
        var mod = ""
        for (e in TarReader(File("xattrs.tar", Read)).iterator()) {
            if (e.name == "small.txt") {
                if (let Some(p) <- (e as PaxTarEntry)) {
                    key = p.getPaxData("SCHILY.xattr.user.key")
                }
                mod = e.modificationTime.toString()
            }
        }
        @Assert(key, "value")
        @Assert(mod, "2013-12-03T10:16:10.44825232Z")
    }
}
