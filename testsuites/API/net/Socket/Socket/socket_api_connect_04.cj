// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan udp can't support
// ASSERT: scan success

from std import net.*
func main()
{
    var socket = Socket(UDP,"127.0.0.1",20202,"127.0.0.1",3333)
    try{
        socket.connect()
    }catch(e:RuntimeException)
    {
        print("udp can't support\n")
    }
    print("success\n")
    return 0
}


