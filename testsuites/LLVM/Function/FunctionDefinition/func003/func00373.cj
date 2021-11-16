// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a : Int64, b : Int16): Int64 {
    return 0
}

func main(): Int64 {
    var a : Int64 = 0
    var b : Int16 = 0
    return test(a,b)
}
