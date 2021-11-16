// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var x : Int64 = 1
    var y : Int64 = 2
    var z = [x,y]
    return z.size() - 2
}

func main(): Int64 {
    return test()
}
