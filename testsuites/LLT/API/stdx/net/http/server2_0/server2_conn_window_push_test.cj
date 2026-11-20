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
 *     Compatibility test for server push while the connection-level flow-control
 * window is exhausted. RFC 7540 section 8.2: a PUSH_PROMISE frame must be sent
 * on the parent stream before any response frame on the promised stream, and a
 * client receiving HEADERS on a stream that was not reserved by a PUSH_PROMISE
 * must treat it as a connection error (PROTOCOL_ERROR). A PUSH_PROMISE (a
 * FieldsFrame whose pushId is the promised stream's ID) carries the parent
 * stream's ID but is NOT part of the parent stream's response sequence: writing
 * it must not be gated by the parent's flow-control state. Only DATA frames are
 * subject to flow control (RFC 9113 section 5.2.1).
 *     Scenario: a raw h2 client (TLS + ALPN) sends "/fill" (65535 bytes,
 * exactly the initial connection window) and "/parent" (16384 bytes) on one
 * connection and withholds WINDOW_UPDATE, so the parent's DATA frame is queued
 * while the connection window is exhausted. The /parent handler then calls
 * HttpResponsePusher.push, so the PUSH_PROMISE frame (parent stream ID) and the
 * promised stream's response HEADERS are queued behind the blocked DATA frame.
 *     Expected behavior 1: the PUSH_PROMISE frame arrives before the promised
 * stream's HEADERS while the connection window is still exhausted. Buggy
 * behavior: the PUSH_PROMISE is skipped because its stream ID matches the
 * blocked parent stream, while the promised stream's HEADERS (a different
 * stream ID) overtakes it: the client sees HEADERS on an unreserved stream,
 * a connection error that tears down the whole connection, although the old
 * implementation delivered the push successfully.
 * Expected behavior 2 (MC-5 regression): after the client sends a
 * connection-level WINDOW_UPDATE(65535), the parent's DATA frame (16384 bytes +
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
const PARENT_BODY_SIZE: Int64 = 16384 // default max frame size
const PUSH_PROBE_TIMEOUT_MS: Int64 = 2000 // grace period for the push ordering probe

let CLIENT_PREFACE: Array<UInt8> = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray()
let SETTINGS_ACK: Array<UInt8> = [0, 0, 0, 4, 1, 0, 0, 0, 0]

// mutable observer of the frames received from the server, shared across the
// three read phases of the test (fill, push ordering probe, window update)
class PushFrameTracker {
    let tls: TlsSocket
    var fillBytes: Int64 = 0
    var fillEnd = false
    var parentBytes: Int64 = 0
    var parentEnd = false
    var pushPromiseSeen = false
    var promisedId: UInt32 = 0 // promised stream ID carried by the received PUSH_PROMISE
    var promisedHeadersSeen = false
    var orderError = false // promised stream's HEADERS arrived before its PUSH_PROMISE
    var probePhase = false
    var leakedParent = false // DATA of stream 3 seen while the window is exhausted

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
                if (probePhase && len > 0) {
                    leakedParent = true // non-empty body DATA seen while the window is exhausted
                }
                parentBytes += len
                if ((flags & 0x01) != 0) {
                    parentEnd = true
                }
            }
        } else if (ftype == 0x01) { // HEADERS
            if (sid % 2 == 0) { // a pushed response's HEADERS on the promised (even) stream
                if (!pushPromiseSeen) {
                    orderError = true
                }
                promisedHeadersSeen = true
            }
        } else if (ftype == 0x05) { // PUSH_PROMISE on the parent stream
            var offset = 0
            if ((flags & 0x08) != 0) {
                offset = 1 // PADDED: one pad-length byte precedes the promised stream ID
            }
            promisedId = (UInt32(payload[offset]) << 24 | UInt32(payload[offset + 1]) << 16
                | UInt32(payload[offset + 2]) << 8 | UInt32(payload[offset + 3])) & 0x7FFFFFFF
            pushPromiseSeen = true
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
class TestServer2ConnWindowPush {
    let fillBody = FixedBody(CONN_WINDOW_SIZE)
    let parentBody = Array<UInt8>(PARENT_BODY_SIZE, repeat: b'p')
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testConnWindowPushOrder(): Unit {
        startServer()
        let tcp = TcpSocket("127.0.0.1", server.port)
        tcp.readTimeout = Duration.second * 10 // deadline for the whole read loop
        tcp.connect()
        let tls = TlsSocket.client(tcp, clientConfig: clientConfig())
        tls.handshake()
        let tracker = PushFrameTracker(tls)

        let authority = "127.0.0.1:${server.port}"
        let out = ArrayList<UInt8>()
        appendAll(out, CLIENT_PREFACE)
        appendAll(out, enablePushSettings())
        appendAll(out, headersFrame(1, authority, "/fill"))
        appendAll(out, headersFrame(3, authority, "/parent"))
        tls.write(out.toArray())

        // probe-phase results, captured inside the try block below: the push frames must
        // arrive while the connection window is still exhausted, before any WINDOW_UPDATE
        var probePushPromise = false
        var probePromisedHeaders = false
        var probeOrderError = false

        try {
            // phase 1: consume the whole /fill response to exhaust the connection window;
            // never send a WINDOW_UPDATE while doing so
            while (!(tracker.fillEnd && tracker.fillBytes == CONN_WINDOW_SIZE)) {
                tracker.readAndTrack()
            }
            // give the server time to queue the parent's DATA frame (blocked by the
            // exhausted window) and the push frames behind it
            sleep(Duration.millisecond * 300)
            // phase 2: the /parent handler pushes /pushed; the PUSH_PROMISE and the
            // promised stream's HEADERS must be written despite the blocked parent DATA
            tcp.readTimeout = Duration.millisecond * PUSH_PROBE_TIMEOUT_MS
            tracker.probePhase = true
            try {
                while (!(tracker.pushPromiseSeen && tracker.promisedHeadersSeen)) {
                    tracker.readAndTrack()
                }
            } catch (e: Exception) {
                println("[conn-window-push-test] probe loop ended: ${e}")
            }
            tracker.probePhase = false
            // capture the probe-phase results before the WINDOW_UPDATE replenishes the window
            probePushPromise = tracker.pushPromiseSeen
            probePromisedHeaders = tracker.promisedHeadersSeen
            probeOrderError = tracker.orderError
            // phase 3: now replenish the connection window and expect the parent's
            // blocked DATA frame to be delivered
            tcp.readTimeout = Duration.second * 10
            tls.write(windowUpdateFrame(0, UInt32(CONN_WINDOW_SIZE)))
            while (!(tracker.parentEnd && tracker.parentBytes == PARENT_BODY_SIZE)) {
                tracker.readAndTrack()
            }
        } catch (e: Exception) {
            // deadline (read timeout) or closed connection: fall through to assertions
            println("[conn-window-push-test] read loop ended: ${e}")
        }

        println("[conn-window-push-test] fill: bytes=${tracker.fillBytes} end=${tracker.fillEnd}; "
            + "parent: bytes=${tracker.parentBytes} end=${tracker.parentEnd}; "
            + "pushPromise=${tracker.pushPromiseSeen} promisedId=${tracker.promisedId} "
            + "promisedHeaders=${tracker.promisedHeadersSeen} orderError=${tracker.orderError}; "
            + "leakedParent=${tracker.leakedParent}")

        // sanity: the fill stream is fully received and consumed
        @Expect(tracker.fillBytes, CONN_WINDOW_SIZE)
        @Assert(tracker.fillEnd)
        // compatibility assertions: the PUSH_PROMISE and the promised stream's HEADERS must
        // be written while the connection window is still exhausted, before any WINDOW_UPDATE;
        // buggy behavior: the PUSH_PROMISE is held back by the blocked parent DATA frame
        // (head-of-line) or skipped by its parent stream ID, so the probe window expires
        @Assert(probePushPromise)
        @Assert(probePromisedHeaders)
        @Assert(!probeOrderError)
        // the parent's DATA must stay queued until the WINDOW_UPDATE, never leak early
        @Assert(!tracker.leakedParent)
        // regression assertion for MC-5: the dequeued parent DATA frame must survive
        // connection-window exhaustion and be delivered after the WINDOW_UPDATE
        @Expect(tracker.parentBytes, PARENT_BODY_SIZE)
        @Assert(tracker.parentEnd)

        tls.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/fill", { ctx => ctx.responseBuilder.body(fillBody) })
        server.distributor.register("/parent", { ctx =>
            sleep(Duration.millisecond * 100) // queue behind all /fill frames
            // flush the response HEADERS and the DATA frame immediately via HttpResponseWriter:
            // the parent's DATA frame must be queued (and blocked by the exhausted connection
            // window) BEFORE the push is issued. responseBuilder.body alone would defer the
            // response frames to the handler's exit, which would enqueue the PUSH_PROMISE
            // first and hide the flow-control reordering bug
            let writer = HttpResponseWriter(ctx)
            writer.write(parentBody)
            let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
            pusher.push("/pushed", "GET", HttpHeaders())
        })
        server.distributor.register("/pushed", { ctx => ctx.responseBuilder.body("pushed body") })
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 10)
        }
    }
}

// SETTINGS frame enabling server push on this connection (SETTINGS_ENABLE_PUSH = 1)
func enablePushSettings(): Array<UInt8> {
    [
        0, 0, 6, 4, 0, 0, 0, 0, 0, // frame header: length 6, type SETTINGS, no flags, stream 0
        0x00, 0x02, // SETTINGS_ENABLE_PUSH
        0x00, 0x00, 0x00, 0x01 // value 1
    ]
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
