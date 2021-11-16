// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookie = Cookie("qe12","",secure:false)
var cookie1 = Cookie("AFdf","79ab",secure:true)
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    if( a != "qe12="){
        return 1
    }
    if( a1 != "AFdf=79ab; Secure"){
        return 2
    }
    return 0
}