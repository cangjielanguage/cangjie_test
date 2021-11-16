// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookie = Cookie("12AB","")
var cookie1 = Cookie("","79ab天")
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    if( a != "12AB="){
        return 1
    }
    if( a1 != ""){
        return 2
    }
    return 0
}