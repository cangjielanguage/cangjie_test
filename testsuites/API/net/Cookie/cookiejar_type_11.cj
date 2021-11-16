// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import time.*
var cookiejar = CookieJar()
var time1 = Time(2055,January,19)
func main(): Int64 {
    let ck: Cookie = Cookie("abc","123456",path:"a1/b",domain:".weibo.cn",expires:time1,maxAge:10,secure:true,httpOnly:true,sameSite:SameSite.Lax,unparsed: Array<String>(["HTTP/1.1"]))
    var arr: Array<Cookie> = Array<Cookie>( [ck] )
    var str = "https://weibo.cn/search/?vt=4"
    let url = URL.parseRequestURI(str).getOrThrow()
    cookiejar.setCookies(url, arr)
    let arr1: Array<Cookie> = cookiejar.cookies(url)
    if(arr1.size() != 1){
        return 1
    }
    if(arr1[0].toString() != "abc=123456"){
        return 2
    }
    return 0
}