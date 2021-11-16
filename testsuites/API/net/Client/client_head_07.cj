// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass

from std import io.*
from std import net.*
func main(): Int64 {
    spawn {
        serve()
    }
    sleep(3000*1000*1000)
    let client = Client()
    try
    {
        client.head("http://127.0.0.1:25155/d\"").getOrThrow()
        ()
    }
    catch(e:Exception)
    {
        print("case pass")
    }
    return 0
}

func serve(){
    let hd = Route()
    hd.handle("/d%E4%BD%A0", { rws: ResponseWriteStream, req: Request =>
        rws.header().add("Location", "http://0.0.0.0:25155/red")
        rws.writeStatusCode(303)
        let resp = "Hello".toUtf8Array()
        rws.write(resp)
        return
    })
    hd.handle("/red", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello from /red".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25155
    server.listenAndServe()
}