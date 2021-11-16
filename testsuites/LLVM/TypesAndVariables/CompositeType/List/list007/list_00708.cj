// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype = Int64

func test(): Int64 {
    var a : mytype = 1
    var b : Int64 = 2
    var x = [a,b]
    return x.size() - 2
}

func main(): Int64 {
    return test()
}
