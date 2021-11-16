// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var address=Array<UInt8>([127,0,0,1])
    var result:String="127.0.0.0/8:20202"
    var ipmask=IPMask(Array<UInt8>([255,0,0,0]))
    var socketAddressWithMask = SocketAddressWithMask(IPv4,address,20202,ipmask)
    var socketAddressWithMask1 = SocketAddressWithMask(IPv4,address,20202,ipmask)
    var mask=socketAddressWithMask.mask().toString()
    var mask1=socketAddressWithMask1.mask().toString()
    if(mask!=result||mask1!=result)
    {
         print("mask=${mask}+mask1=${mask1}\n")
         return 1
    }
    return 0
}


