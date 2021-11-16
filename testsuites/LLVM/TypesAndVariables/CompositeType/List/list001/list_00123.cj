// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Array<Int64>> = [[1].toArray()]
    var b : List<Array<Int64>> = List<Array<Int64>>([[1].toArray()].toArray())
    var c : List<Array<Int64>> = List<Array<Int64>>(Array<Array<Int64>>(1,[1].toArray()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
