// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(?A<T>) | b
}

func main(): Int64 {
    var x = a<Int64>(b<Int64>)
    return 0
}
