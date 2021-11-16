// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{e}

func test(): Int64 {
    var a : List<E> = [e]
    var b : List<E> = List<E>([e].toArray())
    var c : List<E> = List<E>(Array<E>(1,e))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
