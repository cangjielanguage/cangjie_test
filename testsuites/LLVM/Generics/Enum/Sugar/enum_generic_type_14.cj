// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

func getValue() {
    return TimeUnit.Day(1)
}

func run(): Int64 {
    var time1 = getValue()
    var res = match (time1) {
        case Day(x) => x + 1
    }  

    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}