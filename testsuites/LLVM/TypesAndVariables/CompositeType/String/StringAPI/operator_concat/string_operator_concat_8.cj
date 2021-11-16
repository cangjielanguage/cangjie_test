// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s1:String =""
let s2:String ="在"
if((s1+s2)=="在"){
return 0
}
return 1
}