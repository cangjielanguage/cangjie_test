// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*
func main()
{
    var ipmask=IPMask(Array<UInt8>([255,255,12,1]))
    var socketAddressWithMask = SocketAddressWithMask(IPv5, Array<UInt8>([192,168,0,1]), 8080,ipmask)// EXPECTED: regex error.*?no matching constructor for call 'SocketAddressWithMask'
    return 0
}


