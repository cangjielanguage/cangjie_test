// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    var socket= SocketServer(TCP,"127.1", 20202)
    var actualremoteAddress=socket.address.hostAddress
    if(actualremoteAddress!="127.0.0.1")
    {
        print("actualremoteAddress+${actualremoteAddress}\n")
        return 1
    }

    var socket1= SocketServer(TCP,"127.1.1", 20202)
    var actualremoteAddress1=socket1.address.hostAddress
    if(actualremoteAddress1!="127.1.0.1")
    {
        print("actualremoteAddress1+${actualremoteAddress1}\n")
        return 2
    }
    socket.close()
    return 0
}


