// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var mask = IPMask(Array<UInt8>(4, 0x68))
    var mask1 = IPMask(0x12, 0x23, 0x34, 0x45)
    var SocketAddressWithMask_ = SocketAddressWithMask (IPv4,Array<UInt8>([192,168,0,1]), 8080, mask)
    SocketAddressWithMask_.ipMask=mask1
    var str = SocketAddressWithMask_.ipMask.toString()
    if(str != "12233445") {
        return 1
    }
    0
}
