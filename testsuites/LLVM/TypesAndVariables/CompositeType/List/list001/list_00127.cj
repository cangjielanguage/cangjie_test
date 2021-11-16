// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Object> = [Object()]
    var b : List<Object> = List<Object>([Object()].toArray())
    var c : List<Object> = List<Object>(Array<Object>(1,Object()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
