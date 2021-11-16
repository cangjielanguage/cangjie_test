// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    internal func b(x:T){0}  // EXPECTED: regex 'internal' modifier is illegal for function declaration in enum body
}


func main(): Int64 {
    return 0
}
