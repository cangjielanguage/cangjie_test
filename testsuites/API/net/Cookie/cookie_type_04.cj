// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import time.*
var time1 = Time(2022,January,19)
var cookie = Cookie("0123456789","0123456789",path:"/0123456789",domain:"google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie1 = Cookie("ABCDEFGHIJKLMNOPQRSTUVWXYZ","ABCDEFGHIJKLMNOPQRSTUVWXYZ",path:"/ABCDEFGHIJKLMNOPQRSTUVWXYZ/",domain:"1google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie2 = Cookie("abcdefghijklmnopqrstuvwxyz","abcdefghijklmnopqrstuvwxyz",path:"abcdefghijklmnopqrstuvwxyz",domain:".goo-gle.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie3 = Cookie("!#$%&*+-.^_`|~","!#$%&*+-.^_`|~'",path:"/!#$%&*+-.^_`|~'/",domain:"Google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie4 = Cookie("!#$%&*+-.^_`|~","()<>@:/[]?={}",path:"/\\()<>@:/[]?={}/",domain:".goo-gle1.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    var a2 = cookie2.toString()
    var a3 = cookie3.toString()
    var a4 = cookie4.toString()
    if(a.contains("0123456789=0123456789; Path=/0123456789; Domain=google.com; Expires=") != true){
        return 1
    }
    if(a.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true){
        return 2
    }
    if(a1.contains("ABCDEFGHIJKLMNOPQRSTUVWXYZ=ABCDEFGHIJKLMNOPQRSTUVWXYZ; Path=/ABCDEFGHIJKLMNOPQRSTUVWXYZ/; Domain=1google.com; Expires=") != true){
        return 3
    }
    if(a1.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true){
        return 4
    }
    if(a2.contains("abcdefghijklmnopqrstuvwxyz=abcdefghijklmnopqrstuvwxyz; Path=abcdefghijklmnopqrstuvwxyz; Domain=goo-gle.com; Expires=") != true){
        return 5
    }
    if(a2.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true){
        return 6
    }
    if(a3.contains("!#$%&*+-.^_`|~=!#$%&*+-.^_`|~'; Path=/!#$%&*+-.^_`|~'/; Domain=Google.com; Expires=") != true){
        return 7
    }
    if(a3.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true){
        return 8
    }
    if(a4.contains("!#$%&*+-.^_`|~=()<>@:/[]?={}; Path=/\\()<>@:/[]?={}/; Domain=goo-gle1.com; Expires=") != true){
        return 9
    }
    if(a4.contains("Max-Age=0; HttpOnly; Secure; SameSite=Lax") != true){
        return 10
    }
    return 0
}