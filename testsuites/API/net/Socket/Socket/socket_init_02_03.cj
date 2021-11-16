// EXEC: %compiler %stdx_cmp_opt  %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan SocketException1
// ASSERT: scan success

from std import net.*
func main()
{
    //address
    var serversocket1 = SocketServer(TCP,"225.255.244.222",20202)
    try{
        var socket1= Socket(TCP,"225.255.244.222",20202,"127.0.0.1",3333)
        print("${socket1}\n")
        socket1.connect()
    }catch(e:RuntimeException){
        print("SocketException1\n")
    }
    //localAddress
    var serversocket2 = SocketServer(TCP,"127.0.0.1",20202)
    var socket2= Socket(TCP,"127.0.0.1",20202,"225.255.244.222",3333)
    socket2.connect()
    var server=serversocket2.accept()
    socket2.close()
    server.close()
    print("success\n")
    return 0
}