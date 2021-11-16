// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the lambda definition with a func as an input value 
func g(f  : () -> Int64) {
    return f()
}

func main(): Int64 {
    var f = g(){ => var x = 1; return 2*x - 2}
    return f
}