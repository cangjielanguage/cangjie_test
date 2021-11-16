// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args |compare %f
// ASSERT: scan Unix+Arraysize=4

from std import net.*

func main(){
    var ipmask=IPMask(Array<UInt8>([255,255,12,1]))
    var socketAddressWithMask = SocketAddressWithMask(IPv6, Array<UInt8>([192,168,0,1,3,4,5,6,192,168,0,1,3,4,5,6]), 8080,ipmask)
    try{
        var socketAddressWithMask1 = SocketAddressWithMask(Unix, Array<UInt8>([192,168,0,1]), 8080,ipmask)//unix:32
    }catch(e:RuntimeException)
    {
        print("Unix+Arraysize=4\n")
    }
}

