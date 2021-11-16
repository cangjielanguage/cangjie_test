// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    //1.create server
    var server = SocketServer(TCP, 20202)
    //2.create client
    var clientsocket2 = Socket(TCP,"127.0.0.1", 20202,"127.0.0.1",3333)
    //3.connect
    clientsocket2.connect()
    try{
       clientsocket2.connect()
    }catch(e:RuntimeException)
    {
        server.close()
        return 0
    }
    return 1
}




