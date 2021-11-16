// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
let stringList = ["\u{2000}","\t"]
if(String.join(stringList)=="\u{2000}\t"){
return 0
}
return 1
}