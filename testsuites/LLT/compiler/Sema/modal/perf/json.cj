
import stdx.encoding.json
import std.fs.File
import std.collection.ArrayList

class Info {
    let a: Int
    let b: Int
    let value: String
    exclave init(this @local!, a: Int, b: Int, value: String @local!) {
        this.a = a
        this.b = b
        this.value = value
    }
}

exclave func tryExtractInfo(s: String @local?): Option<Info> @local! {
    if (s.size < 22) {
        return None<Info>
    }
    if (s[0] != b'{') {
        return None<Info>
    }
    if (s[s.size - 1] != b'}') {
        return None<Info>
    }

    let prefix = "|text-style-"
    var pipeIdx: Int64 = -1
    for (i in 1..(s.size - prefix.size)) {
        if (s[i] != b'|') {
            continue
        }
        var ok = true
        for (j in 0..prefix.size) {
            if (s[i + j] != prefix[j]) {
                ok = false
                break
            }
        }
        if (ok) {
            pipeIdx = i
            break
        }
    }
    if (pipeIdx < 0) {
        return None<Info>
    }

    let valueLocal: String @local! = s[1..pipeIdx].toLocal()
    var idx = pipeIdx + prefix.size
    var a: Int = 0
    var hasA = false
    while (idx < s.size) {
        let c = s[idx]
        if (c >= b'0' && c <= b'9') {
            a = a * 10 + Int(c - b'0')
            hasA = true
            idx += 1
        } else {
            break
        }
    }
    if (!hasA) {
        return None<Info>
    }
    if (idx >= s.size || s[idx] != b'-') {
        return None<Info>
    }
    idx += 1
    // Parse second integer b.
    var b: Int = 0
    var hasB = false
    while (idx < s.size) {
        let c = s[idx]
        if (c >= b'0' && c <= b'9') {
            b = b * 10 + Int(c - b'0')
            hasB = true
            idx += 1
        } else {
            break
        }
    }
    if (!hasB) {
        return None<Info>
    }
    let info: Info @local! = Info(a, b, valueLocal)
    Some<Info>(info)
}

exclave func collectInfo(v: JsonValue @local!): ArrayList<Info> {
    match (v) {
        case o: JsonObject =>
            match (o.get("normalText")) {
                case Some(nv) =>
                    match (nv) {
                        case s: JsonString =>
                            let str = s.getValue()
                            match (tryExtractInfo(str)) {
                                case Some(info) => out.add(info)
                                case None => ()
                            }
                        case _ => ()
                    }
                case None => ()
            }
            o.getFields().forEach({ _, child =>
                collectInfo(child, out)
            })
        case a: JsonArray =>
            let n = a.size()
            for (i in 0..n) {
                match (a.get(i)) {
                    case Some(child) => collectInfo(child, out)
                    case None => ()
                }
            }
        case _ => ()
    }
}

func myParse(): ArrayList<Info> {
    let data = "origin.json"
    let raw = String.fromUtf8(File.readFrom(data))
    let jv: JsonValue @local! = JsonValue.fromStrLocal(raw)
    collectInfo(jv)
}

main() {
    
}