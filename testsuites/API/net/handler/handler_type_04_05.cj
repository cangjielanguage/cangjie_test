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
    var a = client.get("http://127.0.0.1:8881/dd").getOrThrow()
    var w = StringStream("")
    a.write(w)
    var str = String(w.getChars())
    if(a.statusCode != 200) {
        return 1
    }
    if(str.contains("red") != true ) {
        return 2
    }
    return 0
}

func serve(){
    let hd = Route()
    hd.handle("/dd", { rws: ResponseWriteStream, req: Request =>
        rws.header().add("Location", "http://0.0.0.0:8881/red")
        let resp = "dd".toUtf8Array()
        rws.writeStatusCode(307)
        rws.write(resp)
        return
    })
    hd.handle("/red", { rws: ResponseWriteStream, req: Request =>
        let resp = "red".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 8881
    server.listenAndServe()
}
