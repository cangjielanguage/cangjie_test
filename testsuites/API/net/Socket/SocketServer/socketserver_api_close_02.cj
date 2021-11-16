// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan re-connect error 1
// ASSERT: scan re-connect error 2
// ASSERT: scan success

from std import net.*
func main()
{
    //1.create server
    var socketserver = SocketServer(TCP, 20202)
    //2.create client
    var clientsocket1 = Socket(TCP,"127.0.0.1",20202)
    var clientsocket2 = Socket(TCP,"127.0.0.1", 20202,"127.0.0.1",3333)
    //3.connect
    clientsocket1.connect()
    clientsocket2.connect()
    //4.closs
    socketserver.close()
    socketserver.close()
    try{
        var server1=socketserver.accept()
    }catch(e:RuntimeException){
        print("re-connect error 1\n")
    }
    try{
        var server2=socketserver.accept()
    }catch(e:RuntimeException){
        print("re-connect error 2\n")
    }
    clientsocket1.close()
    clientsocket2.close()
    print("success\n")
    return 0
}