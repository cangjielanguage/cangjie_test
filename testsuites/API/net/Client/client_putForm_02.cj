// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import io.*
from std import net.*
func main(): Int64 {
    spawn {
        serve()
    }
    sleep(3000*1000*1000)
    let client = Client()
    var forms = Form("a1=26&1D2=3Da")
    var a = client.putForm("http://127.0.0.1:25214/ss",forms).getOrThrow()
    var w = StringStream("")
    a.write(w)
    var str = w.toString()
    if( a.statusCode != 404){
        return 1
    }
    if(str.contains("HTTP/1.1 404 Not Found\r\nConnection: close\r\nContent-Length: 18\r\nDate") != true){
        return 2
    }
    if(str.contains("GMT\r\nX-Content-Type-Options: nosniff\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Length: 18\r\n\r\n404 page not found") != true){
        return 3
    }
    return 0
}
func serve(){
    let hd = Route()
    hd.handle("/dd", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25214
    server.listenAndServe()
}