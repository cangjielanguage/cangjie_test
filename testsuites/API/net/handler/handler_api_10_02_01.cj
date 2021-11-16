// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

var code: Int64 = 0
func main() {
    var route = Route()
    route.handle("/save/66/", FuncHandler(fn))
    var req = Request(RequestMethod.GET, "http://10.10.80.90:8080/save/66")
    var rws = rwsClass(Header())
    route.serveHTTP(rws, req)
    var result = rws.hea.get("Location").getOrThrow()
    if(result != "/save/66/" || code != 301) {
        return -1
    }
    return 0
}

class rwsClass <: ResponseWriteStream {
    var hea: Header
    init(head: Header){
        hea = head
    }
    func header(): Header {
        return hea
    }
    func write(buf: Array<UInt8>): Int64 {
        0
    }
    func writeStatusCode(statusCode: Int64): Unit {
        code = statusCode
    }
}

func fn(w: ResponseWriteStream, r: Request): Unit {}
