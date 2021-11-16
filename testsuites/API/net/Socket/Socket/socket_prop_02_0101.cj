// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP
    var socket = Socket(TCP,"127.0.0.1", 20202)
    //remotePort(UInt16)
    var actualremotePort=socket.remotePort
    if(actualremotePort!=20202)
    {
        print("actualremotePort+${actualremotePort}\n")
        return 1
    }
    print("success\n")
    return 0
}


