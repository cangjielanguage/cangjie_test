// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main(): Int64 {
    let ss = StringStream("foo=bar&foo=bar2&bar=baz")
    var sso: Option<ReadCloseStream> = Some(ss)
    var ssv = StringStream("")
    var req = Request(RequestMethod.GET, "http://dummy.faketld/?a=b&a=c",stream: sso)
    req.header.add("Content-Type","text/plain")
    req.parseForm()
    var a = req.formValue("a")
    if(a != "b"){
        return 1
    }
    return 0
}