// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Int32> = [0]
    var b : List<Int32> = List<Int32>([Int32(0)].toArray())
    var c : List<Int32> = List<Int32>(Array<Int32>(1,0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
