// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(T)
    operator func ()(x:T) {0}
}

func main(): Int64 {
    return A.a(1)(1)
}
