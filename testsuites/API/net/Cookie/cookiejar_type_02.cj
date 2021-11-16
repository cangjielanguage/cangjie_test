// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookiejar = CookieJar()
func main(): Int64 {
    let ck: Cookie = Cookie("abc","123456",path:"/a1/")
    var arr: Array<Cookie> = Array<Cookie>([ck])
    var str = "http://weibo.cn/search/?vt=4"
    let url = URL.parseRequestURI(str).getOrThrow()
    cookiejar.setCookies(url, arr)
    let arr1: Array<Cookie> = cookiejar.cookies(url)
    if(arr1.size() != 0){
        return 2
    }
    return 0
}