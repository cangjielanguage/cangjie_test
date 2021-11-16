// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the lambda function definition with one input
func main(): Int64 {
    var f : (Int64) -> Int64 = {x => var z = x * 2; return z}
    return 0
}