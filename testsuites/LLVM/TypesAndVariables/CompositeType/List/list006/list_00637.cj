// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<Int64> = List<Int64>(Array<Int64>(92,1))
    let getN = a.get(91)
    return 0
}

func main(): Int64 {
    test()
}
