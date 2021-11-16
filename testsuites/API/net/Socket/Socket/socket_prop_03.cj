// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1| compare %f
// ASSERT: scan SocketException: Socket is not connected

from std import net.*
func main()
{
    //net:TCP
    var socket = Socket(TCP,"2001:2002:2010:2200:2333:2304:2340:345",20202,"2001:2002:2010:2200:2333:2304:2340:345",3333)
    socket.keepAlive=Open(UInt32(2),UInt32(3),UInt32(4))
    return 0
}


