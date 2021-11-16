// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<List<Int64>> = [[1]]
    var b : List<List<Int64>> = List<List<Int64>>([[1]].toArray())
    var c : List<List<Int64>> = List<List<Int64>>(Array<List<Int64>>(1,[1]))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
