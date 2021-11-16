// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
let stringList = ["汉","\t"]
if(String.join(stringList)=="汉\t"){
return 0
}
return 1
}