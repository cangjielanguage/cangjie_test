// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var MyTuple :Array<Int32>*Array<Float32> = (@{1,1},@{1.0,1.0})
    return 0
}
