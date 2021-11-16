// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socketAddress_ = SocketAddress("200.200.255.255", 8080)
    var data = socketAddress_.defaultMask
    var actualdata= data.getOrThrow()
    var (ones_, bits_) = actualdata.size()
    if(ones_ != 24 || bits_ != 32)
    {
        return 1
    }
    return 0
}