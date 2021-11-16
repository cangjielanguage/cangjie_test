// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form("A1\n@=\u{597d}#1a\b")
func main(): Int64 {
    if( case01(form1.get("A1\n@")) != "好#1a\b"){
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