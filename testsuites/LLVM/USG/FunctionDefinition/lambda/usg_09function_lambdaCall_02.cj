// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the lambda function assigned to a variable
func main(): Int64 {
    var f = {x : Int64, y : Int64 => x + y}
    let x = f(1,-1)
    return x
}