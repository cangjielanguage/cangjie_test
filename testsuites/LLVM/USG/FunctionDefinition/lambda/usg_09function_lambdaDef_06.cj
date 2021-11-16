// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args 

func g(f  : () -> Int64) {
    return f()
}

func main(): Int64 {
    var f = g{ => var x = 1; return 2*x - 2}
    return f
}