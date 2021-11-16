// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> where T <: Int32 {
    Year(T)
}

func main(): Int64 {
    var time = TimeUnit<Int32>.Year(4)
    return 0
}
