// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var address = Array<UInt8>([192,168,7,1])
    var socketAddress_ = SocketAddress(IPv4, address, 8080)
    var data = socketAddress_.address
    for(i in 0..data.size())
    {
        if(data[i] != address[i])
        {
           return 1
        }
    }
    return 0
}
