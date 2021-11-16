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
    var a = client.get("http://127.0.0.1:25142/d%E4%BD%A0").getOrThrow()
    var w = StringStream("")
    a.write(w)
    var str = String(w.getChars())
    if( a.statusCode != 200){
        return 1
    }
    if(str.contains("HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Length: 15\r\nDate:") != true){
        return 2
    }
    if(str.contains("GMT\r\nContent-Length: 15\r\nContent-Type: text/plain; charset=utf-8\r\n\r\nHello from /red") != true){
        return 3
    }
    return 0
}

func serve(){
    let hd = Route()
    hd.handle("/d%E4%BD%A0", { rws: ResponseWriteStream, req: Request =>
        rws.header().add("Location", "http://0.0.0.0:25142/red")
        rws.writeStatusCode(303)
        let resp = "Hello".toUtf8Array()
        rws.write(resp)
        return
    })
    hd.handle("/", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello from /red".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25142
    server.listenAndServe()
}