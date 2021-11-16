// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan socketserver can't support udp

from std import net.*
func main()
{
    try{
        var socket = SocketServer(UDP,"127.0.0.1", 20202)
    }catch(e:RuntimeException){
        print("socketserver can't support udp\n")
    }
    print("success\n")
    return 0
}