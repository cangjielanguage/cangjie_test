// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
type mytype = Int64
func test(a : mytype): Int64 {
    return 0
}

func main(): Int64 {
    var a : mytype = 1
    return test(a)
}
