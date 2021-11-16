// EXEC: %compiler %stdx_cmp_opt  %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    //ipv4:0.0.0.0~255.255.255.255
    var socket= Socket(TCP,"125.211", 20202)
    var actualremoteAddress=socket.remoteAddress.hostAddress
    if(actualremoteAddress!="125.0.0.211")
    {
        print("actualremoteAddress+${actualremoteAddress}\n")
        return 1
    }

    //ipv4:0.0.0.0~255.255.255.255
    var socket1= Socket(TCP,"125.211.34", 20202)
    var actualremoteAddress1=socket1.remoteAddress.hostAddress
    if(actualremoteAddress1!="125.211.0.34")
    {
        print("actualremoteAddress1+${actualremoteAddress1}\n")
        return 2
    }
    return 0
}