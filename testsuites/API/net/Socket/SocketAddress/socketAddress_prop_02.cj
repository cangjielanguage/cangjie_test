// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var hostAddress: String = "127.3.4.5"
    var socketAddress_ = SocketAddress(hostAddress, 8080)
    var data = socketAddress_.hostAddress
    if(data != hostAddress) {
        return 1
    }
    return 0
}
