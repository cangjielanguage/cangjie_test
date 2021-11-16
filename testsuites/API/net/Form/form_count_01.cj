// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("")
var form2 = Form()
func main(): Int64 {
    form1.add("1","2")
    form2.add("a","b")
    if( case01(form1.get("1")) != "2"){
        return 1
    }
    if( case01(form2.get("a")) != "b"){
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