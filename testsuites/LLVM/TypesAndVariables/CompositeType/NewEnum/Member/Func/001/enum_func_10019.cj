// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    mut func b(x:T){0} // EXPECTED: regex 'mut' modifier is illegal for function declaration in enum body
}

func main(): Int64 {
    return A.a(1).b(1)
}
