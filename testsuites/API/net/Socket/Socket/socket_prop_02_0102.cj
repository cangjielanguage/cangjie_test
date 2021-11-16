// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP
    var socket = Socket(TCP,"127.0.0.1", 20202)
    //localPort(Option<UInt16>)
    var actuallocalPort=match(socket.localPort){
                             case Some(x) => Int64(x)
                             case $None => -1
                        }
    if(actuallocalPort!=-1)
    {
        print("actuallocalPort+${actuallocalPort}\n")
        return 1
    }
    print("success\n")
    return 0
}


