// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Float16> = [0.0]
    var b : List<Float16> = List<Float16>([Float16(0)].toArray())
    var c : List<Float16> = List<Float16>(Array<Float16>(1,0.0))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
