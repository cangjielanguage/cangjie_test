// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socketAddress_ = SocketAddress(IPv4, Array<UInt8>([192,168,0,1]), 8080)
    var mask_ = IPMask(16, 32)
    socketAddress_.mask(mask_)
    return 0
}
