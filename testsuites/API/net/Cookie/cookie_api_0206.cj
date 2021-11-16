// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookie = Cookie("12AB","79ab",domain:"google.com")
var cookie1 = Cookie("12AB","",domain:".google.com")
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    if( a != "12AB=79ab; Domain=google.com"){
        return 1
    }
    if( a1 != "12AB=; Domain=google.com"){
        return 2
    }
    return 0
}