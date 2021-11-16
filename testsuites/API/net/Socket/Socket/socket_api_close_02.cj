// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan re-connect error 1
// ASSERT: scan re-connect error 2
// ASSERT: scan success

from std import net.*
func main()
{
    //1.create server
    var server = SocketServer(TCP, 20202)
    //2.create client
    var clientsocket1 = Socket(TCP,"127.0.0.1",20202)
    var clientsocket3 = Socket(TCP,"127.0.0.1", 20202,"127.0.0.1",3333)
    //3.connect
    clientsocket1.connect()
    clientsocket3.connect()
    //4.closs
    clientsocket1.close()
    clientsocket3.close()
    clientsocket1.close()
    clientsocket3.close()
    //5.re-connect --error
    try{
        clientsocket1.connect()
    }catch(e:RuntimeException)
    {
        print("re-connect error 1\n")
    }
    try{
        clientsocket3.connect()
    }catch(e:RuntimeException)
    {
        print("re-connect error 2\n")
    }
    server.close()
    print("success\n")
    return 0
}




