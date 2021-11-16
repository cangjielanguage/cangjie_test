// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func getTime(x: Int64): Int64{
    return  x + 2
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var time = Time.Day(getTime)
    var res: Int64 = match (time) {
        case Day(x) => x(3)
    }
    if (res == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

