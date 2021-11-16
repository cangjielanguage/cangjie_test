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
    var b = StringStream("abc")
    try
    {
        client.delete("http://127.0.0.1:25111/d\"","text/plain",b).getOrThrow()
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
    hd.handle("/dd", { rws: ResponseWriteStream, req: Request =>
        rws.header().add("Location", "http://0.0.0.0:25111/red")
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
    server.port = 25111
    server.listenAndServe()
}