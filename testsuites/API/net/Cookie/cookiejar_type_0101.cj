// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookiejar = CookieJar()
func main(): Int64 {
    let ck: Cookie = Cookie("abc","123456")
    let ck1: Cookie = Cookie("11abc","")
    var li = List<Cookie>(@{ck,ck1})
    var arr: Array<Cookie> = Array<Cookie>( li )
    var str = "http://weibo.cn/search/?vt=4"
    let url = URL.parseRequestURI(str).getOrThrow()
    cookiejar.setCookies(url, arr)
    let arr1: Array<Cookie> = cookiejar.cookies(url)
    if(arr1[0].toString() != "11abc="){
        return 1
    }
    if(arr1[1].toString() != "abc=123456"){
        return 2
    }
    if(arr1.size() != 2){
        return 3
    }
    return 0
}