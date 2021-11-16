// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan ipv4:Arraysize=5
// ASSERT: scan ipv4:Arraysize=7

from std import net.*

func main(){
    var ipmask=IPMask(Array<UInt8>([255,255,12,1]))
    try{
        var socketAddressWithMask = SocketAddressWithMask(IPv4, Array<UInt8>([192,168,0,1,5]),20202,ipmask)
    }catch(e:RuntimeException)
    {
        print("ipv4:Arraysize=5\n")
    }
    try{
        var socketAddressWithMask1 = SocketAddressWithMask(IPv4, Array<UInt8>([192,168,0,1,5,7,8]),20202,ipmask)
    }catch(e:RuntimeException)
    {
        print("ipv4:Arraysize=7\n")
    }
}

