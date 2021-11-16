// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

func getValue<T>(x: T) : TimeUnit<T> {
    return TimeUnit<T>.Day(x)
}

func run(): Int64 {
    var time1 = getValue<Int32>(1)
    var res: Int32 = match (time1) {
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