// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C{}

enum A{
    a(Int64)
    static func b<T>(x:T) where T <: C {0}
}

func main(): Int64 {
    return A.b(C())
}
