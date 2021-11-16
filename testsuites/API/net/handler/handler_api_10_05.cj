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
    var a = client.get("http://127.0.0.1:8888/red").getOrThrow()
    var w = StringStream("")
    a.write(w)
    var str = String(w.getChars())
    var heads: String = ""
    for ( (k,j)  in a.header){
       if(k == "Gtt") {
          for( jj in j){
              heads = jj
          }
       }
   }
   if(a.statusCode != 500) {
        return 1
   }
   if(str.contains("Hello") != true ) {
       return 2
   }
   if(heads.contains("gtt123") != true ) {
      return 3
  }
   return 0
}

func serve(){
    let hd = Route()
    hd.handle("/red", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello".toUtf8Array()
        rws.header().add("Gtt", "gtt123")
        rws.writeStatusCode(500)
        rws.write(resp)
        return
    })
    let server = Server(hd)
    server.port = 8888
    server.listenAndServe()
}


