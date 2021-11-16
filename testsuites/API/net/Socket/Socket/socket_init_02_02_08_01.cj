// EXEC: %compiler %stdx_cmp_opt  %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    var socket1= Socket(TCP,"127.0.0.1", 20202,"125.211",3333)
    var actuallocalAddress=socket1.localAddress.getOrThrow().hostAddress
    if(actuallocalAddress!="125.0.0.211")
    {
        print("actuallocalAddress+${actuallocalAddress}\n")
        return 1
    }
    var socket2= Socket(TCP,"127.0.0.1", 20202,"125.211.34",3333)
    var actuallocalAddress1=socket2.localAddress.getOrThrow().hostAddress
    if(actuallocalAddress1!="125.211.0.34")
    {
        print("actuallocalAddress1+${actuallocalAddress1}\n")
        return 2
    }
    return 0
}