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

func cat(parts: Array<Array<UInt8>>): Array<UInt8> {
    var total: Int64 = 0
    for (p in parts) { total += p.size }
    let out = Array<UInt8>(total, repeat: 0)
    var off: Int64 = 0
    for (p in parts) {
        var i: Int64 = 0
        while (i < p.size) { out[off + i] = p[i]; i += 1 }
        off += p.size
    }
    return out
}

func fullDecompress(buf: ByteBuffer, wrap: WrapType): String {
    let d = DecompressInputStream(buf, wrap: wrap)
    let b = Array<UInt8>(1024, repeat: 0)
    var out = String.fromUtf8(Array<UInt8>())
    while (true) {
        let r = d.read(b)
        if (r == 0) { break }
        out = out + String.fromUtf8(b[0..r])
    }
    d.close()
    return out
}

func decompressKind(arr: Array<UInt8>, wrap: WrapType): String {
    var r = "OK"
    try {
        let _ = fullDecompress(ByteBuffer(arr), wrap)
    } catch (e: ZlibException) {
        r = "TAREX"
    } catch (e: Exception) {
        r = "OTHER"
    }
    return r
}

@Test
class TestZlibFuzzEdges {
    @TestCase
    func gzipHeaderFieldsBinarySafe(): Unit {
        let payload: Array<UInt8> = "payload13".toArray()
        let gz = ByteBuffer()
        let cw = CompressOutputStream(gz, wrap: GzipFormat)
        cw.write(payload)
        cw.close()
        let a = Array<UInt8>(65536, repeat: 0)
        let n = gz.read(a)
        let gzArr = a[0..n]

        let gbkName: Array<UInt8> = [0xD6, 0xD0, 0x2E, 0x74, 0x78, 0x74]
        var hdr = Array<UInt8>(10, repeat: 0)
        hdr[0] = 0x1F
        hdr[1] = 0x8B
        hdr[2] = 8
        hdr[3] = 0x08
        var withNul = Array<UInt8>(gbkName.size + 1, repeat: 0)
        var k: Int64 = 0
        while (k < gbkName.size) { withNul[k] = gbkName[k]; k += 1 }
        let spliced = cat([hdr, withNul, gzArr[10..gzArr.size]])
        @Assert(decompressKind(spliced, GzipFormat), "OK")

        var hdr2 = Array<UInt8>(10, repeat: 0)
        hdr2[0] = 0x1F
        hdr2[1] = 0x8B
        hdr2[2] = 8
        hdr2[3] = 0x10
        let spliced2 = cat([hdr2, withNul, gzArr[10..gzArr.size]])
        @Assert(decompressKind(spliced2, GzipFormat), "OK")
    }

    @TestCase
    func deflateStoredBlockLiesRejected(): Unit {
        let st1 = cat([[0x01, 10, 0, 245, 255], [0x61, 0x62, 0x63, 0x64, 0x65]])
        @Assert(decompressKind(st1, DeflateFormat), "TAREX")
        let st2 = cat([[0x01, 10, 0, 245, 255], [0x61, 0x62, 0x63]])
        @Assert(decompressKind(st2, DeflateFormat), "TAREX")
    }

    @TestCase
    func gzipTrailerLiesRejected(): Unit {
        let payload: Array<UInt8> = "trailer13".toArray()
        let gz = ByteBuffer()
        let cw = CompressOutputStream(gz, wrap: GzipFormat)
        cw.write(payload)
        cw.close()
        let a = Array<UInt8>(65536, repeat: 0)
        let n = gz.read(a)
        let arr = a[0..n]

        let crcLie = Array<UInt8>(arr.size, repeat: 0)
        var k: Int64 = 0
        while (k < arr.size) { crcLie[k] = arr[k]; k += 1 }
        crcLie[crcLie.size - 5] = crcLie[crcLie.size - 5] ^ 0xFF
        @Assert(decompressKind(crcLie, GzipFormat), "TAREX")

        let iszLie = Array<UInt8>(arr.size, repeat: 0)
        k = 0
        while (k < arr.size) { iszLie[k] = arr[k]; k += 1 }
        iszLie[iszLie.size - 1] = iszLie[iszLie.size - 1] ^ 0xFF
        @Assert(decompressKind(iszLie, GzipFormat), "TAREX")
    }

    @TestCase
    func fdictAndExtraLieRejected(): Unit {
        let payload: Array<UInt8> = "edge13".toArray()
        let gz = ByteBuffer()
        let cw = CompressOutputStream(gz, wrap: GzipFormat)
        cw.write(payload)
        cw.close()
        let a = Array<UInt8>(65536, repeat: 0)
        let n = gz.read(a)
        let gzArr = a[0..n]

        let fdict = cat([[0x1F, 0x8B, 8, 0x20, 0, 0, 0, 0, 0, 3], [0x78, 0x9C, 0, 0], gzArr[10..gzArr.size]])
        @Assert(decompressKind(fdict, GzipFormat), "TAREX")

        let fxtra = cat([[0x1F, 0x8B, 8, 0x04, 0, 0, 0, 0, 0, 3], [100, 0, 1, 2, 3, 4], gzArr[10..gzArr.size]])
        @Assert(decompressKind(fxtra, GzipFormat), "TAREX")
    }

    @TestCase
    func bitFlipFuzzNoEscape(): Unit {
        let payload: Array<UInt8> = "fuzznet13".toArray()
        let gz = ByteBuffer()
        let cw = CompressOutputStream(gz, wrap: GzipFormat)
        cw.write(payload)
        cw.close()
        let a = Array<UInt8>(65536, repeat: 0)
        let n = gz.read(a)
        let gzArr = a[0..n]
        var other = 0
        var bit = 0
        while (bit < gzArr.size * 8) {
            var m = Array<UInt8>(gzArr.size, repeat: 0)
            var k: Int64 = 0
            while (k < gzArr.size) { m[k] = gzArr[k]; k += 1 }
            m[bit / 8] = m[bit / 8] ^ (UInt8(1) << UInt64(bit % 8))
            if (decompressKind(m, GzipFormat) == "OTHER") {
                other += 1
            }
            bit += 1
        }
        @Assert(other, 0)
    }

    @TestCase
    func multimemberGarbageStopsAtFirst(): Unit {
        let payload: Array<UInt8> = "memberA-payload".toArray()
        let gz = ByteBuffer()
        let cw = CompressOutputStream(gz, wrap: GzipFormat)
        cw.write(payload)
        cw.close()
        let a = Array<UInt8>(65536, repeat: 0)
        let n = gz.read(a)
        let gzArr = a[0..n]

        let mm = cat([gzArr, [0xDE, 0xAD, 0xBE, 0xEF], gzArr])
        let d = DecompressInputStream(ByteBuffer(mm), wrap: GzipFormat)
        let b = Array<UInt8>(1024, repeat: 0)
        var total: Int64 = 0
        while (true) {
            let r = d.read(b)
            if (r == 0) { break }
            total += r
        }
        d.close()
        @Assert(total, payload.size)
    }

    @TestCase
    func largeBufLenRoundtrip(): Unit {
        let payload: Array<UInt8> = "buflen1M".toArray()
        let gz = ByteBuffer()
        let cw = CompressOutputStream(gz, wrap: GzipFormat, bufLen: 1048576)
        cw.write(payload)
        cw.close()
        let a = Array<UInt8>(65536, repeat: 0)
        let n = gz.read(a)
        let d = DecompressInputStream(ByteBuffer(a[0..n]), wrap: GzipFormat, bufLen: 1048576)
        let b = Array<UInt8>(1024, repeat: 0)
        var total: Int64 = 0
        while (true) {
            let r = d.read(b)
            if (r == 0) { break }
            total += r
        }
        d.close()
        @Assert(total, payload.size)
    }
}
