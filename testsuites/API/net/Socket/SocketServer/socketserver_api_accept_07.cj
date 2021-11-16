// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan serverport is different from clientport

from std import net.*
func main()
{
    //1.create server
    var serversocket1 = SocketServer(TCP,"127.0.0.1",20203)
    //2.create client
    var client1 = Socket(TCP,"127.0.0.1",20202)
    //3.connect
    try{
        client1.connect()
    }catch(e:RuntimeException){
        print("serverport is different from clientport\n")
    }
    serversocket1.close()
    print("success\n")
    return 0
}




