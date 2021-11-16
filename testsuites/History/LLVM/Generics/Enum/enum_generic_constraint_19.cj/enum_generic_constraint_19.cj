// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var dt: Int32 = 2
}

class Bar1 <: Foo1 {}

open class Foo2<T> {
    var dt2: T
    init(x: T){
        dt2 = x
    }
}

class Bar2 <: Foo2<Int32> {
    var dt: Int32 = 4
    init(){super(dt)}
}

trait Add {
    func autoInc(left: This, step: This): This
}

trait Reduce<T> {
    func reduce(left: This, step: T): This
}

append Int32 with Add {
    func autoInc(left: Int32, step: Int32): Int32{
        return left + step
    }
}

append Int64 with Reduce<Int64> {
    func reduce(left: Int64, step: Int64): Int64{
        return left - step
    }
}

enum Time<T1, T2, T3, T4>
    where T1 <: Foo1, T2 <: Foo2<Int32>, T3 <: Add, T4 <: Reduce<T4> {
    Year(T1) | Month(T2) | Day(T3) | Hour(T4)
}

func run(): Int64 {
    var bar1: Bar1 = Bar1()
    var bar2: Bar2 = Bar2()
    var i1: Int32 = 3
    var i2: Int64 = 4
    var time1 = Time<Bar1, Bar2, Int32, Int64>.Year(bar1)
    var time2 = Time<Bar1, Bar2, Int32, Int64>.Month(bar2)
    var time3 = Time<Bar1, Bar2, Int32, Int64>.Day(i1)
    var time4 = Time<Bar1, Bar2, Int32, Int64>.Hour(i2)
    var res1: Int32 = match (time1) {
        case Year(x) => x.dt
        case Month(x) => 1
        case Day(x) => 2
        case Hour(x) => 3
    }
    var res2: Int32 = match (time2) {
        case Year(x) => 1
        case Month(x) => x.dt
        case Day(x) => 2
        case Hour(x) => 3
    }
    var res3: Int32 = match (time3) {
        case Year(x) => 1
        case Month(x) => 2
        case Day(x) => autoInc(x, 3)
        case Hour(x) => 3
    }
    var res4: Int64 = match (time4) {
        case Year(x) => 1
        case Month(x) => 2
        case Day(x) => 3
        case Hour(x) => reduce(x, i2)
       // case Hour(x) => reduce(x, 4) //B024 bug no matching function declaration for function call
    }

    if ( res1 == 2 && res2 == 4 && res3 == 6 && res4 == 0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
