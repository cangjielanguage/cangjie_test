// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var userinfo1 = UserInfo ("1a3434434B")
    var userinfo2 = UserInfo ("")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    if( a != "1a3434434B" ){
        return 1
    }
    if( b != "" ){
        return 1
    }
    return 0
}
