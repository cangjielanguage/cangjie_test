// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var userinfo1 = UserInfo ("","")
    var userinfo2 = UserInfo ("aA323@","")
    var a = userinfo1.username()
    var b = userinfo2.username()
    if( a != "" ){
        return 1
    }
    if( b != "aA323@" ){
        return 2
    }
    return 0
}
