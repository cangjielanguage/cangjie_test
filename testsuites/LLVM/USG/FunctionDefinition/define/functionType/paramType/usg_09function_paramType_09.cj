// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args 

// check the parameter using the global value
var x : Int64 = 1
func calculation(a !: Int64 = 1, b !: Int64 = x - 1) : Int64 {
    var c = b
    return c
}

func main(): Int64 {
    var x = calculation()
    return x
}