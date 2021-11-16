// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass

from std import net.*
from std import io.*
func main(): Int64 {
    spawn {
        serve()
    }
    sleep(3000*1000*1000)
    let client = Client()
    var b = StringStream("ab")
    try
    {
        client.put("","text/plain",b).getOrThrow()
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}

func serve(){
    let hd = Route()
    hd.handle("/", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25195
    server.listenAndServe()
}
