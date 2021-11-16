// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*

func main(){
    var socketAddress_ = SocketAddress(IPv5, Array<UInt8>([192,168,0,1]), 8080)// EXPECTED: regex error.*?no matching constructor for call 'SocketAddress'
}
