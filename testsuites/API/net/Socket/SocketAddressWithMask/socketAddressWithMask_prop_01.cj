// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var masks = Array<IPMask * String>([
        (IPMask(Array<UInt8>(5, 0x68)), "6868686868"),
        (IPMask(20, 32), "FFFFF000"),
        (IPMask(0x12, 0x23, 0x34, 0x45), "12233445")
    ])
    for(i in 0..masks.size())
    {
        var (mask,str) = masks[i]
        var SocketAddressWithMask_ = SocketAddressWithMask (IPv4,Array<UInt8>([192,168,0,1]), 8080, mask)
        if(SocketAddressWithMask_.ipMask.toString() != str) {
            return 1
        }
    }
   0
}
