// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var mask = IPMask(Array<UInt8>(4, 0x68))
    var mask1 = IPMask(0x12, 0x23, 0x34, 0x45)
    var SocketAddressWithMask1 = SocketAddressWithMask (SocketAddress("192.168.0.1", 8080), mask1)
    var SocketAddressWithMask2 = SocketAddressWithMask (SocketAddress(IPv4,Array<UInt8>([192,168,0,1]), 8080), mask)
    SocketAddressWithMask1.ipMask=mask
    SocketAddressWithMask2.ipMask=mask1
    var str1 = SocketAddressWithMask1.ipMask.toString()
    var str2 = SocketAddressWithMask2.ipMask.toString()
    if(str1 != "68686868"||str2 != "12233445") {
        return 1
    }

    0
}
