// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(Int64)
    func b<T>(x:T){0}
}

func main(): Int64 {
    return A.a(1).b(1)
}
