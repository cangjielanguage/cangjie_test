// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the function assigned to a var and call it
func add(a: Int64, b: Int64) {
    return a + b
}

func main():Int64{
    var x = add
    let a = x(1,-1)
    return a
}