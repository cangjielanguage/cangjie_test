// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type a = Int64
type b = Int64

func test(): Int64 {
    var x : a = 1
    var y : b = 2
    var z = [x,y]
    return z.size() - 2
}

func main(): Int64 {
    return test()
}
