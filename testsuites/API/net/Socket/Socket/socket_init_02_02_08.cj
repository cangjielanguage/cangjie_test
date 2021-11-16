// EXEC: %compiler %stdx_cmp_opt  %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    var socket1= Socket(TCP,"125.211", 20202,"127.0.0.1",3333)
    var actualremoteAddress=socket1.remoteAddress.hostAddress
    if(actualremoteAddress!="125.0.0.211")
    {
        print("actualremoteAddress+${actualremoteAddress}\n")
        return 1
    }
    var socket2= Socket(TCP,"125.211.34", 20202,"127.0.0.1",3333)
    var actualremoteAddress1=socket2.remoteAddress.hostAddress
    if(actualremoteAddress1!="125.211.0.34")
    {
        print("actualremoteAddress1+${actualremoteAddress1}\n")
        return 2
    }
    return 0
}