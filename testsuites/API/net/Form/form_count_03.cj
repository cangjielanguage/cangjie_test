// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("1=2&/n=a&ab=\u{597d}")
func main(): Int64 {
    if( case01(form1.get("1")) != "2"){
        return 1
    }
    if( case01(form1.get("/n")) != "a"){
        return 2
    }
    if( case01(form1.get("ab")) != "好"){
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