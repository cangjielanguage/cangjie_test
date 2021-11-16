// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the defult parameter value using the previous parameter
func calculation(a !: Int64 = 1, b !: Int64 = a -1) : Int64 {
    var c = b
    return c
}

func main(): Int64 {
    var x = calculation()
    return x
}