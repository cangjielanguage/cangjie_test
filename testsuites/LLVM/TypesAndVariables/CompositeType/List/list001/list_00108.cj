// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<UInt64> = [0]
    var b : List<UInt64> = List<UInt64>([UInt64(0)].toArray())
    var c : List<UInt64> = List<UInt64>(Array<UInt64>(1,0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
