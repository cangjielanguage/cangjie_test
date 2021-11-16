// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    var serversocket = SocketServer(TCP,"127.0.0.1",20202)//225.255.244.222
    var client = Socket(TCP,"127.0.0.1",20202)
    client.connect()
    //keepAlive：default=Close
    client.keepAlive=Open(UInt32(2),UInt32(3),UInt32(4))
    var actualkeepAlive=match(client.keepAlive)
    {
         case $Close => "close"
         case Open(x,y,z) => "24"
    }
    if(actualkeepAlive!="24")
    {
        print("actualkeepAlive+${actualkeepAlive}\n")
        return 1
    }
    client.close()
    serversocket.close()
    print("success\n")
    return 0
}