// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1<T> {
    var dt1: T
    init(x: T){
        dt1 = x
    }
}

open class Foo2<T> {
    var dt2: T
    init(x: T){
        dt2 = x
    }
}

class Bar1 <: Foo1<String> {
    var dt = 3
    init(){super("abc")}
}
class Bar2 <: Foo2<Char> {
    var dt = 4
    init(){super('a')}
}

enum Time<T1,T2>{
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1= Bar1()
    var bar2: Bar2= Bar2()
    var time1 = Time<Bar1, Unit>.Day(bar1)
    var time2 = Time<Unit, Bar2>.Hour(bar2)
    var res1 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => 1
    }
    var res2 = match (time2) {
        case Day(x) => 1
        case Hour(x) => x.dt
    }
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
