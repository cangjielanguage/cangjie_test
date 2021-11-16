// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var mask = IPMask(Array<UInt8>(4, 0x68))
    var SocketAddressWithMask_ = SocketAddressWithMask ("192.168.0.1", 8080, mask)
    var str = SocketAddressWithMask_.mask().toString()
    if(str!="64.40.0.0/68686868:8080") {
        return 1
    }
    0
}
