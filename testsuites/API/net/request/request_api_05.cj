// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

var cookie1: Cookie = Cookie("xiaoli","cangjie", path:"/", domain: ".weibo.cn", maxAge: 500)
var cookie2: Cookie = Cookie("xiaoli","cangjie", path:"/", domain: ".weibo.cn", maxAge: 500)
func main(): Int64 {
    let ss = StringStream("foo=bar&foo=bar2&bar=baz")
    var sso: Option<ReadCloseStream> = Some(ss)
    var req = Request(RequestMethod.POST, "http://www.google.com", stream: sso)
    req.addCookie(cookie1)
    req.addCookie(cookie2)
    var cooResult = req.cookie("xiaoli")
    var str = ""
    match (cooResult) {
        case Ok(coo) => str = coo.toString()
        case Err(e) => ()
    }
    if (str != "xiaoli=cangjie"){
        return 1
    }
    return 0
}