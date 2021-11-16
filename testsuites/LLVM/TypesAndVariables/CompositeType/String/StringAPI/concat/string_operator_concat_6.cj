// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
let stringList = ["",""]
if(String.join(stringList)==""){
return 0
}
return 1
}