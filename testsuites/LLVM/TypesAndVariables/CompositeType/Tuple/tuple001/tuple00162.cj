// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Int32 = 1
    var MyTuple : Int32*Int32*Int32 = (a,(1+1),(1))
    return 0
}
