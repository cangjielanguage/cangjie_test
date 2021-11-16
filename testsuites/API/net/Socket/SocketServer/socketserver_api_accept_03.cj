// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    var serversocket = SocketServer(TCP, 20202)
    spawn {
        //different thread
        var buf=Array<UInt8>([2,3,4])
        client(TCP,"127.0.0.1",20202,buf)
    }
    // same thread
    var client1 = Socket(TCP,"127.0.0.1",20202)
    client1.connect()
    var writedata=Array<UInt8>([4,5,6,7])
    var client_size=match(client1.write(writedata)) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(client_size!=writedata.size())
    {
        print("client_size+${client_size}\n")
        return 2
    }
    //different thread
    var server = serversocket.accept()
    var readdata=Array<UInt8>([4,5,6,7,8,8,8,9])
    var server_size=match(server.read(readdata)) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(server_size!=4||readdata[0]!=4||readdata[1]!=5||readdata[2]!=6||readdata[3]!=7){
         print("server_size+${server_size}+${readdata[0]}+${readdata[1]}+${readdata[2]}+${readdata[3]}\n")
         return 2
    }
    // same thread
    var server1 = serversocket.accept()
    var readdata1=Array<UInt8>([4,5,6,7,8,8,8,9])
    var server_size1=match(server1.read(readdata1)) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(server_size1!=3||readdata1[0]!=2||readdata1[1]!=3||readdata1[2]!=4){
         //error_result: server_size1+6+2+3+4
         print("server_size1+${server_size1}+${readdata1[0]}+${readdata1[1]}+${readdata1[2]}\n")
         return 1
    }
    serversocket.close()
    client1.close()
    server.close()
    server1.close()
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