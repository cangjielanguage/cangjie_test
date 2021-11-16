// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Int8> = [0]
    var b : List<Int8> = List<Int8>([Int8(0)].toArray())
    var c : List<Int8> = List<Int8>(Array<Int8>(1,0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
