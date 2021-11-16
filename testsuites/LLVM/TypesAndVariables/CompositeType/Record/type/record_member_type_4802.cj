// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

record Test {
    func f(x: TimeUnit<Int32>): TimeUnit<Int32> { return x}
}

let res = Test()
var time = res.f(TimeUnit<Int32>.Day(14))
var res1: Int32 = match (time) {
    case Day(x) => 2
}

func run(): Int64 {
    if (res1 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}