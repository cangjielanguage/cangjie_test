// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("a=%26&1=%3D")
func main(): Int64 {
    if( case01("a") != "&"){
        return 1
    }
    if( case01("1") != "="){
        return 2
    }
    return 0
}
func case01(x:String){
    var a = form1.get(x)
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}