// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
//    var a : Range = 0..10
//    let myTuple : Range*Range = (a,1..10)
    var a = 0..10
    let myTuple = (a,1..10)
    return 0
}
