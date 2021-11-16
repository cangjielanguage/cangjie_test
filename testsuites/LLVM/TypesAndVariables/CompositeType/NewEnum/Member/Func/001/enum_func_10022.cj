// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<X>{
    a(Int64)
    func b<Y>(x:Y){0}
}

func main(): Int64 {
    return A<Unit>.a(1).b(1)
}
