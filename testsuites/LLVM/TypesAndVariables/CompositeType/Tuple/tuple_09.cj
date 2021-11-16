// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(input:Int64*Int64) : Int64*Int64 {
    return input
}

func main(): Int64 {
    var a = test((1,0))
    var b = test((1,0))[1]
    return a[1]
}
