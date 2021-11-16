// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var userinfo1 = UserInfo ("",":Ra123")
    var userinfo2 = UserInfo ("Lqc123:","")
    var username1 = userinfo1.username()
    var password1 = userinfo1.password()
    var username2 = userinfo2.username()
    var password2 = userinfo2.password()
    if( username1 != "" ){
        return 1
    }
    if( case01(password1) != ":Ra123" ){
        return 2
    }
    if( username2 != "Lqc123:" ){
        return 3
    }
    if( case01(password2) != "" ){
        return 4
    }
    return 0
}
func case01(a:Option<String>){
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}