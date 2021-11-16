// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var ipmask=IPMask(Array<UInt8>([255,255,12,1]))
    try{
        var socketAddressWithMask = SocketAddressWithMask(IPv6, Array<UInt8>([192,168,0,1]), 8080,ipmask)
    }catch(e:RuntimeException)
    {
         return 0
    }
    return 1
}


