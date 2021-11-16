// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*
func main(): Int64 {
    var header=Header()
    header.add("111","999")
    var trailer=Header()
    trailer.add("E","A")
    trailer.add("F","B")
    var response1 = Response("HTTP/2.2","100 Continue",100,1,1,header,trailer,false,-1,StringStream("abcdefsdf"),Array<String>(1,{i => "chunked"}) )
    var w = StringStream("")
    response1.write(w)
    var str = String(w.getChars())
    if(str != "HTTP/1.1 100 Continue\r\nTransfer-Encoding: chunked\r\nTrailer: E,F\r\n111: 999\r\n\r\n9\r\nabcdefsdf\r\n0\r\nE: A\r\nF: B\r\n\r\n"){
        return 1
    }
    return 0
}