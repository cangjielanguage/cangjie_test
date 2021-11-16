// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*

func main(): Int64 {
    var cookie = Cookie("12AB","79ab")
    var a = cookie.toString()
    if( a != "12AB=79ab"){
        return 1
    }
    return 0
}