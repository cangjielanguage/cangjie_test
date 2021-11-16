// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookie = Cookie("hjA12","",sameSite:SameSite.Strict)
var cookie1 = Cookie("mAER9","79ab",sameSite:SameSite.Lax)
var cookie2 = Cookie("mAER9","79ab",sameSite:SameSite.None)
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    var a2 = cookie2.toString()
    if( a != "hjA12=; SameSite=Strict"){
        return 1
    }
    if( a1 != "mAER9=79ab; SameSite=Lax"){
        return 2
    }
    if( a2 != "mAER9=79ab; SameSite=None"){
        return 3
    }
    return 0
}