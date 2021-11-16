// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s:String ="a"
if(s.toUpper()!="A"){
return 1
}
return 0
}