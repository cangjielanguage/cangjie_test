// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //1.create server
    var serversocket = SocketServer(TCP, 20202)
    var serversocket1 = SocketServer(TCP,"127.0.0.1",20222)
    //2.create client
    var client1 = Socket(TCP,"127.0.0.1",20202)
    var client2 = Socket(TCP,"127.0.0.1", 20202,"127.0.0.1",3334)
    var client3 = Socket(TCP,"127.0.0.1",20222)
    var client4 = Socket(TCP,"127.0.0.1",20222,"127.0.0.1",3333)
    //3.connect
    client1.connect()
    client2.connect()
    client3.connect()
    client4.connect()
    //4.accept
    var server1=serversocket.accept()
    var server2=serversocket.accept()
    var server3=serversocket1.accept()
    var server4=serversocket1.accept()
    //5.write()
    var client_buf1 = Array<UInt8>([2,3,4])
    var client_r1=client1.write(client_buf1)
    var client_buf2 = Array<UInt8>([5,6,7])
    var client_r2=client2.write(client_buf2)
    var client_buf3 = Array<UInt8>([8,9,10])
    var client_r3=client3.write(client_buf3)
    var client_buf4 = Array<UInt8>([11,12,13])
    var client_r4=client4.write(client_buf4)
    //6.read()
    var server_buf1 = Array<UInt8>([3,5,6,7,8])
    var server_r1=server1.read(server_buf1)
    var server_buf2 = Array<UInt8>([3,5,6,7,8])
    var server_r2=server2.read(server_buf2)
    var server_buf3 = Array<UInt8>([3,5,6,7,8])
    var server_r3=server3.read(server_buf3)
    var server_buf4 = Array<UInt8>([3,5,6,7,8])
    var server_r4=server4.read(server_buf4)
    //client_size: send byte's count
    var client_size1=match(client_r1) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    var client_size2=match(client_r2) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    var client_size3=match(client_r3) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
   var client_size4=match(client_r4) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(client_size1!=3||client_buf1[0]!=2||client_buf1[1]!=3||client_buf1[2]!=4)
    {
        print("client1+${client_size1}+${client_buf1[0]}+${client_buf1[1]}+${client_buf1[2]}\n")
        return 1
    }
    if(client_size2!=3||client_buf2[0]!=5||client_buf2[1]!=6||client_buf2[2]!=7)
    {
        print("client2+${client_size2}+${client_buf2[0]}+${client_buf2[1]}+${client_buf2[2]}\n")
        return 2
    }
    if(client_size3!=3||client_buf3[0]!=8||client_buf3[1]!=9||client_buf3[2]!=10)
    {
        print("client3+${client_size3}+${client_buf3[0]}+${client_buf3[1]}+${client_buf3[2]}\n")
        return 3
    }
   if(client_size4!=3||client_buf4[0]!=11||client_buf4[1]!=12||client_buf4[2]!=13)
    {
        print("client4+${client_size4}+${client_buf4[0]}+${client_buf4[1]}+${client_buf4[2]}\n")
        return 4
    }
    //server_size: received byte's count
    var server_size1=match(server_r1) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    var server_size2=match(server_r2) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    var server_size3=match(server_r3) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    var server_size4=match(server_r4) {
        case Ok(v) =>v
        case Err(e) =>-1
    }
    if(server_size1!=3||server_buf1[0]!=2||server_buf1[1]!=3||server_buf1[2]!=4||server_buf1[3]!=7||server_buf1[4]!=8)
    {
        print("server1+${server_size1}+${server_buf1[0]}+${server_buf1[1]}+${server_buf1[2]}+${server_buf1[3]}+${server_buf1[4]}\n")
        return 5
    }
    if(server_size2!=3||server_buf2[0]!=5||server_buf2[1]!=6||server_buf2[2]!=7||server_buf2[3]!=7||server_buf2[4]!=8)
    {
        print("server2+${server_size2}+${server_buf2[0]}+${server_buf2[1]}+${server_buf2[2]}+${server_buf2[3]}+${server_buf2[4]}\n")
        return 6
    }
    if(server_size3!=3||server_buf3[0]!=8||server_buf3[1]!=9||server_buf3[2]!=10||server_buf3[3]!=7||server_buf3[4]!=8)
    {
        print("server3+${server_size3}+${server_buf3[0]}+${server_buf3[1]}+${server_buf3[2]}+${server_buf3[3]}+${server_buf3[4]}\n")
        return 7
    }
    if(server_size4!=3||server_buf4[0]!=11||server_buf4[1]!=12||server_buf4[2]!=13||server_buf4[3]!=7||server_buf4[4]!=8)
    {
        print("server4+${server_size4}+${server_buf4[0]}+${server_buf4[1]}+${server_buf4[2]}+${server_buf4[3]}+${server_buf4[4]}\n")
        return 8
    }
    client1.close()
    client2.close()
    client3.close()
    client4.close()
    server1.close()
    server2.close()
    server3.close()
    server4.close()
    serversocket.close()
    serversocket1.close()
    print("success\n")
    return 0
}




