// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the named parameter with the disordered input
func calculation(a !: Int64, b !: Int64) : Int64 {
    var c = a + b
    return c
}

func main(): Int64 {
    var x = calculation(b: -1, a: 1)
    return x
}