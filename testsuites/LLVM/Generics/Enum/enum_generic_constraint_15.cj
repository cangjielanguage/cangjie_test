// ERRCHECK: %compiler -frontend -typecheck %cmp_opt %n.cj

open class Foo1<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

open class Foo2<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

class Bar1 <: Foo1<Bar1> {
    var dt: Int32 = 3
    init() { super(Bar1()) }  // EXPECTED: regex recursive constructor calling in class 'Bar1'
}
class Bar2 <: Foo2<Bar2> {
    var dt: Int32 = 4
    init() { super(Bar2()) }  // EXPECTED: regex recursive constructor calling in class 'Bar2'
}

enum Time<T1,T2>
    where T1 <: Foo1<T1>, T2 <: Foo2<T2>{
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1= Bar1()
    var bar2: Bar2= Bar2()
    var time1 = Time<Bar1, Bar2>.Day(bar1)
    var time2 = Time<Bar1, Bar2>.Hour(bar2)
    var res1: Int32 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => x.dt
    }
    var res2: Int32 = match (time2) {
        case Day(x) => x.dt
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
