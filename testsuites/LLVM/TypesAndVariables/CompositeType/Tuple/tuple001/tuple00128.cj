// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : UInt64 = 1
    let myTuple : UInt64*UInt64 = (1,a)
    return 0
}
