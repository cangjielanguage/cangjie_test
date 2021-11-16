// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<(Int64)->Int64> = [ { input:Int64 => input}]
    var b : List<(Int64)->Int64> = List<(Int64)->Int64>([ { input:Int64 => input}].toArray())
    var c : List<(Int64)->Int64> = List<(Int64)->Int64>(Array<((Int64)->Int64)>(1, { input:Int64 => input}))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
