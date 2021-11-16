// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socketAddress1_ = SocketAddress("0000:0000:0000:0000:0000:0000:0000:0000", 0)
    var socketAddress2_ = SocketAddress("0000:0000:0000:0000:0000:0000:0000:0000", 65535)
    var socketAddress3_ = SocketAddress("ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 0)
    var socketAddress4_ = SocketAddress("ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 65535)
    var mask_ = IPMask(16, 128)
    socketAddress1_.mask(mask_)
    socketAddress2_.mask(mask_)
    socketAddress3_.mask(mask_)
    socketAddress4_.mask(mask_)
    return 0
}
