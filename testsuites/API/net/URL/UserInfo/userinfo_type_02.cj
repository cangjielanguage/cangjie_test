// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var userinfo1 = UserInfo ("ABCD","efvb")
    var userinfo2 = UserInfo ("","ABc")
    var userinfo3 = UserInfo ("Abc","")
    var userinfo4 = UserInfo ("Hl")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if( a != "ABCD:efvb" ){
        return 1
    }
    if( b != ":ABc" ){
        return 2
    }
    if( c != "Abc" ){
        return 3
    }
    if( d != "Hl" ){
        return 4
    }
    return 0
}