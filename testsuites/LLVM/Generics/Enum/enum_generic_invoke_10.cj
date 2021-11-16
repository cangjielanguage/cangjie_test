// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T) | Day(T)
}

func foo(): Int32 {
    var time = TimeUnit<Int32>.Year(3)
    var day = Day<Int32>(4)
    var res1: Int32 = match (time) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res2: Int32 = match (day) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    return res1 + res2
}

func run(): Int64 {
    var res = foo()
    if (res == 2036) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
