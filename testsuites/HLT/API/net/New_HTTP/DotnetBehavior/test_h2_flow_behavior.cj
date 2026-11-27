/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../../okhttp_support
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl okhttp_support/common.cj %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.common.*
import std.io.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func h2TlsClient(): TlsClientConfig {
    var cfg = tlsClientConfig(["root_rsa.cer"], ["h2"])
    return cfg
}

func h2ServerWith(body: Array<UInt8>): Server {
    var scfg = tlsServerConfig(["h2"])
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(scfg).build()
    server.distributor.register("/", {
        ctx =>
        ctx.responseBuilder.header("Content-Type", "application/octet-stream")
        ctx.responseBuilder.body(body)
    })
    spawn { server.serve() }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return server
}

func h2ClientFor(server: Server): Client {
    let c = ClientBuilder()
        .tlsConfig(h2TlsClient())
        .readTimeout(20 * Duration.second)
        .build()
    return c
}

func readBodyCount(stream: InputStream): Int64 {
    let buf = Array<UInt8>(65536, repeat: 0)
    var total: Int64 = 0
    while (true) {
        let n = stream.read(buf)
        if (n == 0) {
            break
        }
        total = total + Int64(n)
    }
    return total
}

@Test
class H2FlowControlTest {
    @TestCase
    func initialWindowSizeRoundtrip(): Unit {
        let c = ClientBuilder().initialWindowSize(131072).build()
        @Expect(c.initialWindowSize, 131072u32)
        c.close()
    }
    @TestCase
    func smallInitialWindowLargeBodyCompletes(): Unit {
        let size = 262144
        let bodyBytes = Array<UInt8>(size, repeat: 0x41)
        let server = h2ServerWith(bodyBytes)
        let c = ClientBuilder()
            .tlsConfig(h2TlsClient())
            .initialWindowSize(1024u32)
            .readTimeout(20 * Duration.second)
            .build()
        let resp = c.get("https://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        let got = readBodyCount(resp.body)
        @Expect(got, Int64(size))
        c.close()
        server.close()
    }
    @TestCase
    func largeBodyOverH2Completes(): Unit {
        let size = 1048576
        let bodyBytes = Array<UInt8>(size, repeat: 0x42)
        let server = h2ServerWith(bodyBytes)
        let c = h2ClientFor(server)
        let resp = c.get("https://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        let got = readBodyCount(resp.body)
        @Expect(got, Int64(size))
        c.close()
        server.close()
    }
}
