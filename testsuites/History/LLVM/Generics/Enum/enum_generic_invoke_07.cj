// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T) | Day(T)
}

interface I {
    let time = TimeUnit<Int32>.Year(3)
    let day = Day<Int32>(4)
    let res1: Int32 = match time{
        case Year(x) => 2020
        case Day(x) => 16
    }
    let res2: Int32 = match day{
        case Year(x) => 2020
        case Day(x) => 16
    }
}

func run(): Int64 {
    if ( I.res1 == 2020 && I.res2 == 16) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
