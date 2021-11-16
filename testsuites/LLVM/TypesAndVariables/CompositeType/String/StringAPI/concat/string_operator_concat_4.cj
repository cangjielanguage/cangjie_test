// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
let stringList = ["test","\u{2000}"]
if(String.join(stringList)=="test\u{2000}"){
return 0
}
return 1
}