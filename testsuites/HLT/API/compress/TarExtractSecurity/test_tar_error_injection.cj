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
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

class ErrorAtStream <: InputStream {
    let data: Array<UInt8>
    var pos: Int64 = 0
    let errAt: Int64
    init(data: Array<UInt8>, errAt: Int64) {
        this.data = data
        this.errAt = errAt
    }
    public override func read(b: Array<UInt8>): Int64 {
        if (pos >= data.size) {
            return 0
        }
        if (pos >= errAt) {
            throw IOException("injected IO failure at ${pos}")
        }
        let take = min(Int64(b.size), min(errAt - pos, data.size - pos))
        var i = 0
        while (i < take) {
            b[i] = data[pos + i]
            i += 1
        }
        pos += take
        return take
    }
}

func bufOf(bytes: Array<UInt8>): ByteBuffer {
    let b = ByteBuffer()
    b.write(bytes)
    return b
}

@Test
class TestTarErrorInjection {
    @TestCase
    func tarReaderPropagatesSourceError(): Unit {
        File.writeTo(Path("ei_src.txt"), "PAYLOAD-DATA".toArray())
        let buf = ByteBuffer()
        let w = TarWriter(buf, TarEntryFormat.Gnu)
        w.write(Path("ei_src.txt"), entryName: "only.txt")
        w.finish()
        let bytes = readToEnd(buf)
        var threw = false
        try {
            var count: Int64 = 0
            for (e in TarReader(ErrorAtStream(bytes, bytes.size / 2)).iterator()) {
                count += 1
                if (let Some(s) <- e.stream) {
                    let one = Array<UInt8>(4096, repeat: 0)
                    while (true) {
                        let n = s.read(one)
                        if (n == 0) {
                            break
                        }
                    }
                }
            }
        } catch (e: Exception) {
            threw = true
        }
        removeIfExists(Path("ei_src.txt"))
        @Assert(threw)
    }

    @TestCase
    func decompressPropagatesSourceError(): Unit {
        let payload = Array<UInt8>(512, {i => UInt8(i % 249)})
        let cbuf = ByteBuffer()
        let cis = CompressInputStream(bufOf(payload), wrap: GzipFormat)
        let one = Array<UInt8>(4096, repeat: 0)
        while (true) {
            let n = cis.read(one)
            if (n == 0) {
                break
            }
            cbuf.write(one[0..n])
        }
        cis.close()
        let gz = readToEnd(cbuf)
        var threw = false
        try {
            let dis = DecompressInputStream(ErrorAtStream(gz, gz.size / 2), wrap: GzipFormat)
            while (true) {
                let n = dis.read(one)
                if (n == 0) {
                    break
                }
            }
            dis.close()
        } catch (e: Exception) {
            threw = true
        }
        @Assert(threw)
    }
}
