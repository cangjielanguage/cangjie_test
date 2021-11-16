// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main(): Int64 {
    let ss = StringStream("foo=bar&foo=bar2&bar=baz")
    var sso: Option<ReadCloseStream> = Some(ss)
    var ssv = StringStream("")
    var req = Request(RequestMethod.POST, "https://linstar.huawei.com/hci/requirement/91c74136881e44fc9b220ed524bd2576", stream: sso)
    req.header.add("Referer","https://linstar.huawei.com/hci/subject/02271d03429d4ed9a5ee98921b9e3cd4")
    var result = req.referer()
    if(result != "https://linstar.huawei.com/hci/subject/02271d03429d4ed9a5ee98921b9e3cd4"){
        return 1
    }
    return 0
}