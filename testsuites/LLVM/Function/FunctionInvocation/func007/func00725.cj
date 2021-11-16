// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a:Int64):Int64{
    var b = a - 1
    if (b != 0) {
        test(b)
    }
    return b
}

func main(): Int64 {
    var a :Int64 = 10
    test(a)
    return 0
}
