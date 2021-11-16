// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(){
    var socketAddress_ = SocketAddress("0000:0000:0000:0000:0000:0000:0000:0000", 8080)
    var data = socketAddress_.zone
    var actualzone = match(data){
        case Some(x) => x
        case $None => "string is null"
    }
    if(actualzone != "string is null")
    {
       print("actualzone + ${actualzone}\n")
       return 1
    }
    return 0
}

