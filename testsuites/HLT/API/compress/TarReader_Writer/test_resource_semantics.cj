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

@Test
class TestTarResourceSemantics {
    @TestCase
    func tryWithResourcesLifecycle(): Unit {
        File.writeTo(Path("tw_src.txt"), "x".toArray())
        try (w = TarWriter(File("tw.tar", Write), TarEntryFormat.Ustar)) {
            w.write(Path("tw_src.txt"), entryName: "tw.txt")
        }
        var entries: Int64 = 0
        try (r = TarReader(File("tw.tar", Read))) {
            for (e in r.iterator()) {
                entries += 1
            }
        }
        removeIfExists(Path("tw.tar"))
        removeIfExists(Path("tw_src.txt"))
        @Assert(entries, 1)
    }

    @TestCase
    func isClosedTransitions(): Unit {
        File.writeTo(Path("tw_src.txt"), "x".toArray())
        let f = File("tw2.tar", Write)
        let w = TarWriter(f, TarEntryFormat.Ustar)
        @Assert(w.isClosed(), false)
        w.write(Path("tw_src.txt"), entryName: "ok.txt")
        w.close()
        @Assert(w.isClosed(), true)
        let fr = File("tw2.tar", Read)
        let r = TarReader(fr)
        @Assert(r.isClosed(), false)
        r.close()
        @Assert(r.isClosed(), true)
        fr.close()
        removeIfExists(Path("tw2.tar"))
        removeIfExists(Path("tw_src.txt"))
    }
}
