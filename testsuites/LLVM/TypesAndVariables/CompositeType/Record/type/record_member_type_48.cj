// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day(Int32) }

record Test {
    func f(x: TimeUnit): TimeUnit { return x}
}

let res = Test()
var time = res.f(TimeUnit.Day(14))
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