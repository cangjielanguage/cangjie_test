// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan address1 is invalid
// ASSERT: scan address2 is invalid
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP|UDP
    var socket5= SocketServer(TCP,"0.0.0.0", 20202)
    try{
        var socket5= SocketServer(TCP,"0.0.0.0", 20202)
    }catch(e:RuntimeException)
    {
        print("address1 is invalid\n")
    }

    try{
        var socket2= SocketServer(TCP,"225.255.244.222", 20202)
    }catch(e:RuntimeException)
    {
        print("address2 is invalid\n")
    }
    print("success\n")
    return 0
}