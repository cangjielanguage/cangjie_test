// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s1:String ="Test String"
let s2:String ="\u{2000}"
if((s1+s2)=="Test String\u{2000}"){
return 0
}
return 1
}