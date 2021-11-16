// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

var cookie1: Cookie = Cookie("xiaoLi","cangjie", path:"/", domain: ".weibo.cn", maxAge: 500)
var cookie2: Cookie = Cookie("daMing","cangjie", path:"/", domain: ".baidu.com", maxAge: 300)
func main(): Int64 {
    let ss = StringStream("foo=bar&foo=bar2&bar=baz")
    var sso: Option<ReadCloseStream> = Some(ss)
    var req = Request(RequestMethod.POST, "http://www.google.com", stream: sso)
    req.addCookie(cookie1)
    req.addCookie(cookie2)
    var cooResult1 = req.cookie("xiaoLi")
    var cooResult2 = req.cookie("daMing")
    var str1 = ""
    var str2 = ""
    match (cooResult1) {
        case Ok(coo) => str1 = coo.toString()
        case Err(e) => ()
    }
    match (cooResult2) {
        case Ok(coo) => str2 = coo.toString()
        case Err(e) => ()
    }
    if(str1 != "xiaoLi=cangjie"){
        return 1
    }
    if(str2 != "daMing=cangjie"){
        return 2
    }
    return 0
}