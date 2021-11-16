// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype<T> = ArrayList<T>

func test(): Int64 {
    var a : List<mytype<Int64>> = [ArrayList<Int64>(1)]
    var b : List<mytype<Int64>> = List<mytype<Int64>>([ArrayList<Int64>(1)].toArray())
    var c : List<mytype<Int64>> = List<mytype<Int64>>(Array<mytype<Int64>>(1,ArrayList<Int64>(1)))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
