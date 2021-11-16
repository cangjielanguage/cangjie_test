// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socketAddress1_ = SocketAddress("0.0.0.0", 0)
    var socketAddress2_ = SocketAddress("0.0.0.0", 65535)
    var socketAddress3_ = SocketAddress("255.255.255.255", 0)
    var socketAddress4_ = SocketAddress("255.255.255.255", 65535)
    var mask_ = IPMask(16, 32)
    socketAddress1_.mask(mask_)
    socketAddress2_.mask(mask_)
    socketAddress3_.mask(mask_)
    socketAddress4_.mask(mask_)
    return 0
}
