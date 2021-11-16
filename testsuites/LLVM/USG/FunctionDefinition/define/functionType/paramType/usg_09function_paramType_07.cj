// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the parameter with the defult value
func calculation(a !: Int64 = 1, b !: Int64 = -1) : Int64 {
    var c = a + b
    return c
}

func main(): Int64 {
    var x = calculation()
    return x
}