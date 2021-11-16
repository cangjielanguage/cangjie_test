// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP
    var socket = Socket(TCP,"127.0.0.1", 20202)
    //handle(Int32)
    var actualhandle=socket.handle
    if(actualhandle!=-1)
    {
        print("actualhandle+${actualhandle}\n")
        return 1
    }
    print("success\n")
    return 0
}


