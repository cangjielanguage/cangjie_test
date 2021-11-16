// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //1.create server
    var server = SocketServer(TCP, 20202)
    //2.create client
    var clientsocket = Socket(TCP,"127.0.0.1",20202)
    //3.connect
    clientsocket.connect()
    //4.accept:return serversocket
    var serversocket=server.accept()
    //5.write()
    var client_buf = Array<UInt8>()
    var client_r=clientsocket.write(client_buf)
    var client_size=match (client_r) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(client_size!=-1)
    {
        print("${client_size}\n")
        return 1
    }
    clientsocket.close()
    serversocket.close()
    server.close()
    print("success\n")
    return 0
}


