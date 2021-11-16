// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var userinfo1 = UserInfo ("\t","\b")
    var userinfo2 = UserInfo ("","\r\n")
    var userinfo3 = UserInfo ("\'\"","")
    var userinfo4 = UserInfo ("\f\v")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if( a != "\t:\b" ){
        return 1
    }
    if( b != ":\r\n" ){
        return 2
    }
    if( c != "\'\"" ){
        return 3
    }
    if( d != "\f\v" ){
        return 4
    }
    return 0
}