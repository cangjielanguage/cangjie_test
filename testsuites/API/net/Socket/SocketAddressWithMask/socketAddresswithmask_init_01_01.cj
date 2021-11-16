// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var ipmask=IPMask(Array<UInt8>([255,255,255,255,255,255,255,0,0,0,0,0,0,0,0,0]))
    var socketAddressWithMask = SocketAddressWithMask(IPv6, Array<UInt8>([32,1,0,0,16,16,205,48,17,17,0,0,17,1,0,0]), 8080,ipmask)
    var mask_result=socketAddressWithMask.mask().toString()
    var result_socketAddressWithMask="[2001:0:1010:CD00::]/56:8080"
    if(mask_result!=result_socketAddressWithMask)
    {
         print("${mask_result}\n")
         return 1
    }
    return 0
}


