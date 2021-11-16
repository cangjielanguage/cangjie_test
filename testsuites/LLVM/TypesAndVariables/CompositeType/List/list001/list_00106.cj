// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<UInt32> = [0]
    var b : List<UInt32> = List<UInt32>([UInt32(0)].toArray())
    var c : List<UInt32> = List<UInt32>(Array<UInt32>(1,0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
