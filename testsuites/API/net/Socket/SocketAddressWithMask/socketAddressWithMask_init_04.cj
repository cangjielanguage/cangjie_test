// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*

func main(){
    var SocketAddressWithMask_ = SocketAddressWithMask (SocketAddress("192.168.0.1", 8080), "123")// EXPECTED: regex error.*?no matching constructor for call 'SocketAddressWithMask'
}
