// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*

func main(){
    var socketAddress_ = SocketAddress(IPv4, Array<UInt8>([192,168,0,1]), 8080)
    var data = socketAddress_.mask("1234").toString()// EXPECTED: regex error.*?argument is mismatched with parameter type 'Class-IPMask'
}
