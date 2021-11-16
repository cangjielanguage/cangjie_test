// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a
    operator func ()(x:T) {0}
}

func main(): Int64 {
    return a<Int64>(1)
}