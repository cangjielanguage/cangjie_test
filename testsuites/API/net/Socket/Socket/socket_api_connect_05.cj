// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan SERVER DOESN'T EXIST
// ASSERT: scan success

from std import net.*
func main()
{
    var socket = Socket(TCP,"127.0.0.1",20202,"127.0.0.1",3333)
    try{
        socket.connect()
    }catch(e:RuntimeException)
    {
        print("SERVER DOESN'T EXIST\n")
    }
    print("success\n")
    return 0
}


