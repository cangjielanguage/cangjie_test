// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

enum A<T>{
    a(T)
    private func b(x:T){0}
}

func main(): Int64 {
    return A.a(1).b(1) // EXPECTED: regex no matching function declaration for function call 'b'
}
