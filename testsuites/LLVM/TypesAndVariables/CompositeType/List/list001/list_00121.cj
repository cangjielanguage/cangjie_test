// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C{}

func test(): Int64 {
    var a : List<C> = [C()]
    var b : List<C> = List<C>([C()].toArray())
    var c : List<C> = List<C>(Array<C>(1,C()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
