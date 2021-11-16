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
    var b = StringStream("abc=1212")
    try
    {
        client.put("http://127.0.0.1:25205/ss","application/json",b).getOrThrow()
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
    hd.handle("/ss", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 25205
    server.listenAndServe()
}