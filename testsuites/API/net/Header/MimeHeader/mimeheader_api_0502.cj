// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    mime1.add("AB-ABC","2")
    mime1.add("AB-ABC","2")
    mime1.add("AB-ABC","2")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("AB-ABC")
    if( str1 != "Ab-Abc"){
        return 1
    }
    if( case01(mime1.get("Ab-Abc")) != "2"){
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