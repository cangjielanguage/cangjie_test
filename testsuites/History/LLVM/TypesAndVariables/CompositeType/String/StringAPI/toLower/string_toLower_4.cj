// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s:String ="A"
if(s.toLower()!="a"){
return 1
}
return 0
}