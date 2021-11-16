// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<Range<Int64>> = [1..10]
    var b : List<Range<Int64>> = List<Range<Int64>>([1..10].toArray())
    var c : List<Range<Int64>> = List<Range<Int64>>(Array<Range<Int64>>(1,1..10))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
