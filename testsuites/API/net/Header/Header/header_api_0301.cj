// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var header1 =Header ()
func main(): Int64 {
    header1.add("ab-abc","2")
    var header2 = header1.clone()
    var header3 = header2.clone()
    var header4 = header3.clone()
    var header5 = header4.clone()
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("ab-abc")
    if( str1 != "Ab-Abc"){
        return 1
    }
    if( case01(header5.get("Ab-Abc")) != "2"){
        return 2
    }
    print("===============")
    return 0
}
func case01(a:Option<String>){
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}