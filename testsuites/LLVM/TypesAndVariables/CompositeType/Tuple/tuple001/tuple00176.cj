// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var MyTuple : Int32*Int32 = (Int32(0),Int32(1.0))
    return 0
}
