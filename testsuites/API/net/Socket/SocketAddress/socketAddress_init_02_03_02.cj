// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    try{
        var socketAddress1_ = SocketAddress("asd.198.0.52", 0)
    }catch(e:RuntimeException){
        return 0
    }
    return 1
}
