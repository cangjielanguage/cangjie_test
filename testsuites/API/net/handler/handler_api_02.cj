// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

var resWrite: Int64 = 0
var code: Int64 = 0
func main(){
    var handler = FuncHandler (fn)
    var req = Request(RequestMethod.GET, "http://10.10.80.90:8080/edit/apple/123")
    var rws = rwsClass(Header())
    handler.serveHTTP(rws, req)
    var head = rws.hea.get("Location").getOrThrow()
    if(resWrite != 7 || head != "/edit/apple/123" || code != 200) {
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
        7
    }
    func writeStatusCode(statusCode: Int64): Unit {
        code = statusCode
    }
}

func fn(w: ResponseWriteStream, r: Request): Unit {
    w.header().set("Location", r.url.path)
    resWrite = w.write(Array<UInt8>([1,2,3,4]))
    w.writeStatusCode(200)
}
