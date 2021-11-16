// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a
    func b(x:T){0}
}


func main(): Int64 {
    A.a.b(1) // EXPECTED: regex generic type should be used with type argument
}
