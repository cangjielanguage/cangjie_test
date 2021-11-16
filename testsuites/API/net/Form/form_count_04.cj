// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var form1 = Form()
func main(): Int64 {
    var a = 0
    var b = 0
    for (i in 1..=100){
        a = i
        b= i+100
        var c = a.toString()
        var d = b.toString()
        form1.add(c,d)
        if(case01(form1.get(c)) != d){
            return i
        }
    }
    return 0
}
func case01(a:Option<String>){
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}