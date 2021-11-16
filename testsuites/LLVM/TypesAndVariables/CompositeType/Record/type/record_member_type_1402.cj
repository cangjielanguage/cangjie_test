// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

record Test {
    var timeUnit: TimeUnit<Int32> = TimeUnit<Int32>.Day(14)
}

func run(): Int64 {
    let res = Test()
    var time = res.timeUnit
    var res1: Int32 = match (time) {
        case Day(x) => 2
    }
    if (res1 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
