// EXEC: %compiler %cmp_opt %f -o %output
// ASSERT: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var time = Time.Day(5)
    return 0
}

func main(): Int64 {
    return run()
}

