// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socketAddress_ = SocketAddress(IPv4, Array<UInt8>([192,168,0,1]), 8080)
    var mask_ = IPMask(0x12, 0x23, 0x34, 0x45)
    var data = socketAddress_.mask(mask_).toString()
    if(data != "0.32.0.1/12233445:8080") {
        return 1
    }
    return 0
}
