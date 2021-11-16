// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : UInt32 = 1
    let myTuple : UInt32*UInt32 = (1,a)
    return 0
}
