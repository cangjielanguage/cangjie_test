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
    var forms =Form()
    var a = 0
    var b = 0
    for (i in 1..=100){
        a = i
        b= i+100
        var c = a.toString()
        var d = b.toString()
        forms.add(c,d)
    }
    var a1 = client.putForm("http://127.0.0.1:25221/dd",forms).getOrThrow()
    var w = StringStream("")
    a1.write(w)
    var str = w.toString()
    if( a1.statusCode != 200){
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
    server.port = 25221
    server.listenAndServe()
}