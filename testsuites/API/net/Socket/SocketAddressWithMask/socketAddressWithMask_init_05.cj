// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*

func main(){
    var SocketAddressWithMask_ = SocketAddressWithMask ("", IPMask(Array<UInt8>(4, 0x68)))// EXPECTED: regex error.*?no matching constructor for call 'SocketAddressWithMask'
}
