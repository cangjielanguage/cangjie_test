// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    mime1.add("-abc","2")
    var mime2 = mime1.clone()
    var mime3 = mime2.clone()
    var mime4 = mime3.clone()
    var mime5 = mime4.clone()
    mime1.add("abc","2")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("-abc")
    var str2 = HeaderDfaUtil.CanonicalHeaderKey("abc")
    if( str1 != "-Abc"){
        return 1
    }
    if( str2 != "Abc"){
        return 2
    }
    if( case01(mime5.get("-Abc")) != "2"){
        return 3
    }
    if( case01(mime5.get("Abc")) != "No"){
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