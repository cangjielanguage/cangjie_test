// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(input:T):T{
    var a : T = input
    return a
}

func main(): Int64 {
    var res = test<ArrayList<Unit>>(ArrayList<Unit>(10))
    return res.size()
}