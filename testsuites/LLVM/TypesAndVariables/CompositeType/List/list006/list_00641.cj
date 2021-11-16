// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum X{
    get(Int64)
}

func test():X {
    var a : List<Int64> = [1,2,3]
    get(0)
}

func main(): Int64 {
    test()
    0
}
