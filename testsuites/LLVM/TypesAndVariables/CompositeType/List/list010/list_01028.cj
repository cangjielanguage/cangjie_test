// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{e(Int64)}

func test(): Int64 {
    var a = [E.e(1)]
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
