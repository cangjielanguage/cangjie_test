// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //net:UDP
    var socket = Socket(UDP,"2001:2002:2010:2200:2333:2304:2340:345", 20202,"2001:2002:2010:2200:2333:2304:2340:345",3333)
    //keepAlive：default=Close
    var actualkeepAlive=match(socket.keepAlive)
    {
         case Close => "close"
         case Open(2,3,4) => "24"
    }
    if(actualkeepAlive!="close")
    {
        print("actualkeepAlive+${actualkeepAlive}\n")
        return 1
    }
    print("success\n")
    return 0
}


