// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// check generic function definition
func Foo3<T>(a: T) : T {
    return a
}

func main(): Int64{
    return 0
}