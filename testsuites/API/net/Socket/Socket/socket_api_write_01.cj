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
    var client_buf = Array<UInt8>([2,3,4])
    var client_r=clientsocket.write(client_buf)
    var client_size=match (client_r) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(client_size!=3||client_buf[0]!=2||client_buf[1]!=3||client_buf[2]!=4)
    {
        print("${client_size}+${client_buf[0]}+${client_buf[1]}+${client_buf[2]}\n")
        return 1
    }
    //5.read()
    var server_buf = Array<UInt8>(3,0)
    var server_r=serversocket.read(server_buf)
    var server_size=match (server_r) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    //6.verify data
    if(server_size!=3||server_buf[0]!=2||server_buf[1]!=3||server_buf[2]!=4)
    {
        print("${server_size}+${server_buf[0]}+${server_buf[1]}+${server_buf[2]}\n")
        return 2
    }
    clientsocket.close()
    serversocket.close()
    server.close()
    print("success\n")
    return 0
}


