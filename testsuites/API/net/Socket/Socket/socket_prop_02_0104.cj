// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP
    var socket = Socket(TCP,"127.0.0.1", 20202)
    //localAddress(Option<SocketAddress>)
    var actuallocalAddress=match(socket.localAddress){
                             case Some(x)=>x.hostAddress
                             case $None => ""
                        }
    if(actuallocalAddress!="")
    {
        print("actuallocalAddress+${actuallocalAddress}\n")
        return 1
    }
    print("success\n")
    return 0
}


