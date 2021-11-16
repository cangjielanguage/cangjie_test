// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Float32> = [0.0]
    var b : List<Float32> = List<Float32>([Float32(0)].toArray())
    var c : List<Float32> = List<Float32>(Array<Float32>(1,0.0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
