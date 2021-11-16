// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*
func main()
{
    //net:TCP|UDP
    var socket1 = SocketServer(Mash,"127.0.0.1", 20202)// EXPECTED: regex error.*?no matching constructor for call 'SocketServer'
    return 0
}


