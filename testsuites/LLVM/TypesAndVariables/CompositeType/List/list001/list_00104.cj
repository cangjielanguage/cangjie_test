// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<UInt16> = [0]
    var b : List<UInt16> = List<UInt16>([UInt16(0)].toArray())
    var c : List<UInt16> = List<UInt16>(Array<UInt16>(1,0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
