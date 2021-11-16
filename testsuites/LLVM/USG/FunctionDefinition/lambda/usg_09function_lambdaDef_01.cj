// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the lambda function definition
func main(): Int64 {
    var f = {x : Int64, y : Int64 => var z = x + y; return z}
    return 0
}