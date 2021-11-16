=// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*
func main(){
    var ipmask=IPMask(Array<UInt8>([127,0,0,1]))
    var socketAddressWithMask = SocketAddressWithMask("192.168.0.1",20202,"String")// EXPECTED: regex error.*?no matching constructor for call 'SocketAddressWithMask'
    var mask_result=socketAddressWithMask.mask().toString()
    return 0
}


