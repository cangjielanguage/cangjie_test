// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

func foo<T>(x: TimeUnit<T>): TimeUnit<T> {
    return x
}

func run(): Int64 {
    var time = foo<Int64>(TimeUnit.Day(3))
    var res: Int32 = match (time) {
        case Day(x) => 16
    }
    if (res == 16) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}