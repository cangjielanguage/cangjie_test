// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan ipv6 can't support
// ASSERT: scan unsupported
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP
    var socket = Socket(TCP,"2001:2002:2010:2200:2333:2304:2340:345",20202,"2001:2002:2010:2200:2333:2304:2340:345",3333)
    try{
        socket.connect()
    }catch(e:RuntimeException)
    {
        print("ipv6 can't support\n")
    }
    print("success\n")
    return 0
}


