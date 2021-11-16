// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //1.create server
    var serversocket1 = SocketServer(TCP, 20202)
    //var serversocket2 = SocketServer(TCP,"10.67.134.148",20202)
    var serversocket2 = SocketServer(TCP,"127.0.0.1",20222)
    var serverport1=serversocket1.port
    var serverport2=serversocket2.port
    if(serverport1!=20202)
    {
        print("serverport1+${serverport1}\n")
        return 1
    }
    if(serverport2!=20222)
    {
        print("serverport2+${serverport2}\n")
        return 1
    }
    serversocket1.close()
    serversocket2.close()
    print("success\n")
    return 0
}



