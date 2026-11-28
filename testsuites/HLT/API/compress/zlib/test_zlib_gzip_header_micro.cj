/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: gz_ftext_flag.gz, gz_fextra_len0.gz, gz_fname_empty.gz, gz_os255.gz, gz_hdr_src.bin
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.zlib.*
import std.unittest.*
import std.unittest.testmacro.*

func bufOf(bytes: Array<UInt8>): ByteBuffer {
    let b = ByteBuffer()
    b.write(bytes)
    return b
}

func decompressGzFile(path: String): Array<UInt8> {
    let out = ByteBuffer()
    let dis = DecompressInputStream(bufOf(File.readFrom(Path(path))), wrap: GzipFormat)
    let one = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = dis.read(one)
        if (n == 0) {
            break
        }
        out.write(one[0..n])
    }
    dis.close()
    return readToEnd(out)
}

@Test
class TestZlibGzipHeaderMicro {
    @TestCase
    func gzipFtextFlagAccepted(): Unit {
        @Assert(decompressGzFile("gz_ftext_flag.gz"), File.readFrom(Path("gz_hdr_src.bin")))
    }

    @TestCase
    func gzipFextraLen0Accepted(): Unit {
        @Assert(decompressGzFile("gz_fextra_len0.gz"), File.readFrom(Path("gz_hdr_src.bin")))
    }

    @TestCase
    func gzipFnameEmptyAccepted(): Unit {
        @Assert(decompressGzFile("gz_fname_empty.gz"), File.readFrom(Path("gz_hdr_src.bin")))
    }

    @TestCase
    func gzipOs255Accepted(): Unit {
        @Assert(decompressGzFile("gz_os255.gz"), File.readFrom(Path("gz_hdr_src.bin")))
    }
}
