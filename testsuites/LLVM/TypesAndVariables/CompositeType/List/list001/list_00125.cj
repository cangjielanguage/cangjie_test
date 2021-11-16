// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype = Unit

func test(): Int64 {
    var a : List<mytype> = [()]
    var b : List<mytype> = List<mytype>([()].toArray())
    var c : List<mytype> = List<mytype>(Array<mytype>(1,()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
