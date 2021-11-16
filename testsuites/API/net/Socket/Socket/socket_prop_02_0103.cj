// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP
    var socket = Socket(TCP,"127.0.0.1", 20202)
    //remoteAddress(SocketAddress)
    var actualremoteAddress=socket.remoteAddress.hostAddress
    if(actualremoteAddress!="127.0.0.1")
    {
        print("actualremoteAddress+${actualremoteAddress}\n")
        return 1
    }
    print("success\n")
    return 0
}


