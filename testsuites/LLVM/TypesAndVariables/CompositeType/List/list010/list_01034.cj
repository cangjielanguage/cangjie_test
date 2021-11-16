// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{static func test(){}}

func test(): Int64 {
    var a = [A.test()]
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
