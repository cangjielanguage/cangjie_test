// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main(): Int64 {
    let ss = StringStream("foo=bar&foo=bar2&bar=baz")
    var sso: Option<ReadCloseStream> = Some(ss)
    var ssv = StringStream("")
    var req = Request(RequestMethod.POST, "https://linstar.huawei.com/hci/requirement/91c74136881e44fc9b220ed524bd2576", stream: sso)
    var ba = BasicAuth("xiaoli","123456")
    req.setBasicAuth(ba)
    var str = ""
    var a = req.header.get("Authorization")
    match (a) {
        case Some(b) => str = b.toString()
        case $None => ()
    }
    if(str != "Basic eGlhb2xpOjEyMzQ1Ng=="){
        return 1
    }
    return 0
}