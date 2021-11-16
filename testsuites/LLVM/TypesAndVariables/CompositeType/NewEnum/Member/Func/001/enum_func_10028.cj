// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class C{}

enum A{
    a(Int64)
    static func b<T>(x:T) where T <: C {0}
}

func main(): Int64 {
    return A.b(1) // EXPECTED: regex no matching enum constructor 'b' for given arguments
}
