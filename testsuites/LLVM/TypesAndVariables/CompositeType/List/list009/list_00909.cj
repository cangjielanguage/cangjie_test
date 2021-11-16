// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T> where T<: List<Int64>{
    e(T)
}

func main(): Int64 {
    e<List<Int64>>([1])
    return 0
}
