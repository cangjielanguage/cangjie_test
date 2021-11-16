// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Int32 = 1_1
    var b : Int32 = 0_1
    var MyTuple : Int32*Int32*Int32*Float32 = (a,b,-1_1,-1.1)
    return 0
}
