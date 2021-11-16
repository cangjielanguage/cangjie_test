// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Int64> = [0]
    var b : List<Int64> = List<Int64>([Int64(0)].toArray())
    var c : List<Int64> = List<Int64>(Array<Int64>(1,0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
