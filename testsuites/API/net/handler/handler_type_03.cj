// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*

func main(): Int64 {
    spawn {
        serve()
    }
    sleep(3000*1000*1000)
    let client = Client()
    var a = client.get("http://127.0.0.1:8881/gg").getOrThrow()
    var w = StringStream("")
    a.write(w)
    var str = String(w.getChars())
    if(a.statusCode != 200) {
        return 1
    }
    if(str.contains("/dd") != true ) {
        return 2
    }
    return 0
}

func serve(){
    var hd = myHandler ()
    let server = Server(hd)
    server.port = 8881
    server.listenAndServe()
}
class myHandler <: Handler {
    func serveHTTP(w: ResponseWriteStream, r: Request): Unit {
        let resp = "/dd".toUtf8Array()
        w.write(resp)
        return
    }
}