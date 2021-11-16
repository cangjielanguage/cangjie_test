// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socket1 = Socket(TCP, "www.baidu.com", 20202)
    var actualhostname = socket1.remoteAddress.hostName.getOrThrow()
    if(actualhostname != "www.baidu.com")
    {
        return 1
    }
    return 0
}