// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s ="\u{0000}"
var a ="花花"
var b ="Ελλη"

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