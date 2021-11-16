// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the function call 
func add(a: Int64, b: Int64) {
    return a + b
}

func main():Int64{
    var x = add(1,-1)
    return x
}