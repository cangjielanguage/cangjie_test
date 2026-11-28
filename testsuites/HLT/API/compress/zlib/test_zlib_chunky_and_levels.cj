/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: alice29.txt
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

class ChunkyStream <: InputStream {
    let data: Array<UInt8>
    var pos: Int64 = 0
    let chunk: Int64
    init(data: Array<UInt8>, chunk: Int64) {
        this.data = data
        this.chunk = chunk
    }
    public override func read(b: Array<UInt8>): Int64 {
        if (pos >= data.size) {
            return 0
        }
        let take = min(chunk, min(Int64(b.size), data.size - pos))
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
class TestZlibChunkyStream {
    @TestCase
    func chunkyStreamRoundtrip(): Unit {
        let payload = Array<UInt8>(4096, {i => UInt8(i % 249)})
        let cbuf = ByteBuffer()
        let cis = CompressInputStream(ChunkyStream(payload, 1), wrap: GzipFormat, bufLen: 31)
        let one = Array<UInt8>(7, repeat: 0)
        while (true) {
            let n = cis.read(one)
            if (n == 0) {
                break
            }
            cbuf.write(one[0..n])
        }
        cis.close()
        let dis = DecompressInputStream(ChunkyStream(readToEnd(cbuf), 3), wrap: GzipFormat, bufLen: 19)
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

@Test
class TestZlibCorpusLevels {
    @TestCase
    func corpusLevelMonotonicAndRoundtrip(): Unit {
        let data = File.readFrom(Path("alice29.txt"))
        let levels = [BestSpeed, DefaultCompression, BestCompression]
        var prev: Int64 = -1
        for (lv in levels) {
            let cbuf = ByteBuffer()
            let cis = CompressInputStream(bufOf(data), wrap: GzipFormat, compressLevel: lv)
            let one = Array<UInt8>(65536, repeat: 0)
            while (true) {
                let n = cis.read(one)
                if (n == 0) {
                    break
                }
                cbuf.write(one[0..n])
            }
            cis.close()
            let compressed = readToEnd(cbuf)
            let dis = DecompressInputStream(bufOf(compressed), wrap: GzipFormat)
            let out = ByteBuffer()
            while (true) {
                let n = dis.read(one)
                if (n == 0) {
                    break
                }
                out.write(one[0..n])
            }
            dis.close()
            @Assert(readToEnd(out), data)
            if (prev >= 0) {
                @Assert(compressed.size <= prev, true)
            }
            prev = compressed.size
        }
    }
}
