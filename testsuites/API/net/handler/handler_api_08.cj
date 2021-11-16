// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var route = Route()
    route.handle("/edit/01", FuncHandler(editHandler))
    var req = Request(RequestMethod.GET, "http://10.10.80.90:8080/edit/01")
    var rws = rwsClass()
    var a: (Handler * String) = route.handler(req)
    a[0].serveHTTP(rws,req)
    if(a[1] != "/edit/01") {
        return -1
    }
    return 0
}

class rwsClass <: ResponseWriteStream {
    func header(): Header {
        Header()
    }
    func write(buf: Array<UInt8>): Int64 {
        6
    }
    func writeStatusCode(statusCode: Int64): Unit {}
}

func editHandler(w: ResponseWriteStream, r: Request): Unit {}