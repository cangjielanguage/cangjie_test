// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface C{
    func f():Int64
}

enum A<T> <: C{
    a(T)
    func f():Int64{0}
}

func main(): Int64 {
    return a(1).f()
}
