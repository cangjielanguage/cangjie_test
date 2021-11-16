// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    var serversocket = SocketServer(TCP, 20202)
    spawn {
        var buf=Array<UInt8>([2,3,4])
        client(TCP,"127.0.0.1",20202,buf)
    }
    var server = serversocket.accept()
    var readdata=Array<UInt8>([4,5,6,100,100,100,100])
    var server_size=match(server.read(readdata)) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(server_size!=3||readdata[0]!=2||readdata[1]!=3||readdata[2]!=4){
         print("server_size+${server_size}+${readdata[0]}+${readdata[1]}+${readdata[2]}+${readdata[3]}+${readdata[4]}+${readdata[5]}+${readdata[6]}\n")
         return 1
    }
    serversocket.close()
    server.close()
    print("success\n")
    return 0
}

func client(net: SocketNet, address: String, port: UInt16,data:Array<UInt8>): Int64 {
    var client = Socket(net,address, port)
    client.connect()
    var client_size=match(client.write(data)) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(client_size!=data.size())
    {
        print("client_size+${client_size}\n")
        return 2
    }
    client.close()
    return 0
}