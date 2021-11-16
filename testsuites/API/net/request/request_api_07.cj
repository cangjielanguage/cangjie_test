// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main(): Int64 {
    let ss = StringStream("foo=bar&foo=bar2&bar=baz")
    var sso: Option<ReadCloseStream> = Some(ss)
    var req = Request(RequestMethod.POST, "http://dummy.faketld/?a=b",stream:sso)
    var a = match (req.parseForm()) {
        case Ok(o) => 0
        case Err(o) => 1
    }
    if(a != 0){
        return 1
    }
    return 0
}