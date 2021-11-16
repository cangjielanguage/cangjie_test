// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main():Int64{
    var req = Request(RequestMethod.GET, "https://www.baidu.com/s?wd=上海悠悠博客园")
    var w = StringStream("")
    req.write(w)
    var str = String(w.getChars())
    if( str != "GET /s?wd=上海悠悠博客园 HTTP/1.1\r\nUser-Agent: cangjie-http-client/1.1\r\nHost: www.baidu.com\r\n\r\n") {
        return 1
    }
    return 0
}