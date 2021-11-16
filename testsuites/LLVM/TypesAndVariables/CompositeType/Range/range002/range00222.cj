// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a : Int64*Int64):Int64{
    return 0
}

func main(): Int64 {
    var r = (0,0)
    return test(r) + test((0,0))
}
