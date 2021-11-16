// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("1=a")
func main(): Int64 {
    form1.set("2","10")
    if( case01("2") != "10"){
        return 1
    }
    if( case01("1") != "a"){
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