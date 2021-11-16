// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var route = Route()
    route.handle("/edit/01", FuncHandler(editHandler))
    var req = Request(RequestMethod.GET, "http://10.10.80.90:8080/edit/01")
    var rws = rwsClass(Header())
    route.serveHTTP(rws, req)
    var result = rws.header().get("Location").getOrThrow()
    if(result != "/edit/01") {
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
        6
    }
    func writeStatusCode(statusCode: Int64): Unit {}
}

func editHandler(w: ResponseWriteStream, r: Request): Unit {
    w.header().set("Location", r.url.path)
}