// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*
func main(): Int64 {
    var response1 = Response()
    var w = StringStream("")
    response1.write(w)
    var str = String(w.getChars())
    if(str != "HTTP/0.0 000 status code 0\r\nContent-Length: 0\r\n\r\n"){
        return 1
    }
    return 0
}