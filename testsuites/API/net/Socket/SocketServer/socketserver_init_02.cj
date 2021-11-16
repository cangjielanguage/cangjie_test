// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP|UDP
    var socket1 = SocketServer(TCP,"127.0.0.1", 20202)
    //ipv4:0.0.0.0~255.255.255.255
    var socket3= SocketServer(TCP,"255.255.255.255", 20202)
    //port：0~65535
    var socket6 = SocketServer(TCP,"127.0.0.1", 0)
    var socket7 = SocketServer(TCP,"127.0.0.1", 65535)
    var socket8 = SocketServer(TCP,"127.0.0.1", 65534)
    socket1.close()
    socket3.close()
    socket6.close()
    socket7.close()
    socket8.close()
    print("success\n")
    return 0
}


