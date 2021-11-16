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
    var a = client.get("http://127.0.0.1:25144/dd").getOrThrow()
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
    server.port = 25144
    server.listenAndServe()
}