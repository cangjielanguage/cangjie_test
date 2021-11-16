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
    var forms = Form("1=a&2=A")
    var a = client.deleteForm("http://127.0.0.1:25132/dd",forms).getOrThrow()
    var w = StringStream("")
    a.write(w)
    var str = w.toString()
    if( a.statusCode != 200){
        return 1
    }
    if(str.contains("HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Length: 5\r\nDate:") != true){
        return 2
    }
    if(str.contains("GMT\r\nContent-Length: 5\r\nContent-Type: text/plain; charset=utf-8\r\n\r\nHello") != true){
        return 3
    }
    if(str_body != "1=a&2=A"){
        return 4
    }
    return 0
}
func serve(){
    let hd = Route()
    hd.handle("/dd", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello".toUtf8Array()
        var w = StringStream("")
        var f = req.body as StringStream
        str_body = f.getOrThrow().toString()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25132
    server.listenAndServe()
}