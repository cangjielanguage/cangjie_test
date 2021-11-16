// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import time.*
var time1 = Time(2022,January,19)
var cookiejar = CookieJar()
func main(): Int64 {
    let ck: Cookie = Cookie()
    let ck1: Cookie = Cookie("0123456789","0123456789")
    var arr: Array<Cookie> = Array<Cookie>([ck])
    var arr1: Array<Cookie> = Array<Cookie>([ck1])
    var str = "http://weibo.cn/search/?vt=4"
    let url = URL.parse(str).getOrThrow()
    var str1 = "http://acb.com/search/?vt=4"
    let url1 = URL.parse(str1).getOrThrow()
    cookiejar.setCookies(url, arr)
    cookiejar.setCookies(url1, arr1)
    let arr2: Array<Cookie> = cookiejar.cookies(url)
    let arr3: Array<Cookie> = cookiejar.cookies(url1)
    if(arr2[0].toString() != ""){
        return 1
    }
    if(arr3[0].toString() != "0123456789=0123456789"){
        return 2
    }
    return 0
}
