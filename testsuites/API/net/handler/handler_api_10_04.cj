// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

var codeYellow: Int64 = 0
var codeBlue: Int64 = 0
func main(): Int64 {
    spawn {
        serve()
    }
    sleep(3000*1000*1000)
    let client = Client()
    match (client.get("http://127.0.0.1:8889/yellow")) {
        case Ok(v) => codeYellow = v.statusCode
        case Err(e) => println(e)
    }
    match (client.get("http://127.0.0.1:8889/blue")) {
        case Ok(v) => codeBlue = v.statusCode
        case Err(e) => println(e)
    }
   if(codeYellow != 200 || codeBlue != 404) {
       return -1
   }
   return 0
}

func serve(){
    let hd = Route()
    hd.handle("/yellow", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello from /".toUtf8Array()
        rws.write(resp)
        return
    })
    hd.handle("/red", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello from /red".toUtf8Array()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 8889
    server.listenAndServe()
}