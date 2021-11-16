// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Unit> = [()]
    var b : List<Unit> = List<Unit>([()].toArray())
    var c : List<Unit> = List<Unit>(Array<Unit>(1,()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
