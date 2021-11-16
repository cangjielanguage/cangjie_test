// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T) | Hour(T)
}

func run(): Int64 {
    var time = Day(4)
    var time2 = Hour(4)
    return 0
}

func main(): Int64 {
    return run()
}
