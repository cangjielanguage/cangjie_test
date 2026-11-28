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
import stdx.compress.*
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestZlibFlushVisibility {
    @TestCase
    func flushProducesVisibleOutput(): Unit {
        let cbuf = ByteBuffer()
        let cos = CompressOutputStream(cbuf, wrap: DeflateFormat)
        cos.write([72, 72, 72, 72])
        cos.flush()
        let visible = cbuf.length
        cos.close()
        println("[issue86] visible-after-flush=${visible}")
        @Assert(visible > 0)
    }

    @TestCase
    func closeEmitsCompleteStream(): Unit {
        let payload = Array<UInt8>(512, {i => UInt8(i % 249)})
        let src = ByteBuffer()
        src.write(payload)
        let cbuf = ByteBuffer()
        let cis = CompressInputStream(src, wrap: GzipFormat)
        let one = Array<UInt8>(1024, repeat: 0)
        while (true) {
            let n = cis.read(one)
            if (n == 0) {
                break
            }
            cbuf.write(one[0..n])
        }
        cis.close()
        let dis = DecompressInputStream(cbuf, wrap: GzipFormat)
        let out = ByteBuffer()
        while (true) {
            let n = dis.read(one)
            if (n == 0) {
                break
            }
            out.write(one[0..n])
        }
        dis.close()
        @Assert(readToEnd(out), payload)
    }
}
