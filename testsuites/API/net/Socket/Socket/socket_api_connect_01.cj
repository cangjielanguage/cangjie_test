// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{

    var server = SocketServer(TCP, 20202)
    var clientsocket1 = Socket(TCP,"127.0.0.1",20202)
    var clientsocket2 = Socket(UDP,"127.0.0.1",20202)

    clientsocket1.connect()//TCP
    clientsocket1.close()
    try{
        clientsocket2.connect()//UDP
    }catch(e:RuntimeException){
        server.close()
        return 0
    }
    return 1
}




