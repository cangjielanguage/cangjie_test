// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    var serversocket = SocketServer(TCP,"127.0.0.1",20202)//225.255.244.222
    var client = Socket(TCP,"127.0.0.1",20202)
    client.connect()
    client.keepAlive=Open(UInt32(1),UInt32(1),UInt32(1))
    var server=serversocket.accept()
    server.close()
    var client_buf = Array<UInt8>(100,1)
    var client_r=client.write(client_buf)
    //5.read()
    var server_buf = Array<UInt8>(100,2)
    var server_r=server.read(server_buf)
    //server_size: received byte's count
    var server_size=match(server_r) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(server_size!=-1){
         return 2
    }
    client.close()
    serversocket.close()
    return 0
}