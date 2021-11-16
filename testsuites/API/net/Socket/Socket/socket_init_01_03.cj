// EXEC: %compiler %stdx_cmp_opt  %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan SocketException1
// ASSERT: scan success

from std import net.*
func main()
{
    var serversocket = SocketServer(TCP,"225.255.244.222",20202)
    try{
        var socket1= Socket(TCP,"225.255.244.222", 20202)
        socket1.connect()
    }catch(e:RuntimeException){
        print("SocketException1\n")
    }
    print("success\n")
    return 0
}