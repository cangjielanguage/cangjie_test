// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import time.*
var time1 = Time(2022,January,19)
var cookie = Cookie("\\","789",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie1 = Cookie("\'","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    if( a != ""){
        return 1
    }
    if(a1.contains("\'=; Path=/a1/; Domain=google.com; Expires=") != true){
        return 2
    }
    if(a1.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true){
        return 3
    }
    return 0
}