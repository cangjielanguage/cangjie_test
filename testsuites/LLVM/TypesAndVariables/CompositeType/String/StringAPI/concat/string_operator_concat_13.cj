// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
let stringList = ["汉","字"]
if(String.join(stringList)=="汉字"){
return 0
}
return 1
}