// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

record Test {
    let time: TimeUnit<Int32>
    init(x: TimeUnit<Int32>) {
        time = x
    }
}

func run(): Int64 {
    let res = Test(TimeUnit<Int32>.Day(14))
    var time = res.time
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