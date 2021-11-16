// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check function to be a parameter
func add(a: Int64, b: Int64) {a + b}
func calculation(calc: (Int64, Int64) -> Int64, a: Int64, b: Int64) : Int64 {
    var c = calc(a, b)
    return c
}

func main(): Int64 {
    var x = calculation(add, -1, 1)
    return x
}