// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
let s:String ="String"
if(s.toLower()!="string"){
return 1
}
return 0
}