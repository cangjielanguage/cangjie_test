// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Float64> = [0.0]
    var b : List<Float64> = List<Float64>([Float64(0)].toArray())
    var c : List<Float64> = List<Float64>(Array<Float64>(1,0.0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
