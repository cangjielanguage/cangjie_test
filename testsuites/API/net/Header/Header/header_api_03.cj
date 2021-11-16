// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var header1 =Header ()
func main(): Int64 {
    header1.add("ab-abc","2")
    var header2 = header1.clone()
    header1.add("aab-abc","2")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("ab-abc")
    var str2 = HeaderDfaUtil.CanonicalHeaderKey("aab-abc")
    if( str1 != "Ab-Abc"){
        return 1
    }
    if( str2 != "Aab-Abc"){
        return 2
    }
    if( case01(header2.get("Ab-Abc")) != "2"){
        return 3
    }
    if( case01(header2.get("Aab-Abc")) != "No"){
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