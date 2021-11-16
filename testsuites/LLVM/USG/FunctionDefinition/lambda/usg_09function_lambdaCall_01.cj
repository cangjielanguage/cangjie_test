// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check  the lambda function call
func main(): Int64 {
    var a = {x : Int64, y : Int64 => x + y}(1, -1)
    return a
}