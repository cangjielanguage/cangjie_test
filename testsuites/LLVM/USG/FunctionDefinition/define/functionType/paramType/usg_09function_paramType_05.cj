// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the named parameter
func calculation(a !: Int64, b !: Int64) : Int64 {
    var c = a + b
    return c
}

func main(): Int64 {
    var x = calculation(a: 1, b: -1)
    return x
}