// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the lambda function without '=>'
func main(): Int64 {
    var f = {=> var a = 1; var b = -1;return a +b}
    let a = f()
    return a
}