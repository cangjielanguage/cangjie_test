// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Map<Int64,Int64>> = [#{1:1}]
    var b : List<Map<Int64,Int64>> = List<Map<Int64,Int64>>([#{1:1}].toArray())
    var c : List<Map<Int64,Int64>> = List<Map<Int64,Int64>>(Map<Int64,Int64>[](1,#{1:1}))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
