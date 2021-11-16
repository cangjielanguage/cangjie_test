// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var fl: Float64 = 2.23e-308
    var time = Time.Day(fl)
    var res = match (time) {
        case Day(x) => x
    }
    if (res == 2.23e-308) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

