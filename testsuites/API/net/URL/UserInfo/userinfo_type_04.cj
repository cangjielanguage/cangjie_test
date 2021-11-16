// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var userinfo1 = UserInfo (":;","?.")
    var userinfo2 = UserInfo ("",",")
    var userinfo3 = UserInfo (";","")
    var userinfo4 = UserInfo (".,")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if( a != ":;:?." ){
        return 1
    }
    if( b != ":," ){
        return 2
    }
    if( c != ";" ){
        return 3
    }
    if( d != ".," ){
        return 4
    }
    return 0
}