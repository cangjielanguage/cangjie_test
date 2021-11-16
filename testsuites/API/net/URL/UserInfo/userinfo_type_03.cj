// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var userinfo1 = UserInfo ("你好","人民")
    var userinfo2 = UserInfo ("","开心")
    var userinfo3 = UserInfo ("愉快","")
    var userinfo4 = UserInfo ("努力")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if( a != "你好:人民" ){
        return 1
    }
    if( b != ":开心" ){
        return 2
    }
    if( c != "愉快" ){
        return 3
    }
    if( d != "努力" ){
        return 4
    }
    return 0
}