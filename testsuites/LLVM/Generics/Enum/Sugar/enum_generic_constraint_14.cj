// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var dt1 = 2
}

class Bar1 <: Foo1 {
    var dt = 4
}

enum Time<T1,T2>{
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1= Bar1()
    var time1  = Time<Bar1, Unit>.Day(bar1)
    var time2  = Time<Unit, Int64>.Hour(6)
    var res1 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => 1
    }
    var res2 = match (time2) {
        case Day(x) => 1
        case Hour(x) => x
    }
    if (res1 == 4 && res2 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
