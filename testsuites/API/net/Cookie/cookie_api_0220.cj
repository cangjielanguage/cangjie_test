// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookie = Cookie("hjA12","",raw: "Strict")
var cookie1 = Cookie("mAER9","79ab",raw: "Lax")
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    if( a != "hjA12="){
        return 1
    }
    if( a1 != "mAER9=79ab"){
        return 2
    }
    return 0
}