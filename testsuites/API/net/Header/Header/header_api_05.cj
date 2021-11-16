// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var header1 = Header ()
func main(): Int64 {
    header1.add("*ab--abc","2")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("*ab--abc")
    if( str1 != "*ab--Abc"){
        return 1
    }
    if( case01(header1.get("*ab--Abc")) != "2"){
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