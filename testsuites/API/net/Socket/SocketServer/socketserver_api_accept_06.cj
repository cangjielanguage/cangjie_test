// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: regex Failed to connect.*?110

from std import net.*
func main()
{
    //1.create server
   // var serversocket1 = SocketServer(TCP,"10.67.134.148",20202)
    var serversocket1 = SocketServer(TCP,"127.0.0.1",20202)
    //2.create client
    var client1 = Socket(TCP,"128.0.0.1",20202)
    //3.connect
    client1.connect()
    return 0
}
