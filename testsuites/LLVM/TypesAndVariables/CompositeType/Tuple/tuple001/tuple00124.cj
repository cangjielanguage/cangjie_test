// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : UInt16 = 1
    let myTuple : UInt16*UInt16 = (1,a)
    return 0
}
