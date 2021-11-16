// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Int32*Int32 = (1,1)
    let myTuple : (Int32*Int32)*Int32 = (a,1)
    return 0
}
