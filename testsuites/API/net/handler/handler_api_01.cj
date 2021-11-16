// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

var rwsWrite: Int64 = 0
func main(){
    var handler = FuncHandler (fn)
    var req = Request(RequestMethod.GET, "http://10.10.80.90:8080/edit/apple/123")
    var rws = rwsClass()
    handler.serveHTTP(rws, req)
    if(rwsWrite != 7) {
        return -1
    }
    return 0
}

class rwsClass <: ResponseWriteStream {
    func header(): Header {
        Header()
    }
    func write(buf: Array<UInt8>): Int64 {
        7
    }
    func writeStatusCode(statusCode: Int64): Unit {}
}

func fn(w: ResponseWriteStream, r: Request): Unit {
    rwsWrite = w.write(Array<UInt8>([1,2,3]))
}
