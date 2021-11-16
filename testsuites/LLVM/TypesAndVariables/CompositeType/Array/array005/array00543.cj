// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(input:Array<Int64>): Array<Int64> {
    return input
}

func main(): Int64 {
    var a = @{1,0}
    return test(a)[1]
}
