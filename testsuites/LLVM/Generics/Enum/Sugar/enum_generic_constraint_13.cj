// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var dt1: Int32 = 2
}

open class Foo2 {
    var dt2: Int32 = 3
}

class Bar1 <: Foo1 {
    var dt: Int32 = 4
}
class Bar2 <: Foo2 {
    var dt: Int32 = 5
}

enum Time<T1,T2> {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1= Bar1()
    var bar2: Bar2= Bar2()
    var time1 = Time<Bar1, Unit>.Day(bar1)
    var time2 = Time<Unit, Bar2>.Hour(bar2)
    var res1: Int32 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => 1
    }
    var res2: Int32 = match (time2) {
        case Day(x) => 1
        case Hour(x) => x.dt
    }
    if (res1 == 4 && res2 == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
