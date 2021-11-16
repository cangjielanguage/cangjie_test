// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("A1sdsf=#%E4%BD%A05%25")
func main(): Int64 {
    print(case01(form1.get("A1sdsf")))
    if( case01(form1.get("A1sdsf")) != "#你5%"){
        return 1
    }
    return 0
}
func case01(a:Option<String>){
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}