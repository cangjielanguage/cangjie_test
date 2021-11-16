// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import io.*
from std import net.*
var str_body = ""
func main(): Int64 {
    spawn {
        serve()
    }
    sleep(3000*1000*1000)
    let client = Client()
    var b = StringStream("abc=1212")
    var a = client.put("http://127.0.0.1:25211/ss","multipart/form-data",b).getOrThrow()
    var w = StringStream("")
    a.write(w)
    var str = String(w.getChars())
    if( a.statusCode != 200){
        return 1
    }
    if(str.contains("HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Length: 5\r\nDate:") != true){
        return 2
    }
    if(str.contains("GMT\r\nContent-Length: 5\r\nContent-Type: text/plain; charset=utf-8\r\n\r\nHello") != true){
        return 3
    }
    if(str_body.contains("Content-Disposition: form-data; name=\"abc\"")!=  true){
        return 4
    }
    if(str_body.contains("1212")!=  true){
        return 5
    }
    return 0
}
func serve(){
    let hd = Route()
    hd.handle("/ss", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello".toUtf8Array()
        var w = StringStream("")
        var f = req.body as StringStream
        str_body = f.getOrThrow().toString()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25211
    server.listenAndServe()
}