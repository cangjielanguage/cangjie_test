// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s ="\t"
var a ="\0"
var b ="\n"

if(s.isEmpty()!=false){
return 1
}
if(a.isEmpty()!=false){
return 1
}
if(b.isEmpty()!=false){
return 1
}

return 0
}