// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import io.*
from std import net.*
var c = ""
var c1 = ""
func main(): Int64 {
    spawn {
        serve()
    }
    sleep(3000*1000*1000)
    var cookiejar = CookieJar()
    let ck: Cookie = Cookie("abc","123456")
    let ck1: Cookie = Cookie("11abc","ABC")
    var li = List<Cookie>(@{ck,ck1})
    var arr: Array<Cookie> = Array<Cookie>( li )
    var str1 = "http://127.0.0.1:25104/dd"
    let url = URL.parseRequestURI(str1).getOrThrow()
    cookiejar.setCookies(url, arr)
    let client = Client()
    client.jar = cookiejar
    var a = client.get("http://127.0.0.1:25104/dd").getOrThrow()
    var w = StringStream("")
    a.write(w)
    var str = String(w.getChars())
    if( a.statusCode != 200){
        return 1
    }
    if( c1 != "abc=123456"){
        return 2
    }
    if( c != "11abc=ABC"){
        return 3
    }
    return 0
}

func serve(){
    let hd = Route()
    hd.handle("/dd", { rws: ResponseWriteStream, req: Request =>
        var b = req. cookies()
        c= b[0].toString()
        c1= b[1].toString()
        let resp = "Hello".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25104
    server.listenAndServe()
}