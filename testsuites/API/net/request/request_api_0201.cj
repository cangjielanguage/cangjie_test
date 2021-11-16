// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main(): Int64 {
    let ss = StringStream("foo=bar&foo=bar2&bar=baz")
    var sso: Option<ReadCloseStream> = Some(ss)
    var req = Request(RequestMethod.GET, "http://www.google.com", stream: sso)
    var w = StringStream("")
    req.write(w)
    var str = String(w.getChars())
    if( str != "GET / HTTP/1.1\r\nUser-Agent: cangjie-http-client/1.1\r\nHost: www.google.com\r\nContent-Length: 24\r\n\r\nfoo=bar&foo=bar2&bar=baz") {
        return 1
    }
    return 0
}