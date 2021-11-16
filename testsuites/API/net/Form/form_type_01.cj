// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("1=2&3=4&5=6")
func main(): Int64 {
    if( case01(form1.get("1")) != "2"){
        return 1
    }
    if( case01(form1.get("3")) != "4"){
        return 2
    }
    if( case01(form1.get("5")) != "6"){
        return 3
    }
    return 0
}
func case01(a:Option<String>){
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}