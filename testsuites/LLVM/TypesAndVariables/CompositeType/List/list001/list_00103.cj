// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Int16> = [0]
    var b : List<Int16> = List<Int16>([Int16(0)].toArray())
    var c : List<Int16> = List<Int16>(Array<Int16>(1,0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
