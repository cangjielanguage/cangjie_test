// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    func b(x:T) // EXPECTED: regex function declaration must have function body
}

func main(): Int64 {
    return A.a(1).b(1)
}
