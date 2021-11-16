// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the function to be a named-parameter
func add(a: Int64, b: Int64) {a + b}
func calculation(a: Int64, b: Int64, calc !: (Int64, Int64) -> Int64 = add) : Int64 {
    var c = calc(a, b)
    return c
}

func main(): Int64 {
    var x = calculation(1, -1)
    return x
}