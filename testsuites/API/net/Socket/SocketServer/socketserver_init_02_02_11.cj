// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    try{
        var socket2= SocketServer(TCP,"fffff:fffff:fffff:fffff:fffff:fffff:fffff:fffff", 20202)
    }catch(e:RuntimeException){
        return 0
    }
    return 1
}


