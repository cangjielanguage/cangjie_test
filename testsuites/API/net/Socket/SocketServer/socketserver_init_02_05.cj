// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan socketserver can't support ipv6

from std import net.*
func main()
{
    try{
        var socket = SocketServer(UDP,"FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF", 20202)
    }catch(e:RuntimeException){
        print("socketserver can't support ipv6\n")
    }
    print("success\n")
    return 0
}