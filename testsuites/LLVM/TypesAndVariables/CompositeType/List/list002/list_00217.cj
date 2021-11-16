// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype<T> = ArrayList<T>

func test<T>(i: T): Int64 {
    var a : List<mytype<T>> = [mytype<T>()]
    var b : List<mytype<T>> = List<mytype<T>>([mytype<T>()].toArray())
    var c : List<mytype<T>> = List<mytype<T>>(Array<mytype<T>>(1,mytype<T>()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
