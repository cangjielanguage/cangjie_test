// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s:String ="null"

if(s.isEmpty()!=false){
return 1
}

return 0
}