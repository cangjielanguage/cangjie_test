// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("1=我&a=3&A=/n")
func main(): Int64 {
    if( case01("1") != "我"){
        return 1
    }
    if( case01("a") != "3"){
        return 2
    }
    if( case01("A") != "/n"){
        return 3
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