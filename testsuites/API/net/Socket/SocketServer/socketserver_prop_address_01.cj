// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    //1.create server
    var serversocket1 = SocketServer(TCP, 20202)
    var serversocket2 = SocketServer(TCP,"127.0.0.1",20222)
    var serveraddress1=serversocket1.address.hostAddress
    var serveraddress2=serversocket2.address.hostAddress
    if(serveraddress1!="127.0.0.1")
    {
        print("serveraddress1+${serveraddress1}\n")
        return 1
    }
    if(serveraddress2!="127.0.0.1")
    {
        print("serveraddress2+${serveraddress2}\n")
        return 2
    }
    serversocket1.close()
    serversocket2.close()
    return 0
}




