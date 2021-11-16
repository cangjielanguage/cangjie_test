// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    mime1.add("1ab3","2")
    mime1.add("ab3","4")
    mime1.add("+ab3-abc","5")
    var mime2 = mime1.clone()
    if( case01(mime2.get("1ab3")) != "2"){
        return 1
    }
    if( case01(mime2.get("Ab3")) != "4"){
        return 2
    }
    if( case01(mime2.get("+ab3-Abc")) != "5"){
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