// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*
func main(): Int64 {
    var header=Header()
    header.add("111","999")
    var trailer=Header()
    trailer.add("E","A")
    var response1 = Response("HTTP/2.2","100 Continue",100,1,1,header,trailer,false,0,StringStream("abcdefsdf"),Array<String>(1,{i => "unchunked"}) )
    var w = StringStream("")
    response1.write(w)
    var str = String(w.getChars())
    if(str != "HTTP/1.1 100 Continue\r\nConnection: close\r\n111: 999\r\n\r\nabcdefsdf"){
        return 1
    }
    return 0
}