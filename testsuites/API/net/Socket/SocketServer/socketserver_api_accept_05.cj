// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT:scan client1 is end
// ASSERT:scan client2 is end
// ASSERT:scan socket2 is end

from std import net.*
func main()
{
    //serversocket1
    var serversocket = SocketServer(TCP, 20202)
    spawn {
        var client1 = Socket(TCP,"127.0.0.1",20202)
        client1.connect()
        var client_buf1 = Array<UInt8>([2,3,4])
        var client_r1=client1.write(client_buf1)
        var client_size1=match(client_r1) {
            case Ok(v) =>v
            case Err(e) =>-1
        }
        if(client_size1!=3||client_buf1[0]!=2||client_buf1[1]!=3||client_buf1[2]!=4)
        {
            print("client1+${client_size1}+${client_buf1[0]}+${client_buf1[1]}+${client_buf1[2]}\n")
        }
        client1.close()
        print("client1 is end\n")
    }
    spawn {
        var client2 = Socket(TCP,"127.0.0.1", 20202,"127.0.0.1",3334)
        client2.connect()
        var client_buf2 = Array<UInt8>([5,6,7])
        var client_r2=client2.write(client_buf2)
        var client_size2=match(client_r2) {
            case Ok(v) =>v
            case Err(e) =>-1
        }
        if(client_size2!=3||client_buf2[0]!=5||client_buf2[1]!=6||client_buf2[2]!=7)
        {
            print("client2+${client_size2}+${client_buf2[0]}+${client_buf2[1]}+${client_buf2[2]}\n")
        }
        client2.close()
        print("client2 is end\n")
    }
    var server1=serversocket.accept()
    var server2=serversocket.accept()
    //6.read()
    var server_buf1 = Array<UInt8>([3,5,6,7,8])
    var server_r1=server1.read(server_buf1)
    var server_size1=match(server_r1) {
       case Ok(v) =>v
       case Err(e) =>-1
    }
    if(server_size1!=3)
    {
        return 1
    }
    server1.close()

    var server_buf2 = Array<UInt8>([3,5,6,7,8])
    var server_r2=server2.read(server_buf2)

    var server_size2=match(server_r2) {
       case Ok(v) =>v
       case Err(e) =>-1
    }
    if(server_size2!=3)
    {
        return 7
    }
    server2.close()
    serversocket.close()
    print("socket2 is end\n")
    return 0
}


