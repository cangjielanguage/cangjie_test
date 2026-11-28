/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *     Compatibility test for the connection-level flow-control fix: keeping a
 * window-blocked DATA frame queued must not head-of-line block frames queued
 * behind it on other streams. RFC 9113 section 5.2.1: only DATA frames are
 * subject to flow control, so a HEAD response queued as a bodyless HEADERS
 * frame (streamEnd set, see Stream#writeResponse) must be written out even
 * while another stream's DATA frame is blocked by the exhausted connection
 * window. Buggy behavior: the blocked DATA frame stays at the head of
 * toWriteFrames and the drain loop breaks at it, so the HEAD response can
 * never be written before the client sends a WINDOW_UPDATE: a previously
 * successful request now hangs until the write timeout resets the stream.
 *     Scenario: a raw h2 client (TLS + ALPN) sends "/fill" (65535 bytes,
 * exactly the initial connection window, RFC 9113 5.2.1) and "/victimA"
 * (16384 bytes) on one connection and withholds WINDOW_UPDATE, so victimA's
 * DATA frame is queued while the connection window is exhausted. Then the
 * client sends a HEAD "/victimB" request whose response is a bodyless
 * HEADERS frame queued behind the blocked DATA frame.
 *     Expected behavior 1: victimB's HEADERS (with END_STREAM) arrive while
 * the connection window is still exhausted, i.e. before any WINDOW_UPDATE.
 * Expected behavior 2 (MC-5 regression): after the client sends a
 * connection-level WINDOW_UPDATE(65535), victimA's DATA frame (16384 bytes +
 * END_STREAM) is delivered.
 */

package tests.server2_0

import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import std.io.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

const CONN_WINDOW_SIZE: Int64 = 65535 // initial HTTP/2 connection flow-control window (RFC 9113 5.2.1)
const VICTIM_BODY_SIZE: Int64 = 16384 // default max frame size
const HOL_PROBE_TIMEOUT_MS: Int64 = 2000 // grace period for the head-of-line blocking probe

let CLIENT_PREFACE: Array<UInt8> = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray()
let EMPTY_SETTINGS: Array<UInt8> = [0, 0, 0, 4, 0, 0, 0, 0, 0]
let SETTINGS_ACK: Array<UInt8> = [0, 0, 0, 4, 1, 0, 0, 0, 0]

// mutable observer of the frames received from the server, shared across the
// three read phases of the test (fill, head-of-line probe, window update)
class HolFrameTracker {
    let tls: TlsSocket
    var fillBytes: Int64 = 0
    var fillEnd = false
    var victimABytes: Int64 = 0
    var victimAEnd = false
    var victimBHeaders = false
    var victimBEnd = false
    var probePhase = false
    var leakedA = false // DATA of stream 3 seen while the window is exhausted

    init(tls: TlsSocket) {
        this.tls = tls
    }

    func readAndTrack(): Unit {
        let head = readExact(tls, 9)
        let len = Int64(head[0]) << 16 | Int64(head[1]) << 8 | Int64(head[2])
        let ftype = head[3]
        let flags = head[4]
        let sid = UInt32(head[5]) << 24 | UInt32(head[6]) << 16 | UInt32(head[7]) << 8 | UInt32(head[8])
        let payload = readExact(tls, len)
        if (ftype == 0x00) { // DATA
            if (sid == 1) {
                fillBytes += len
                if ((flags & 0x01) != 0) {
                    fillEnd = true
                }
            }
            if (sid == 3) {
                if (probePhase) {
                    leakedA = true
                }
                victimABytes += len
                if ((flags & 0x01) != 0) {
                    victimAEnd = true
                }
            }
        } else if (ftype == 0x01) { // HEADERS
            if (sid == 5) {
                victimBHeaders = true
                if ((flags & 0x01) != 0) {
                    victimBEnd = true
                }
            }
        } else if (ftype == 0x04) { // SETTINGS: ack the server's SETTINGS
            if ((flags & 0x01) == 0) {
                tls.write(SETTINGS_ACK)
            }
        } else if (ftype == 0x06) { // PING: reply with ACK + same payload
            if ((flags & 0x01) == 0) {
                let pong = ArrayList<UInt8>()
                appendAll(pong, frameHeader(len, 0x06, 0x01, 0))
                appendAll(pong, payload)
                tls.write(pong.toArray())
            }
        } else if (ftype == 0x07) { // GOAWAY
            throw Exception("server sent GOAWAY")
        }
    }
}

@Test
class TestServer2ConnWindowHolHeaders {
    let fillBody = FixedBody(CONN_WINDOW_SIZE)
    let victimBody = String.fromUtf8(Array<UInt8>(VICTIM_BODY_SIZE, repeat: b'v'))
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testConnWindowHolHeaders(): Unit {
        startServer()
        let tcp = TcpSocket("127.0.0.1", server.port)
        tcp.readTimeout = Duration.second * 10 // deadline for the whole read loop
        tcp.connect()
        let tls = TlsSocket.client(tcp, clientConfig: clientConfig())
        tls.handshake()
        let tracker = HolFrameTracker(tls)

        let authority = "127.0.0.1:${server.port}"
        let out = ArrayList<UInt8>()
        appendAll(out, CLIENT_PREFACE)
        appendAll(out, EMPTY_SETTINGS)
        appendAll(out, headersFrame(1, authority, "/fill"))
        appendAll(out, headersFrame(3, authority, "/victimA"))
        tls.write(out.toArray())

        try {
            // phase 1: consume the whole /fill response to exhaust the connection window;
            // never send a WINDOW_UPDATE while doing so
            while (!(tracker.fillEnd && tracker.fillBytes == CONN_WINDOW_SIZE)) {
                tracker.readAndTrack()
            }
            // give the server time to dequeue victimA's DATA frame and hit the
            // exhausted connection window, so it is queued first
            sleep(Duration.millisecond * 300)
            // phase 2: HEAD request, its bodyless HEADERS response must not be
            // head-of-line blocked by victimA's blocked DATA frame
            tcp.readTimeout = Duration.millisecond * HOL_PROBE_TIMEOUT_MS
            tracker.probePhase = true
            tls.write(headersFrame(5, authority, "/victimB", head: true))
            try {
                while (!(tracker.victimBHeaders && tracker.victimBEnd)) {
                    tracker.readAndTrack()
                }
            } catch (e: Exception) {
                println("[conn-window-hol-test] probe loop ended: ${e}")
            }
            tracker.probePhase = false
            // phase 3: now replenish the connection window and expect victimA's
            // blocked DATA frame to be delivered
            tcp.readTimeout = Duration.second * 10
            tls.write(windowUpdateFrame(0, UInt32(CONN_WINDOW_SIZE)))
            while (!(tracker.victimAEnd && tracker.victimABytes == VICTIM_BODY_SIZE)) {
                tracker.readAndTrack()
            }
        } catch (e: Exception) {
            // deadline (read timeout) or closed connection: fall through to assertions
            println("[conn-window-hol-test] read loop ended: ${e}")
        }

        println("[conn-window-hol-test] fill: bytes=${tracker.fillBytes} end=${tracker.fillEnd}; "
            + "victimA: bytes=${tracker.victimABytes} end=${tracker.victimAEnd}; "
            + "victimB: headers=${tracker.victimBHeaders} end=${tracker.victimBEnd}; "
            + "leakedA=${tracker.leakedA}")

        // sanity: the fill stream is fully received and consumed
        @Expect(tracker.fillBytes, CONN_WINDOW_SIZE)
        @Assert(tracker.fillEnd)
        // compatibility assertions: victimB's bodyless HEADERS response must be
        // written while the connection window is still exhausted
        @Assert(tracker.victimBHeaders)
        @Assert(tracker.victimBEnd)
        // victimA's DATA must stay queued until the WINDOW_UPDATE, never leak early
        @Assert(!tracker.leakedA)
        // regression assertion for MC-5: the dequeued victimA DATA frame must survive
        // connection-window exhaustion and be delivered after the WINDOW_UPDATE
        @Expect(tracker.victimABytes, VICTIM_BODY_SIZE)
        @Assert(tracker.victimAEnd)

        tls.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/fill", { ctx => ctx.responseBuilder.body(fillBody) })
        server.distributor.register("/victimA", { ctx =>
            sleep(Duration.millisecond * 100) // queue victimA frames behind all /fill frames
            ctx.responseBuilder.body(victimBody)
        })
        server.distributor.register("/victimB", { ctx => () }) // HEAD: bodyless HEADERS only
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 10)
        }
    }
}

// body stream that always reads exactly min(totalSize, buffer.size) bytes,
// so the response totals exactly the requested size
class FixedBody <: InputStream {
    var totalSize: Int64

    public init(size: Int64) {
        totalSize = size
    }

    public func read(buffer: Array<Byte>): Int64 {
        if (totalSize <= 0) {
            return -1
        }
        let len = if (totalSize < buffer.size) { totalSize } else { buffer.size }
        for (i in 0..len) {
            buffer[i] = b'f'
        }
        totalSize -= len
        return len
    }
}

func appendAll(out: ArrayList<UInt8>, bytes: Array<UInt8>): Unit {
    for (b in bytes) {
        out.add(b)
    }
}

func frameHeader(len: Int64, ftype: UInt8, flags: UInt8, streamId: UInt32): Array<UInt8> {
    [
        UInt8((len >> 16) & 0xFF), UInt8((len >> 8) & 0xFF), UInt8(len & 0xFF),
        ftype, flags,
        UInt8((streamId >> 24) & 0xFF), UInt8((streamId >> 16) & 0xFF),
        UInt8((streamId >> 8) & 0xFF), UInt8(streamId & 0xFF)
    ]
}

// HPACK: literal header field without indexing with a new name
func hpackLiteral(name: String, value: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x00)
    let nb = name.toArray()
    out.add(UInt8(nb.size))
    appendAll(out, nb)
    let vb = value.toArray()
    out.add(UInt8(vb.size))
    appendAll(out, vb)
    out.toArray()
}

func requestHeadersBlock(authority: String, path: String, method!: String = "GET"): Array<UInt8> {
    let out = ArrayList<UInt8>()
    appendAll(out, hpackLiteral(":method", method))
    appendAll(out, hpackLiteral(":scheme", "https"))
    appendAll(out, hpackLiteral(":authority", authority))
    appendAll(out, hpackLiteral(":path", path))
    out.toArray()
}

// HEADERS frame with END_HEADERS | END_STREAM
func headersFrame(streamId: UInt32, authority: String, path: String, head!: Bool = false): Array<UInt8> {
    let method = if (head) { "HEAD" } else { "GET" }
    let block = requestHeadersBlock(authority, path, method: method)
    let out = ArrayList<UInt8>()
    appendAll(out, frameHeader(block.size, 0x01, 0x05, streamId))
    appendAll(out, block)
    out.toArray()
}

func windowUpdateFrame(streamId: UInt32, increment: UInt32): Array<UInt8> {
    let out = ArrayList<UInt8>()
    appendAll(out, frameHeader(4, 0x08, 0x00, streamId))
    out.add(UInt8((increment >> 24) & 0xFF))
    out.add(UInt8((increment >> 16) & 0xFF))
    out.add(UInt8((increment >> 8) & 0xFF))
    out.add(UInt8(increment & 0xFF))
    out.toArray()
}

// read exactly n bytes from the connection
func readExact(conn: TlsSocket, n: Int64): Array<UInt8> {
    let result = ArrayList<UInt8>()
    while (result.size < n) {
        let buf = Array<UInt8>(n - result.size, repeat: 0)
        let r = conn.read(buf)
        if (r <= 0) {
            throw Exception("connection closed while reading ${n} bytes, got ${result.size}")
        }
        for (i in 0..r) {
            result.add(buf[i])
        }
    }
    result.toArray()
}
