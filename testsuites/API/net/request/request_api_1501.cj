// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main(): Int64 {
    var ssv = StringStream("")
    var req = Request(RequestMethod.GET, "http://www.google.com")
    var result = req.isClosed()
    req.write(ssv)
    var str = String(ssv.getChars())
    if(result != true){
        return 2
    }
    return 0
}