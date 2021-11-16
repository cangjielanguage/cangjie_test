// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    mime1.add("ab","2")
    mime1.add("1ab","3")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("1ab")
    if( str1 != "1ab"){
        return 1
    }
    if( case01(mime1.get("1ab")) != "3"){
        return 2
    }
    return 0
}
func case01(a:Option<String>){
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}