// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import time.*
var time1 = Time(2022,January,19)
var cookie = Cookie(" ","789",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie1 = Cookie("(","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie2 = Cookie(")","9",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie3 = Cookie("<","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie4 = Cookie(">","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie5 = Cookie("@","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie6 = Cookie(",","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie7 = Cookie(";","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie8 = Cookie(":","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie9 = Cookie("}","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie10 = Cookie("/","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie11 = Cookie("[","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie12 = Cookie("]","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie13 = Cookie("?","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie14 = Cookie("=","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie15 = Cookie("{","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
var cookie16 = Cookie("\\","",path:"/a1/",domain:".google.com",expires:time1,rawExpires:"time1",maxAge:-1,secure:true,httpOnly:true,sameSite:SameSite.Lax,raw: "Lax",unparsed: Array<String>(["HTTP/1.1"]))
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    var a2 = cookie2.toString()
    var a3 = cookie3.toString()
    var a4 = cookie4.toString()
    var a5 = cookie5.toString()
    var a6 = cookie6.toString()
    var a7 = cookie7.toString()
    var a8 = cookie8.toString()
    var a9 = cookie9.toString()
    var a10 = cookie10.toString()
    var a11 = cookie11.toString()
    var a12 = cookie12.toString()
    var a13 = cookie13.toString()
    var a14 = cookie14.toString()
    var a15 = cookie15.toString()
    var a16 = cookie16.toString()
    if( a != ""){
        return 1
    }
    if( a1 != ""){
        return 2
    }
    if( a2 != ""){
        return 3
    }
    if( a3 != ""){
        return 4
    }
    if( a4 != ""){
        return 5
    }
    if( a5 != ""){
        return 6
    }
    if( a6 != ""){
        return 7
    }
    if( a7 != ""){
        return 8
    }
    if( a8 != ""){
        return 9
    }
    if( a9 != ""){
        return 10
    }
    if( a10 != ""){
        return 11
    }
    if( a11 != ""){
        return 12
    }
    if( a12 != ""){
        return 13
    }
    if( a13 != ""){
        return 14
    }
    if( a14 != ""){
        return 15
    }
    if( a15 != ""){
        return 16
    }
    if( a16 != ""){
        return 17
    }
    return 0
}