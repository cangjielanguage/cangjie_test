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
    client.close()
    var client_buf = Array<UInt8>(100,1)
    var client_r=client.write(client_buf)
    //server_size: received byte's count
    var client_size=match(client_r) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(client_size!=-1){
         return 1
    }
    server.close()
    serversocket.close()
    return 0
}