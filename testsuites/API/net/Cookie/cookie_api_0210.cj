// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookie = Cookie("Ab123","",rawExpires:"time1")
var cookie1 = Cookie("Ab789","79ab",rawExpires:"time1")
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    if( a != "Ab123="){
        return 1
    }
    if( a1 != "Ab789=79ab"){
        return 2
    }
    return 0
}