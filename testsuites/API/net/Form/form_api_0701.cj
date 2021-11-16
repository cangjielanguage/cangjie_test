// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("1=a")
func main(): Int64 {
    var form2 = form1.clone()
    var form3 = form2.clone()
    var form4 = form3.clone()
    var form5 = form4.clone()
    form1.add("2","8")
    if( case01(form5.get("1")) != "a"){
        return 1
    }
    if( case01(form2.get("2")) != "No"){
        return 2
    }
    if( case01(form1.get("2")) != "8"){
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