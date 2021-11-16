// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Exception stopped after 15 redirects

from std import collection.*
from std import io.*
from std import net.*
func main(): Int64 {
    spawn {
        serve()
    }
    sleep(3000*1000*1000)
    let client = Client()
    client.checkRedirect = defaultCheckRedirect1
    var a = client.get("http://127.0.0.1:25102/dd").getOrThrow()
    return 0
}

func serve(){
    let hd = Route()
    hd.handle("/dd", { rws: ResponseWriteStream, req: Request =>
        rws.header().add("Location", "http://0.0.0.0:25102/red")
        rws.writeStatusCode(301)
        let resp = "Hello".toUtf8Array()
        rws.write(resp)
        return
    })
    hd.handle("/red", { rws: ResponseWriteStream, req: Request =>
        rws.header().add("Location", "http://0.0.0.0:25102/dd")
        rws.writeStatusCode(301)
        let resp = "Hello from /red".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25102
    server.listenAndServe()
}
func defaultCheckRedirect1(req: Request, reqs: Buffer<Request>): Unit {
   if (reqs.size() > 15) {
       throw Exception("stopped after 15 redirects")
   }
}