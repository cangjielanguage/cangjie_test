// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<ArrayList<Int64>> = [ArrayList<Int64>(1)]
    var b : List<ArrayList<Int64>> = List<ArrayList<Int64>>([ArrayList<Int64>(1)].toArray())
    var c : List<ArrayList<Int64>> = List<ArrayList<Int64>>(Array<ArrayList<Int64>>(1,ArrayList<Int64>(1)))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
