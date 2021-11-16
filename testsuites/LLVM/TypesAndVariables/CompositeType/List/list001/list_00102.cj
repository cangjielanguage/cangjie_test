// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<UInt8> = [0]
    var b : List<UInt8> = List<UInt8>([UInt8(0)].toArray())
    var c : List<UInt8> = List<UInt8>(Array<UInt8>(1,0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
