// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*
func main(): Int64 {
    var header=Header()
    header.add("111","999")
    var trailer=Header()
    trailer.add("E","A")
    var response1 = Response("abc","",200,1,1,header,trailer,false,-1,StringStream("abcdefsdf"),Array<String>(1,{i => "unchunked"}) )
    var response2 = Response("HTTP/1.1","200 OK",200,-1,1,header,trailer,false,-1,StringStream("abcdefsdf"),Array<String>(1,{i => "unchunked"}) )
    var w = StringStream("")
    response1.write(w)
    var str = String(w.getChars())
    var w1 = StringStream("")
    response2.write(w1)
    var str1 = String(w1.getChars())
    if(str != "HTTP/1.1 200 OK\r\nConnection: close\r\n111: 999\r\n\r\nabcdefsdf"){
        return 1
    }
    if(str1 != "HTTP/-1.1 200 OK\r\n111: 999\r\n\r\nabcdefsdf"){
        return 2
    }
    return 0
}