// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record R{}

func test(): Int64 {
    var a : List<R> = [R()]
    var b : List<R> = List<R>([R()].toArray())
    var c : List<R> = List<R>(Array<R>(1,R()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
