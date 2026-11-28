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
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestZlibGzipWriterHeader {
    @TestCase
    func gzipWriterHeaderConformant(): Unit {
        let src = ByteBuffer()
        src.write([72, 73])
        let cbuf = ByteBuffer()
        let cis = CompressInputStream(src, wrap: GzipFormat)
        let one = Array<UInt8>(64, repeat: 0)
        while (true) {
            let n = cis.read(one)
            if (n == 0) {
                break
            }
            cbuf.write(one[0..n])
        }
        cis.close()
        let gz = readToEnd(cbuf)
        @Assert(gz.size >= 20, true)
        @Assert(gz[0], 31)
        @Assert(gz[1], 139)
        @Assert(gz[2], 8)
        @Assert(gz[3], 0)
    }
}
