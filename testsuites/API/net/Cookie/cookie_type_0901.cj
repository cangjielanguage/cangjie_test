// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import time.*
var time1 = Time(2022,January,19)
var cookie = Cookie("0123456789","0123456789",path:"/a1/",domain:"1Agoogle.com",expires:time1,rawExpires:"Atime1",maxAge:0,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Default",unparsed: Array<String>(["HTTP/1.1"]))
func main(): Int64 {
    var a = cookie.toString()
    if(a.contains("0123456789=0123456789; Path=/a1/; Domain=1Agoogle.com; Expires=") != true){
        return 1
    }
    if(a.contains("HttpOnly; Secure; SameSite=Lax") != true){
        return 2
    }
    return 0
}