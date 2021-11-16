// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socketAddress_ = SocketAddress(IPv4, Array<UInt8>([192,168,0,1]), 8080)
    var mask_ = IPMask(20, 32)
    var data = socketAddress_.mask(mask_).toString()
    if(data != "192.168.0.0/20:8080") {
        return 1
    }
    return 0
}
