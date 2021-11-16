// EXEC: %compiler %stdx_cmp_opt  %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    //ipv4:0.0.0.0~255.255.255.255:error-address
    try{
        var socket1= Socket(TCP,"127.0.0.1", 20202,"256.256.256.256",3333)
    }catch(e:RuntimeException){
        return 0
    }
    return 1
}