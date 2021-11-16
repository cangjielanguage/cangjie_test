// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Int64 = 1
    let myTuple : Int64*Int64 = (1,a)
    return 0
}
