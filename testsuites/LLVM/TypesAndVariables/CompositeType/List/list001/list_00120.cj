// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Option<Int64>> = [None<Int64>]
    var b : List<Option<Int64>> = List<Option<Int64>>([None<Int64>].toArray())
    var c : List<Option<Int64>> = List<Option<Int64>>(Array<Option<Int64>>(1,None<Int64>))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
