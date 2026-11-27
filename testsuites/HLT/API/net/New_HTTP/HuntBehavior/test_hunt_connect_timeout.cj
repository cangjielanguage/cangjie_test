/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import std.net.*
import std.io.*
import std.convert.*
import std.time.*
import std.sync.*
import std.unittest.*

func hctFreePort(): Int64 {
    let l = TcpServerSocket(bindAt: 0)
    l.bind()
    var port: Int64 = 0
    let t = l.localAddress.toString()
    match (t.lastIndexOf(":")) {
        case Some(i) => port = Int64.parse(t[i + 1..])
        case None => ()
    }
    l.close()
    return port
}

@Test
class HuntConnectTimeout {
    @TestCase
    func dnsFailureIsFastAndTyped(): Unit {
        let c = ClientBuilder().readTimeout(3 * Duration.second).build()
        let t0 = DateTime.now()
        var ok = false
        var detail = ""
        try {
            let r = c.get("http://this-host-does-not-exist-hlt.invalid:18080/")
            detail = "unexpected status=${r.status}"
        } catch (e: HttpException) {
            let ms = (DateTime.now() - t0).toMilliseconds()
            ok = ms < 3000
            detail = "HttpException in ${ms}ms"
        } catch (e: Exception) {
            detail = "wrong exception type: ${e}"
        }
        println("[hunt-conn] dns: ${detail}")
        @Expect(ok, true)
        c.close()
    }

    @TestCase
    func connectRefusedFailsFast(): Unit {
        let port = hctFreePort()
        let c = ClientBuilder().readTimeout(3 * Duration.second).build()
        let t0 = DateTime.now()
        var ms: Int64 = -1
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            println("[hunt-conn] refused: unexpected status=${r.status}")
        } catch (e: Exception) {
            ms = (DateTime.now() - t0).toMilliseconds()
        }
        println("[hunt-conn] refused elapsed=${ms}ms")
        @Expect(ms >= 0, true)
        @Expect(ms < 1000, true)
        c.close()
    }

    @TestCase
    func unreachableIpBoundedByReadTimeout(): Unit {
        let c = ClientBuilder().readTimeout(2 * Duration.second).build()
        let t0 = DateTime.now()
        var ms: Int64 = -1
        try {
            let r = c.get("http://10.255.255.1:18080/")
            println("[hunt-conn] unreachable: unexpected status=${r.status}")
        } catch (e: Exception) {
            ms = (DateTime.now() - t0).toMilliseconds()
            println("[hunt-conn] unreachable elapsed=${ms}ms ${e}")
        }
        @Expect(ms >= 0, true)
        @Expect(ms < 10000, true)
        c.close()
    }
}
