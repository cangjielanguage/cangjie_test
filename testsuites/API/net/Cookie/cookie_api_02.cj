// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookie = Cookie("","")
func main(): Int64 {
    var a = cookie.toString()
    if( a != ""){
        return 1
    }
    return 0
}