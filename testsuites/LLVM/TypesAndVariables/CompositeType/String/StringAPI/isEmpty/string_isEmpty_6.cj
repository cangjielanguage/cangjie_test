// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s:String =""

if(s.isEmpty()!=true){
return 1
}

return 0
}