// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Set<Int64>> = [#{1}]
    var b : List<Set<Int64>> = List<Set<Int64>>([#{1}].toArray())
    var c : List<Set<Int64>> = List<Set<Int64>>(Set<Int64>[](1,#{1}))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
