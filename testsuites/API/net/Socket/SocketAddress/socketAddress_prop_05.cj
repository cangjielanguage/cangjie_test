// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socketAddress_ = SocketAddress(IPv4, Array<UInt8>([10,67,134,148]), 8080)
    var data = socketAddress_.port
    if(data != 8080)
    {
        return 1
    }
    return 0
}