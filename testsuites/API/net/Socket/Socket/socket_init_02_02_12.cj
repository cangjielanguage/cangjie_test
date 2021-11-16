// EXEC: %compiler %stdx_cmp_opt  %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    var socket1= Socket(TCP,"0:0:0:0:0:0:0:0",20202,"127.0.0.0",3333)
    var actualremoteAddress1=socket1.remoteAddress.hostAddress
    var actuallocalAddress1=socket1.localAddress.getOrThrow().hostAddress
    if(actualremoteAddress1!="[::]"||actuallocalAddress1!="127.0.0.0")
    {
        print("actualremoteAddress+${actualremoteAddress1}+${actuallocalAddress1}\n")
        return 1
    }
    var socket2= Socket(TCP,"127.0.0.0",20202,"0:0:0:0:0:0:0:0",3333)
    var actualremoteAddress2=socket2.remoteAddress.hostAddress
    var actuallocalAddress2=socket2.localAddress.getOrThrow().hostAddress
    if(actualremoteAddress2!="127.0.0.0"||actuallocalAddress2!="[::]")
    {
        print("actualremoteAddress+${actualremoteAddress2}+${actuallocalAddress2}\n")
        return 2
    }
    return 0
}