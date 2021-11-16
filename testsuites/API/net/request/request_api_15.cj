// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main(): Int64 {
    var ssv = StringStream("")
    var req = Request(RequestMethod.GET, "http://www.google.com")
    req.write(ssv)
    var str = String(ssv.getChars())
    if(str != "GET / HTTP/1.1\r\nUser-Agent: cangjie-http-client/1.1\r\nHost: www.google.com\r\n\r\n"){
        return 1
    }
    var result = req.isClosed()
    if(result != true){
        return 2
    }
    return 0
}