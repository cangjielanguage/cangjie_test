// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// check function definition
func Foo1(a: Int32, b: Int32): Int32 {
    return a + b
}

func main(): Int64{
    return 0
}